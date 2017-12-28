//
//  GSKeyChain.h
//  exclamation
//
//  Created by 亘时科技 on 2017/6/19.
//  Copyright © 2017年 Guangzhou GSSING Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GSKeyChain : NSObject

+ (NSMutableDictionary *)getKeychainQuery:(NSString *)service;

//  保存
+ (void)save:(NSString *)service data:(id)data;

//  取出
+ (id)load:(NSString *)service;

//  删除
+ (void)delete:(NSString *)service;

@end