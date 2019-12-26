//
//  NSObject+_RT.h
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import <AppKit/AppKit.h>


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (_RT)

+ (NSArray <NSString *> *)getPropertyList:(NSObject *)obj;
+ (NSArray <NSString *> *)getVarList:(NSObject *)obj;

@end

NS_ASSUME_NONNULL_END
