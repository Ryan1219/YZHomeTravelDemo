//
//  GSKeyChainDataManager.m
//  exclamation
//
//  Created by 亘时科技 on 2017/6/19.
//  Copyright © 2017年 Guangzhou GSSING Technology Co., Ltd. All rights reserved.
//

#import "GSKeyChainDataManager.h"
#import "GSKeyChain.h"

@implementation GSKeyChainDataManager

/**
 *  删除数据
 */
+(void)deleteDataWithKey:(NSString *)key
{
	[GSKeyChain delete:key];
}

/**
 *  存储数据
 *
 */
+ (void) saveData:(NSData *)data withKey:(NSString *)key
{
	[GSKeyChain save:key data:data];
}
/**
 *  读入数据
 *
 */
+ (NSData *)readDataWithKey:(NSString *)key
{
	return (NSData *)[GSKeyChain load:key];
}

//删除字符串
+(void)deleteStringWithKey:(NSString *)key
{
	[GSKeyChain delete:key];
}

/**
 *  存储字符串
 *
 */
+ (void) saveString:(NSString *)string withKey:(NSString *)key
{
	[GSKeyChain save:key data:string];
}

/**
 *  读取字符串
 *
 */
+ (NSString *)readStringWithKey:(NSString *)key
{
	return (NSString *)[GSKeyChain load:key];
}

@end