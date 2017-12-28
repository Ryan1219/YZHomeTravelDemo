//
//  NSString+ImageSize.h
//  HomeStay
//
//  Created by Ryan on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ImageSize)

/**
 生成100x135图片
 @param imageUrl imageUrl
 @return url
 */
+ (NSString *)serverImageSizeWith100x135:(NSString *)imageUrl;
/**
 生成180x135图片
 @param imageUrl imageUrl
 @return url
 */
+ (NSString *)serverImageSizeWith180x135:(NSString *)imageUrl;
/**
 生成386x289图片
 @param imageUrl imageUrl
 @return url
 */
+ (NSString *)serverImageSizeWith386x289:(NSString *)imageUrl;
/**
 生成600x450图片
 @param imageUrl imageUrl
 @return url
 */
+ (NSString *)serverImageSizeWith600x450:(NSString *)imageUrl;
/**
 生成800x600图片
 @param imageUrl imageUrl
 @return url
 */
+ (NSString *)serverImageSizeWith800x600:(NSString *)imageUrl;
/**
 自定义图片尺寸
 @param imageUrl imageUrl
 @param imageSize 尺寸
 @return url
 */
+ (NSString *)serverImageSizeWithImageUrl:(NSString *)imageUrl imageSize:(NSString *)imageSize;

@end










































