//
//  NSString+Extension.h
//  Fanggs
//
//  Created by Q房通 on 2017/9/12.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (Extension)
/**
 根据字体大小获取字体Size
 @param font 字体
 @param maxWidth 最大宽度
 @return 返回Size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth;

//判断是否包含子字符串
- (BOOL)isContainSubstring:(NSString *)substring;

//判断是否是空字符
- (BOOL)isEmptyString;

//
- (BOOL)isMatchedByRegex:(NSString *)pRegex;

//
- (BOOL)isMatchRegex:(NSString *)aRegex;

// 判断是否是有效邮箱
- (BOOL)validateEmail:(NSString *)email;

// 判断密码格式对不对,是否包含字母数字且是6位以上
- (BOOL)validatePassword:(NSString *)passWord;

//判断是否为中文
- (BOOL)isChinese;


@end









































