//
//  NSObject+JsonTool.m
//  Fanggs
//
//  Created by Q房通 on 2017/9/30.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSObject+JsonTool.h"

@implementation NSObject (JsonTool)

/**
 *  对象转换为JSONData
 *
 *  @return NSData
 */
- (NSData *)objectToJsonData {
    return [NSJSONSerialization dataWithJSONObject:self options:0 error:nil];
}

/**
 *  对象转换为JSONString
 *
 *  @return NSString
 */
- (NSString *)objectToJSONString {
    
    if (![NSJSONSerialization isValidJSONObject:self]) {
        return @"";
    }
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}


/**
 *  将JSONString转换为对象
 *
 *  @param jsonString json字符串
 *
 *  @return 对象
 */
+ (id)objectFromJSONString:(NSString *)jsonString {
    return [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:0 error:nil];
}

/**
 *  将jsonData转换为对象
 *
 *  @param jsonData json字符串
 *
 *  @return 对象
 */
+ (id)objectFromJSONData:(NSData *)jsonData {
    
    return [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
}

@end






















