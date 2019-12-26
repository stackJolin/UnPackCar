//
//  OSXDragView.m
//  OSXUIKit
//
//  Created by houlin on 2019/12/25.
//

#import "OSXDragView.h"

@implementation OSXDragView

- (void)bindView {
    for (NSView *v in self.subviews) {
        [v unregisterDraggedTypes];
    }
    
    if (@available(macOS 10.13, *)) {
        [self registerForDraggedTypes:@[NSPasteboardTypeFileURL]];
    } else {
        // Fallback on earlier versions
    }
}

- (void)show {
    if (self.willShow) self.willShow();
}

- (void)dismiss {
    if (self.willDismiss) self.willDismiss();
}

- (NSDragOperation)draggingEntered:(id<NSDraggingInfo>)sender {
    
    if (self.isDragValid) {
        if (self.isDragValid(sender)) {
            [self show];
            return NSDragOperationCopy;
        }
    }
    
    return NSDragOperationNone;
}

- (void)draggingEnded:(id<NSDraggingInfo>)sender {
    [super draggingEnded:sender];
}

- (void)draggingExited:(id<NSDraggingInfo>)sender {
    [super draggingEnded:sender];
    [self dismiss];
}

- (BOOL)performDragOperation:(id<NSDraggingInfo>)sender {
    [super performDragOperation:sender];
    
    [self dismiss];
    
    if (self.dragInfoHandler) {
        self.dragInfoHandler(sender.draggingPasteboard);
    }
    
    return true;
}


@end
