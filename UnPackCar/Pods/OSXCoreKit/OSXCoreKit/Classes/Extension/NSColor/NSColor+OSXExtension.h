//
//  NSColor+OSXExtension.h
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import <AppKit/AppKit.h>
#import <Cocoa/Cocoa.h>

#define OSXColor(x) ([NSColor hex:x])
#define OSXAlphaColor(x, y) ([NSColor hex:x alpha:y])

#define CGColor(x) ([NSColor hex:x].CGColor)
#define CGAlphaColor(x, y) ([NSColor hex:x alpha:y].CGColor)


NS_ASSUME_NONNULL_BEGIN

@interface NSColor (OSXExtension)

+ (NSColor *)hex:(int)value alpha:(CGFloat)alpha;
+ (NSColor *)hex:(int)value;

@end

NS_ASSUME_NONNULL_END
