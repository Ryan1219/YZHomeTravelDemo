//
//  HSAlertView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/20.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSAlertView : UIView

/**
 构建AlertView
 
 @param title title
 @param message message
 @param alertStyle alertStyle
 @param titleArray 数组
 @param hasCancel 是否有取消按钮
 @param controller 控制器
 @return 对象
 */
- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                   alertStyle:(UIAlertControllerStyle)alertStyle
                   titleArray:(NSArray *)titleArray
                    hasCancel:(BOOL)hasCancel
                   controller:(UIViewController *)controller;
/* 回调 */
@property (nonatomic,copy) void (^clickActionWithAlertViewBlock)(NSInteger index);

@end
