//
//  OSXAlert.m
//  OSXAlert
//
//  Created by houlin on 2019/12/27.
//

#import "OSXAlert.h"

//**********************************************************
// MARK : - OSXAlertAction
//**********************************************************
@interface OSXAlertAction : NSObject
@property (nonatomic, copy) dispatch_block_t block;
@property (nonatomic, assign) NSInteger actionId;
@end

@implementation OSXAlertAction
@end

//**********************************************************
// MARK : - OSXAlert
//**********************************************************
@interface OSXAlert()

@property (nonatomic, strong) NSDictionary<NSString *, OSXAlertAction *> *actionMap;
@property (nonatomic, assign) NSInteger actionId;

@end

@implementation OSXAlert

- (instancetype)init {
    if (self = [super init]) {
        self.actionId = 1000;
    }
    return self;
}

- (OSXAlert * _Nonnull (^)(NSString * _Nonnull))title {
    return ^(NSString *tmpTitle) {
        self.messageText = tmpTitle;
        return self;
    };
}

- (OSXAlert * _Nonnull (^)(NSString * _Nonnull))message {
    return ^(NSString *tmpMessage) {
        self.informativeText = tmpMessage;
        return self;
    };
}

- (OSXAlert * _Nonnull (^)(NSAlertStyle))style {
    return ^(NSAlertStyle tmpStyle) {
        self.alertStyle = tmpStyle;
        return self;
    };
}

- (OSXAlert * _Nonnull (^)(NSString * _Nonnull, dispatch_block_t _Nonnull))addAction {
    return ^(NSString *actionTitle, dispatch_block_t block) {
        if (self.actionMap[actionTitle]) {return self;}
        
        OSXAlertAction *action = [OSXAlertAction new];
        action.block = block;
        action.actionId = self.actionId;
        [self.actionMap setValue:action forKey:actionTitle];
        [self addButtonWithTitle:actionTitle];
        self.actionId += 1;
        return self;
    };
}

- (OSXAlert * (^)())show {
    return ^() {
        if (NSApp.mainWindow) {
            [self showSelf:NSApp.mainWindow];
        }
        else if (NSApp.keyWindow) {
            [self showSelf:NSApp.keyWindow];
        }
        else if (NSApp.windows.firstObject) {
            [self showSelf:NSApp.windows.firstObject];
        }
        return self;
    };
}

- (OSXAlert * (^)(NSWindow * _Nonnull))showInWindow {
    return ^(NSWindow *tmpWindow) {
        [self showSelf:tmpWindow];
        return self;
    };
}

- (void)showSelf:(NSWindow *)window {
    [window endSheet:window];
    
    [self beginSheetModalForWindow:window
                 completionHandler:^(NSModalResponse returnCode)
    {
        for (OSXAlertAction *action in self.actionMap) {
            if (action.actionId == returnCode) {
                if (action.block) action.block();
            }
        }
    }];
}
@end
