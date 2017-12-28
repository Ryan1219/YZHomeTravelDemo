//
//  GSKeyChainDataManager.h
//  exclamation
//
//  Created by 亘时科技 on 2017/6/19.
//  Copyright © 2017年 Guangzhou GSSING Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSKeyChainDataManager : NSObject

/**
 *  删除数据
 */
+(void)deleteDataWithKey:(NSString *)key;

/**
 *  存储数据
 *
 */
+ (void)saveData:(NSData *)data withKey:(NSString *)key;
/**
 *  读入数据
 *
 */
+ (NSData *)readDataWithKey:(NSString *)key;

/**
 *  删除字符串
 */
+(void)deleteStringWithKey:(NSString *)key;

/**
 *  存储字符串
 *
 */
+ (void)saveString:(NSString *)string withKey:(NSString *)key;

/**
 *  读取字符串
 *
 */
+ (NSString *)readStringWithKey:(NSString *)key;
@end