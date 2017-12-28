//
//  HSCommonMethod.h
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSCommonMethod : NSObject

/**
 保存对象到UserDefault
 @param key key
 @param value value
 */
+ (void)saveObjectToUserDefaultWithKey:(NSString *)key value:(id)value;
/**
 从UserDefault获取对象
 @param key key
 @return value
 */
+ (id)getObjectFromUserDefaultWithKey:(NSString *)key;
/**
 从UserDefault删除对象
 @param key key
 */
+(void)removeObjectFromUserDefaultWithKey:(NSString *)key;


@end































