//
//  NSString+Extension.m
//  Fanggs
//
//  Created by Q房通 on 2017/9/12.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

/**
 根据字体大小获取字体Size
 @param font 字体
 @param maxWidth 最大宽度
 @return 返回Size
 */
- (CGSize)sizeWithFont:(UIFont *)font maxWidth:(CGFloat)maxWidth {
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxWidth, MAXFLOAT);
    
    CGSize size = [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    return size;
}

- (BOOL)isContainSubstring:(NSString *)substring {
    
    if ([substring isKindOfClass:[NSString class]]) {
        NSRange range = [self rangeOfString:substring options: NSLiteralSearch];
        return (range.location != NSNotFound) ? true : false;
    }
    return false;
}

- (BOOL)isEmptyString {
    
    BOOL empty = false;
    if ([self isEqualToString:@""]) {
        empty = true;
    }
    return empty;
}

- (BOOL)isMatchedByRegex:(NSString *)pRegex
{
    NSString *pattern = pRegex;
    NSError *error = NULL;
    NSRegularExpression *regEx = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSRange range = [regEx rangeOfFirstMatchInString:self
                                             options:NSMatchingReportProgress
                                               range:NSMakeRange(0, self.length)];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

- (BOOL)isMatchRegex:(NSString *)aRegex
{
    return [[NSPredicate predicateWithFormat:@"SELF MATCHES %@", aRegex] evaluateWithObject:self];
}

- (BOOL)validateEmail:(NSString *)email {
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (BOOL)validatePassword:(NSString *)passWord {
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:passWord];
}

- (BOOL)isChinese {
    
    for (NSInteger index = 0; index < self.length; index++) {
        unichar ch = [self characterAtIndex:index];
        if (ch < 0x4E00 || ch > 0x9FFF) {
            return NO;
        }
    }
    return YES;
}

@end


























