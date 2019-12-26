//
//  NSView+Frame.m
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import "NSView+Frame.h"
#import <AppKit/AppKit.h>


@implementation NSView (Frame)

- (CGFloat)getOsx_left {
    return self.frame.origin.x;
}

- (void)setOsx_left:(CGFloat)osx_left {
    NSRect rect = self.frame;
    rect.origin.x = osx_left;
    self.frame = rect;
}

- (CGFloat)getOsx_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setOsx_right:(CGFloat)osx_right {
    NSRect rect = self.frame;
    rect.origin.x = osx_right - rect.size.width;
    self.frame = rect;
}

- (CGFloat)getOsx_top {
    return self.frame.origin.y;
}

- (void)setOsx_top:(CGFloat)osx_top {
    NSRect rect = self.frame;
    rect.origin.y = osx_top;
    self.frame = rect;
}

- (CGFloat)getOsx_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setOsx_bottom:(CGFloat)osx_bottom {
    NSRect rect = self.frame;
    rect.origin.y = osx_bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)getOsx_width {
    return self.frame.size.width;
}

- (void)setOsx_width:(CGFloat)osx_width {
    NSRect rect = self.frame;
    rect.size.width = osx_width;
    self.frame = rect;
}

- (CGFloat)getOsx_height {
    return self.frame.size.width;
}

- (void)setOsx_height:(CGFloat)osx_height {
    NSRect rect = self.frame;
    rect.size.height = osx_height;
    self.frame = rect;
}

- (NSSize)getOsx_size {
    return self.frame.size;
}

- (void)setOsx_size:(NSSize)osx_size {
    NSRect rect = self.frame;
    rect.size = osx_size;
    self.frame = rect;
}

- (CGFloat)getOsx_centerX {
    return self.frame.origin.x + self.frame.size.width * 0.5;
}

- (void)setOsx_centerX:(CGFloat)osx_centerX {
    NSRect rect = self.frame;
    rect.origin.x = osx_centerX - rect.size.width * 0.5;
    self.frame = rect;
}

- (CGFloat)getOsx_centerY {
    return self.frame.origin.y + self.frame.size.height * 0.5;
}

- (void)setOsx_centerY:(CGFloat)osx_centerY {
    NSRect rect = self.frame;
    rect.origin.y = osx_centerY - rect.size.height * 0.5;
    self.frame = rect;
}

- (NSPoint)getOsx_center {
    return NSMakePoint(self.osx_centerX, self.osx_centerY);
}

- (void)setOsx_center:(NSPoint)osx_center {
    NSRect rect = self.frame;
    rect.origin.x = osx_center.x - rect.size.width * 0.5;
    rect.origin.y = osx_center.y - rect.size.height * 0.5;
    self.frame = rect;
}

@end
