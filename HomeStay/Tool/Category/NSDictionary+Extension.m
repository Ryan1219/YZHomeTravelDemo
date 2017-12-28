//
//  NSDictionary+Extension.m
//  HomeStay
//
//  Created by Q房通 on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSDictionary+Extension.h"
#import "NSArray+Extension.h"

@implementation NSDictionary (Extension)

- (id)stringObjectForKey:(id)key
{
    if ([self.allKeys containsObject:key]) {
        id object = [self objectForKey:key];
        if ([object isEqual:[NSNull null]] || nil == object) {
            return @"";
        }else if ([object isKindOfClass:[NSNumber class]]) {
            return [(NSNumber *)object stringValue];
        }else {
            return object;
        }
    }
    else{
        return @"";
    }
}

- (id)numberObjectForKey:(id)key
{
    if ([self.allKeys containsObject:key]) {
        id object = [self objectForKey:key];
        if ([object isEqual:[NSNull null]] || nil == object) {
            return 0;
        }else {
            return object;
        }
    }
    else{
        return 0;
    }
}

- (BOOL)boolObjectForKey:(id)key
{
    if ([self.allKeys containsObject:key]) {
        id object = [self objectForKey:key];
        if ([object isEqual:[NSNull null]] || nil == object) {
            return NO;
        }else {
            return [object boolValue];
        }
    }
    else{
        return NO;
    }
}

- (id)arrayObjectForKey:(id)key
{
    id object = [self objectForKey:key];
    
    if ([object isKindOfClass:[NSArray class]]) {
        return object;
    }
    else {
        return [NSArray array];
    }
}

- (id)dictionaryObjectForKey:(id)key
{
    id object = [self objectForKey:key];
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        return object;
    }
    else {
        return [NSDictionary dictionary];
    }
}


+ (NSDictionary *)dictionaryDeleteAllNullValue:(NSDictionary *)dict {
    
    if (!dict || ![dict isKindOfClass:[NSDictionary class]]) return nil;
    
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    
    for (NSString *key in dict.allKeys) {
        
        id value= [dict objectForKey:key];
        
        if ([value isEqual:[NSNull null]]) {
            [mDict setObject:@"" forKey:key];
        }
        else {
            if ([value isKindOfClass:[NSDictionary class]]) {
                [mDict setObject:[self dictionaryDeleteAllNullValue:value] forKey:key];
            }
            else if ([value isKindOfClass:[NSArray class]]) {
                [mDict setObject:[NSArray arrayDeleteAllNullValue:value] forKey:key];
            }
        }
    }
    return mDict;
    
}

@end






































