//
//  NSObject+Extension.h
//  HomeStay
//
//  Created by Ryan on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

//格式化属性中的字符串
//NSNull等都会替换成nil
- (void)formatProperty;

@end
