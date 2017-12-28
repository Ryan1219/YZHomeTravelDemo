//
//  UIApplication+ActivityViewController.m
//  JMPanKeTong
//
//  Created by yanghy on 17/3/27.
//  Copyright © 2017年 Qfang.com. All rights reserved.
//

#import "UIApplication+ActivityViewController.h"

@implementation UIApplication (ActivityViewController)

- (UIViewController *)activityViewController {
    __block UIWindow *normalWindow = [self.delegate window];
    if (normalWindow.windowLevel != UIWindowLevelNormal) {
        [self.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.windowLevel == UIWindowLevelNormal) {
                normalWindow = obj;
                *stop        = YES;
            }
        }];
    }
    
    return [self p_nextTopForViewController:normalWindow.rootViewController];
}

- (UIViewController *)p_nextTopForViewController:(UIViewController *)inViewController {
    while (inViewController.presentedViewController) {
        inViewController = inViewController.presentedViewController;
    }
    
    if ([inViewController isKindOfClass:[UITabBarController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController];
        return selectedVC;
    }
//    else if([inViewController isKindOfClass:[QFMainViewController class]]){
//        QFMainViewController *viewCtl = (QFMainViewController *)inViewController;
//        UIViewController *selectedVC = [self p_nextTopForViewController:(UITabBarController *)viewCtl.currentTabBarController.selectedViewController];
//        return selectedVC;
//    }
    else if ([inViewController isKindOfClass:[UINavigationController class]]) {
        UIViewController *selectedVC = [self p_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController];
        return selectedVC;
    } else {
        return inViewController;
    }
}

- (UIViewController *)mainViewController {
    __block UIWindow *normalWindow = [self.delegate window];
    if (normalWindow.windowLevel != UIWindowLevelNormal) {
        [self.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.windowLevel == UIWindowLevelNormal) {
                normalWindow = obj;
                *stop        = YES;
            }
        }];
    }
    
    return [self p_nextTopForMainViewController:normalWindow.rootViewController];
}

- (UIViewController *)p_nextTopForMainViewController:(UIViewController *)inViewController {
    while (inViewController.presentedViewController) {
        inViewController = inViewController.presentedViewController;
    }
    
//    if([inViewController isKindOfClass:[QFMainViewController class]]){
//        return inViewController;
//    } else {
        return inViewController;
//    }
}

@end
