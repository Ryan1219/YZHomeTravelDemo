//
//  NSObject+JsonTool.h
//  Fanggs
//
//  Created by Q房通 on 2017/9/30.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (JsonTool)

/**
 *  对象转换为JSONData
 *
 *  @return NSData
 */
- (nullable NSData *)objectToJsonData;

/**
 *  对象转换为JSONString
 *
 *  @return NSString
 */
- (nullable NSString *)objectToJSONString;

/**
 *  将JSONString转换为对象
 *
 *  @param jsonString json字符串
 *
 *  @return 对象
 */
+ (nullable id)objectFromJSONString:(nullable NSString *)jsonString;

/**
 *  将jsonData转换为对象
 *
 *  @param jsonData json字符串
 *
 *  @return 对象
 */
+ (nullable id)objectFromJSONData:(nullable NSData *)jsonData;



@end
