//
//  NSColor+OSXExtension.m
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import "NSColor+OSXExtension.h"

#import <AppKit/AppKit.h>


@implementation NSColor (OSXExtension)

+ (NSColor *)hex:(int)value {
    [self hex:value alpha:1];
}

+ (NSColor *)hex:(int)value alpha:(CGFloat)alpha {
    int r = value & 0xFF0000 >> 16;
    int g = value & 0xFF00 >> 8;
    int b = value & 0xFF;
    
    CGFloat red = r / 255.0;
    CGFloat greed = g / 255.0;
    CGFloat blue = b / 255.0;
    
    return [NSColor colorWithRed:red green:greed blue:blue alpha:alpha];
}

@end
