//
//  NSDictionary+Extension.h
//  HomeStay
//
//  Created by Q房通 on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Extension)

/**
 判断key对应的value是否为string
 @param key key
 @return 返回值
 */
- (id)stringObjectForKey:(id)key;

/**
 判断key对应的value是否为number
 @param key key
 @return 返回值
 */
- (id)numberObjectForKey:(id)key;

/**
 判断key对应的value是否为bool
 @param key key
 @return 返回值
 */
- (BOOL)boolObjectForKey:(id)key;

/**
 判断key对应的value是否为array
 @param key key
 @return 返回值
 */
- (id)arrayObjectForKey:(id)key;

/**
 判断key对应的value是否为dictionary
 @param key key
 @return 返回值
 */
- (id)dictionaryObjectForKey:(id)key;


/**
 删除字典中所有的null
 @param dict 需要删除的字典
 @return 返回删除后的字典
 */
+ (NSDictionary *)dictionaryDeleteAllNullValue:(NSDictionary *)dict;

@end
























