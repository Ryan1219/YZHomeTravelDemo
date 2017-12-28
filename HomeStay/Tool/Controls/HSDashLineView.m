//
//  HSDashLineView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/14.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSDashLineView.h"

@implementation HSDashLineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.lineWidth = 1.0;
        self.lineColor = [UIColor greenColor];
        self.fullLineWidth = 4.0;
        self.hideLineWidth = 2.0;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context =UIGraphicsGetCurrentContext();
    //开始一个起始路径
    CGContextBeginPath(context);
    //设置线条粗细宽度
    CGContextSetLineWidth(context, self.lineWidth);
    //设置线条的颜色
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    //lengths说明虚线如何交替绘制,lengths的值{4，4}表示先绘制4个点，再跳过4个点，如此反复
    CGFloat lengths[] = {self.fullLineWidth,self.hideLineWidth};
    //画虚线
    CGContextSetLineDash(context, 0, lengths,1);
    //设置开始点的位置
    CGContextMoveToPoint(context, 0.0, self.frame.size.height/2);
    //设置终点的位置
    CGContextAddLineToPoint(context,self.frame.size.width,self.frame.size.height/2);
    //开始绘制虚线
    CGContextStrokePath(context);
    //封闭当前线路
    CGContextClosePath(context);
}

//- (void)layoutSubviews {
//    [super layoutSubviews];
//
//    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
//    [shapeLayer setBounds:self.bounds];
//    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame))];
//    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
//    //  设置虚线颜色
//    [shapeLayer setStrokeColor:self.lineColor.CGColor];
//    //  设置虚线宽度
//    [shapeLayer setLineWidth:CGRectGetHeight(self.frame)];
//    [shapeLayer setLineJoin:kCALineJoinRound];
////    shapeLayer.cornerRadius = self.lineLength / 2;
////    shapeLayer.masksToBounds = true;
//    //  设置线宽，线间距
//    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithFloat:self.lineLength],[NSNumber numberWithFloat:self.lineSpace],nil]];
//    //  设置路径
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 0, 0);
//    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(self.frame), 0);
//    [shapeLayer setPath:path];
//    CGPathRelease(path);
//    //  把绘制好的虚线添加上来
//    [self.layer addSublayer:shapeLayer];
//}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
