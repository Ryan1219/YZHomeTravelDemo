//
//  NSArray+Extension.h
//  HomeStay
//
//  Created by Q房通 on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Extension)

/**
 删除数组中所有的null
 @param dict 需要删除的数组
 @return 返回删除后的数组
 */
+ (NSArray *)arrayDeleteAllNullValue:(NSArray *)array;

@end
