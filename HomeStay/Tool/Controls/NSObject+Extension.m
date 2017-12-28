//
//  NSObject+Extension.m
//  HomeStay
//
//  Created by Ryan on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSObject+Extension.h"
#import <objc/runtime.h>

@implementation NSObject (Extension)


- (void)formatProperty {
    
    unsigned int outCount,i;
    
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    
    for (i = 0; i < outCount; i++) {
        
        objc_property_t property = properties[i];
        NSString *propertyName = [[NSString alloc] initWithCString:property_getName(property) encoding:NSUTF8StringEncoding];
        
        id propertyValue = [self valueForKey:propertyName];
        NSRange range;
        
        if ([propertyValue isKindOfClass:[NSString class]]) {
            range = [propertyValue rangeOfString:@"null>"];
            if (range.length <= 0) {
                range = [propertyValue rangeOfString:@"null)"];
            }
        }
        
        if ([propertyValue isKindOfClass:[NSNull class]] || ([propertyValue isKindOfClass:[NSString class]] && range.length > 0)) {
            [self setValue:nil forKey:propertyName];
        }
    }
}

@end

























































