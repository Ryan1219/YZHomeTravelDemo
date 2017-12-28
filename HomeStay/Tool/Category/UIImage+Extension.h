//
//  UIImage+Extension.h
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)

/**
 根据颜色生成图片 @param color 颜色
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

//是否有透明度
- (BOOL)hasAlpha;
//返回有透明度的图片
- (UIImage *)imageWithAlpha;
//图片边角设置遮罩图片
- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;
//圆角图片
- (UIImage *)createRoundedWithRadius:(CGFloat)radius;

//上传图片压缩
+ (UIImage *)imageByScalingAndCroppingForSize:(CGSize)targetSize andImage:(UIImage *)image;

@end
