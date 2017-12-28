//
//  HSDashBorderView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//   虚线边框

#import <UIKit/UIKit.h>

@interface HSDashBorderView : UIView

/* 线宽 */
@property (nonatomic,assign) CGFloat lineWidth;
/* 实线长 */
@property (nonatomic,assign) CGFloat fullLineWidth;
/* 虚线长 */
@property (nonatomic,assign) CGFloat hideLineWidth;
/*  圆角角度 */
@property (nonatomic,assign) CGFloat cornerRadius;
/* 虚线的颜色 */
@property (nonatomic,strong) UIColor *lineColor;

@end
