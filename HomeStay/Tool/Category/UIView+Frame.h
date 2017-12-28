//
//  UIView+Frame.h
//  PanKeTong
//
//  Created by Allan on 14-6-19.
//  Copyright (c) 2014年 Qfang.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)

@property (nonatomic) CGFloat x;

@property (nonatomic) CGFloat y;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGFloat boundsWidth;

@property (nonatomic) CGFloat boundsHeight;

@property (nonatomic, assign) CGFloat left;

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

@end
