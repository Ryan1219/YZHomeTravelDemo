//
//  HSDashBorderView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSDashBorderView.h"

@implementation HSDashBorderView



- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidth = 1.0;
        self.fullLineWidth = 6.0;
        self.hideLineWidth = 2.0;
        self.cornerRadius = 10.0;
        self.lineColor = [UIColor greenColor];
        self.layer.cornerRadius = self.cornerRadius;
        self.layer.masksToBounds = true;
    }
    return self;
}


//Only override drawRect: if you perform custom drawing.
//An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    // 线的宽度
    CGFloat lineWidth = self.lineWidth;
    
    // 根据线的宽度 设置画线的位置
    CGRect aRect = CGRectMake(lineWidth * 0.5, lineWidth * 0.5, rect.size.width - lineWidth , rect.size.height - lineWidth);
    
    // 获取图像上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 设置线的宽度
    CGContextSetLineWidth(context, lineWidth);
    
    // 设置线的颜色
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    
    // 设置虚线和实线的长度
    
    CGFloat lengths[] = { self.fullLineWidth, self.hideLineWidth };
    
    CGContextSetLineDash(context, 0, lengths, 1);
    
    // 画矩形path 圆角角度
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:aRect cornerRadius:self.cornerRadius];
    
    // 添加到图形上下文
    CGContextAddPath(context, bezierPath.CGPath);
    
    // 渲染
    CGContextStrokePath(context);
}


@end






















