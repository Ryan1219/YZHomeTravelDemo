//
//  HSStarView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSStarView.h"

#define Default_Star_Number 5 //默认星星个数
#define Default_Animation_Time_Interval 0.2 //默认动画延时

@interface HSStarView ()
/* <#description#> */
@property (nonatomic,strong) UIView *frontView;
/* 星星个数 */
@property (nonatomic,assign) NSInteger numberOfStars;

@end

@implementation HSStarView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        self.score = 1.0;
        self.hasAnimation = false;
        self.allowIncompleteStar = false;
        self.numberOfStars = Default_Star_Number;
    }
    return self;
}

- (void)configLayout {
    
    UIView *backgroundView = [self starViewWithImageName:@"common_star_gray"];
    self.frontView = [self starViewWithImageName:@"common_star_red"];
    
    [self addSubview:backgroundView];
    [self addSubview:self.frontView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}

- (UIView *)starViewWithImageName:(NSString *)imageName {
    UIView *backView = [[UIView alloc] initWithFrame:self.bounds];
    backView.clipsToBounds = true;
    backView.backgroundColor = [UIColor clearColor];
    for (NSInteger i = 0; i < self.numberOfStars;i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [backView addSubview:imageView];
    }
    return backView;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self configLayout];
    __weak typeof(self) weakSelf = self;
    CGFloat animationTimeInterval = self.hasAnimation ? Default_Animation_Time_Interval : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.frontView.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * weakSelf.score, weakSelf.bounds.size.height);
    }];
}

//MARK:--Action
- (void)tapAction:(UITapGestureRecognizer *)tap {
    //当前点
    CGPoint currentPoint = [tap locationInView:self];
    CGFloat offsetX = currentPoint.x;
    
    CGFloat realStarScore = offsetX / (self.bounds.size.width / self.numberOfStars);
    
    CGFloat starScore = self.allowIncompleteStar ? realStarScore : ceilf(realStarScore);
    
    self.score = starScore / self.numberOfStars;
    
    if (self.scoreDidChangeBlock) {
        self.scoreDidChangeBlock(self, self.score);
    }
    
    [self setNeedsLayout];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end




















































