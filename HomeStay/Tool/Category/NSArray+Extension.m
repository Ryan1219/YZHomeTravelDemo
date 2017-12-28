//
//  NSArray+Extension.m
//  HomeStay
//
//  Created by Q房通 on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSArray+Extension.h"
#import "NSDictionary+Extension.h"

@implementation NSArray (Extension)

+ (NSArray *)arrayDeleteAllNullValue:(NSArray *)array {
    
    NSMutableArray *mArray = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        
        NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
        
        for (NSString *key in dict.allKeys) {
            
            id value = [dict objectForKey:key];
            
            if ([value isEqual:[NSNull null]]) {
                [mDict setObject:@"" forKey:key];
            }
            else {
                if ([value isKindOfClass:[NSDictionary class]]) {
                    [mDict setObject:[NSDictionary dictionaryDeleteAllNullValue:value] forKey:key];
                }
                else if ([value isKindOfClass:[NSArray class]]) {
                    [mDict setObject:[self arrayDeleteAllNullValue:value] forKey:key];
                }
                else {
                    [mDict setObject:value forKey:key];
                }
            }
        }
        [mArray addObject:mDict];
    }
    return mArray;
}





@end


































