//
//  UINavigationBar+background.m
//  JMPanKeTong
//
//  Created by yanghy on 16/5/31.
//  Copyright © 2016年 Qfang.com. All rights reserved.
//

#import "UINavigationBar+background.h"
#import <objc/runtime.h>
#import "UIImage+Extension.h"


@implementation UINavigationBar (background)
static char overlayKey;

- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if(SYSTEMVERSION_FLOAT < 11.0){
        if (!self.overlay) {
            [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
            self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) + 20)];
            self.overlay.userInteractionEnabled = NO;
            self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            [self insertSubview:self.overlay atIndex:1];
        }
        
        self.overlay.backgroundColor = backgroundColor;
    }
    else{
        CGFloat red   = 0.0;
        CGFloat green = 0.0;
        CGFloat blue  = 0.0;
        CGFloat alpha = 0.0;
        [backgroundColor getRed:&red green:&green blue:&blue alpha:&alpha];
//        if(!CGColorEqualToColor(self.backgroundColor.CGColor, backgroundColor.CGColor))
            [self setBackgroundImage:[UIImage imageWithColor:backgroundColor]
                       forBarMetrics:UIBarMetricsDefault];
//        self.backgroundColor = backgroundColor;
        UIView *barBackgroundView = [self.subviews objectAtIndex:0];// _UIBarBackground
        UIImageView *backgroundImageView = [[barBackgroundView subviews] objectAtIndex:0];// UIImageView
        if (self.isTranslucent) {
            if (backgroundImageView != nil && backgroundImageView.image != nil) {
                barBackgroundView.alpha = alpha;
            } else {
                UIView *backgroundEffectView = [[barBackgroundView subviews] objectAtIndex:1];// UIVisualEffectView
                if (backgroundEffectView != nil) {
                    backgroundEffectView.alpha = alpha;
                }
            }
        } else {
            barBackgroundView.alpha = alpha;
        }
    }
}

- (void)lt_setTranslationY:(CGFloat)translationY
{
    self.transform = CGAffineTransformMakeTranslation(0, translationY);
}

- (void)lt_setElementsAlpha:(CGFloat)alpha
{
    [[self valueForKey:@"_leftViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    [[self valueForKey:@"_rightViews"] enumerateObjectsUsingBlock:^(UIView *view, NSUInteger i, BOOL *stop) {
        view.alpha = alpha;
    }];
    
    UIView *titleView = [self valueForKey:@"_titleView"];
    titleView.alpha = alpha;
    //    when viewController first load, the titleView maybe nil
    [[self subviews] enumerateObjectsUsingBlock:^(UIView *obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:NSClassFromString(@"UINavigationItemView")]) {
            obj.alpha = alpha;
            *stop = YES;
        }
    }];
}

- (void)lt_reset
{
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.overlay removeFromSuperview];
    self.overlay = nil;
}

@end
