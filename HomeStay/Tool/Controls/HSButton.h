//
//  HSButton.h
//  HomeStay
//
//  Created by Ryan on 2017/12/22.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,HSButtonStyle){
    HSButtonUpTextDownImage = 0,
    HSButtonUpImageDownText,
    HSButtonLeftTextRightImage,
    HSButtonLeftImageRightText
};


@interface HSButton : UIButton

@property (nonatomic,assign) HSButtonStyle buttonStyle;
@property (nonatomic,assign) CGFloat distance;

@end
