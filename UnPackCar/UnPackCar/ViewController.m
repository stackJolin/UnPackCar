//
//  ViewController.m
//  UnPackCar
//
//  Created by houlin on 2019/12/25.
//  Copyright © 2019 houlin. All rights reserved.
//

#import "ViewController.h"
#import <OSXUIKit/OSXDragView.h>
#import <OSXCoreKit/OSXCommenMacro.h>
#import <OSXCoreKit/NSColor+OSXExtension.h>
#import <Masonry/Masonry.h>
#import <OSXCoreKit/NSObject+_RT.h>

@interface ViewController()

@property (nonatomic, strong) OSXDragView *dragView;
@property (nonatomic, strong) NSImageView *ivIcon;
@property (nonatomic, strong) NSTextField *label;
@property (nonatomic, strong) NSProgressIndicator *vProgress;

@end

@implementation ViewController

- (void)viewDidAppear {
    [super viewDidAppear];
    self.vProgress.doubleValue = 5;
    [self.vProgress startAnimation:nil];
}

- (void)bindView {
    self.view.wantsLayer = YES;
    self.view.layer.backgroundColor = CGColor(0x2B2B2B);
    
    [self.view addSubview:self.ivIcon];
    [self.view addSubview:self.label];
    [self.view addSubview:self.vProgress];
    [self.view addSubview:self.dragView];
}

- (void)bindLayout {
    
    [self.ivIcon mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).offset(-10);
    }];
    
    [self.label mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.ivIcon.mas_bottom).offset(10);
        make.centerX.equalTo(self.ivIcon);
    }];
    
    [self.dragView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.vProgress mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-5);
        make.height.mas_equalTo(20);
    }];
}

- (void)bindAction {
    
    self.dragView.willShow = ^{};
    
    self.dragView.willDismiss = ^{};
    
    WKSelf(self)
    self.dragView.isDragValid = ^BOOL(id<NSDraggingInfo> _Nonnull info) {
        NSArray *objects = [info.draggingPasteboard readObjectsForClasses:@[[NSURL class]] options:nil];
        
        if (objects.count != 1) {return NO;} // only support one file
        
        NSURL *url = (NSURL *)objects[0];
        
        BOOL isDirectory = NO;
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:url.path isDirectory:&isDirectory];
        
        if (isExist) {
            if (isDirectory) {return NO;}
            if (![[url.path pathExtension] isEqualToString:@"car"]) {return NO;}
            
            return YES;
        }
        
        return NO;
    };
    
    self.dragView.dragInfoHandler = ^(NSPasteboard * _Nonnull info) {
        NSArray *objects = [info readObjectsForClasses:@[[NSURL class]] options:nil];
        
        if (objects.count != 1) {return;} // only support one file
        
        NSURL *url = (NSURL *)objects[0];
        
        BOOL isDirectory = NO;
        BOOL isExist = [[NSFileManager defaultManager] fileExistsAtPath:url.path isDirectory:&isDirectory];
        
        if (isExist) {
            if (isDirectory) {return;}
            if (![[url.path pathExtension] isEqualToString:@"car"]) {return;}
            
            [wkself unPack:url.path];
        }
    };
}

- (OSXDragView *)dragView {
    if (!_dragView) {
        _dragView = [OSXDragView new];
    }
    return _dragView;
}

- (NSImageView *)ivIcon {
    if (!_ivIcon) {
        _ivIcon = [NSImageView new];
        _ivIcon.image = [NSImage imageNamed:@"upload_n"];
    }
    return _ivIcon;
}

- (NSTextField *)label {
    if (!_label) {
        _label = [NSTextField new];
        _label.editable = NO;
        _label.bordered = NO;
        _label.stringValue = @"Drop your xx.car here!";
        _label.font = [NSFont systemFontOfSize:14];
        _label.backgroundColor = [NSColor clearColor];
    }
    return _label;
}

- (NSProgressIndicator *)vProgress {
    if (!_vProgress) {
        _vProgress = [NSProgressIndicator new];
        _vProgress.style = NSProgressIndicatorStyleBar;
        _vProgress.indeterminate = YES;
        _vProgress.bezeled = YES;
        _vProgress.controlSize = NSControlSizeMini;
        _vProgress.displayedWhenStopped = YES;
        _vProgress.minValue = 0;
        _vProgress.maxValue = 10;
        _vProgress.hidden = YES;
    }
    return _vProgress;
}

//**********************************************************
// MARK : - Extension
//**********************************************************

- (void)unPack:(NSString *)sourcePath {
    NSString *preDpath = [sourcePath stringByDeletingPathExtension];
    
    BOOL isExist = YES;
    BOOL isDir = NO;
    NSInteger index = 0;
    BOOL isStop = NO;
    NSString *tmpPath = @"";
    do {
        NSString *subx = [NSString stringWithFormat:@"%ld", index];
        NSString *path = [preDpath stringByAppendingString:subx];
        isExist = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
        
        if (isExist) {
            isStop = NO;
        }
        else {
            if (!(isExist && isDir)) { // create dir
                BOOL createSuccess = [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
                
                if (createSuccess) {
                    tmpPath = path;
                }
                isStop = YES;
            }
        }
        index += 1;
    }
    while (!isStop);
    
    if (tmpPath.length == 0) return;
    
    dispatch_sync(dispatch_get_global_queue(0, 0), ^{
        @autoreleasepool {
            exportCarFileAtPath(sourcePath, tmpPath, ^(CGFloat value) {
                if (value > 0.9999 && value <= 1) {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self showSuccess:tmpPath];
                    });
                }
            });
        }
    });
}

- (void)showSuccess:(NSString *)path {
    NSAlert *alert = [NSAlert new];
    alert.alertStyle =  NSAlertStyleInformational;
    alert.messageText = @"Success";
    [alert addButtonWithTitle:@"OK"];
    alert.informativeText = path;
    [alert beginSheetModalForWindow:self.view.window completionHandler:^(NSModalResponse returnCode) {
        
    }];
}

@end


