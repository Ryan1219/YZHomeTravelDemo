//
//  HSStarView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HSStarView : UIView

/* 得分值，范围为0~1，默认1 */
@property (nonatomic,assign) CGFloat score;
/* 是否允许动画，默认为NO */
@property (nonatomic,assign) BOOL hasAnimation;
/* 评分时是否允许不是整星，默认为NO */
@property (nonatomic,assign) BOOL allowIncompleteStar;
/* 回调分值*/
@property (nonatomic,copy) void (^scoreDidChangeBlock)(HSStarView *starView,CGFloat score);

@end




























