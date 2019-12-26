//
//  NSView+Frame.h
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSView (Frame)

@property (nonatomic, assign) CGFloat osx_left;
@property (nonatomic, assign) CGFloat osx_right;
@property (nonatomic, assign) CGFloat osx_top;
@property (nonatomic, assign) CGFloat osx_bottom;

@property (nonatomic, assign) CGFloat osx_width;
@property (nonatomic, assign) CGFloat osx_height;
@property (nonatomic, assign) NSSize osx_size;

@property (nonatomic, assign) CGFloat osx_centerX;
@property (nonatomic, assign) CGFloat osx_centerY;
@property (nonatomic, assign) NSPoint osx_center;

@end

NS_ASSUME_NONNULL_END
