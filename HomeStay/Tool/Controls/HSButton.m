//
//  HSButton.m
//  HomeStay
//
//  Created by Ryan on 2017/12/22.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSButton.h"
#import "UIView+Frame.h"

@implementation HSButton

- (instancetype)init {
    self = [super init];
    if (self) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.distance = 2.0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat btnW = self.frame.size.width;
    CGFloat btnH = self.frame.size.height;
    
    CGFloat imageW = self.imageView.frame.size.width;
    CGFloat imageH = self.imageView.frame.size.height;
    
    switch (self.buttonStyle) {
        case HSButtonUpTextDownImage: {
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.titleLabel.x = 0;
            self.titleLabel.y = 0;
            self.titleLabel.width = btnW;
            self.titleLabel.height = btnH - imageH - self.distance;
            
            self.imageView.x = (btnW - imageW) / 2;
            self.imageView.y = btnH - imageH;
            self.imageView.width = imageW;
            self.imageView.height = imageH;
        }
            break;
        case HSButtonUpImageDownText: {
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.imageView.x = (btnW - imageW) / 2;
            self.imageView.y = 0;
            self.imageView.width = imageW;
            self.imageView.height = imageH;
            
            self.titleLabel.x = 0;
            self.titleLabel.y = imageH + self.distance;
            self.titleLabel.width = btnW;
            self.titleLabel.height = btnH - imageH - self.distance;
        }
            break;
        case HSButtonLeftTextRightImage: {
            self.titleLabel.textAlignment = NSTextAlignmentRight;
            self.titleLabel.x = 0;
            self.titleLabel.y = 0;
            self.titleLabel.width = btnW - imageW - self.distance;
            self.titleLabel.height = btnH;
            
            self.imageView.x = btnW - imageW;
            self.imageView.y = (btnH - imageH)/2;
            self.imageView.width = imageW;
            self.imageView.height = imageH;
        }
            
            break;
        case HSButtonLeftImageRightText: {
            self.titleLabel.textAlignment = NSTextAlignmentLeft;
            self.imageView.x = 0;
            self.imageView.y = (btnH - imageH)/2;
            self.imageView.width = imageW;
            self.imageView.height = imageH;
            
            self.titleLabel.x = imageW + self.distance;
            self.titleLabel.y = 0;
            self.titleLabel.width = btnW - imageW - self.distance;
            self.titleLabel.height = btnH;
        }
            break;
        default:
            break;
    }
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
