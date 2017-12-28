//
//  HSCommonMethod.m
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSCommonMethod.h"

@implementation HSCommonMethod


/**
 保存对象到UserDefault
 @param key key
 @param value value
 */
+ (void)saveObjectToUserDefaultWithKey:(NSString *)key value:(id)value {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
/**
 从UserDefault获取对象
 @param key key
 @return value
 */
+ (id)getObjectFromUserDefaultWithKey:(NSString *)key {
    id value  = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return value;
}
/**
 从UserDefault删除对象
 @param key key
 */
+(void)removeObjectFromUserDefaultWithKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end


















