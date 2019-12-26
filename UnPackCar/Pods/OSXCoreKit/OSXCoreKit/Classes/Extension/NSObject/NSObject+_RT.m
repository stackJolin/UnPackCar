//
//  NSObject+_RT.m
//  CocoaLumberjack
//
//  Created by houlin on 2019/12/26.
//

#import "NSObject+_RT.h"

#import <Foundation/Foundation.h>
#import <AppKit/AppKit.h>
#import <objc/runtime.h>


@implementation NSObject (_RT)

+ (NSArray <NSString *> *)getPropertyList:(NSObject *)obj {
    unsigned int count;
    Ivar *ivars = class_copyIvarList(obj.class, &count);
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    for(int i = 0; i < count; i ++){
        Ivar ivar = ivars[i];
        const char *name = ivar_getName(ivar);
        NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
        [tempArray addObject:propertyName];
    }
    return tempArray;
}


+ (NSArray <NSString *> *)getVarList:(NSObject *)obj {
    
    unsigned int count;
    
    objc_property_t *properties = class_copyPropertyList(obj.class, &count);
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for(int i = 0; i < count; i ++){
        objc_property_t someProperty = properties[i];
        const char *name = property_getName(someProperty);
        NSString *propertyName = [[NSString alloc] initWithUTF8String:name];
        [tempArray addObject:propertyName];
    }
    return tempArray;
}

@end
