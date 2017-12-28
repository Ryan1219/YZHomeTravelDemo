//
//  UISearchBar+Extension.m
//  Fanggs
//
//  Created by Q房通 on 2017/9/1.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "UISearchBar+Extension.h"


#define IS_IOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)


@implementation UISearchBar (Extension)

/*设置字体大小*/
- (void)textFont:(UIFont *)font {
    
    if IS_IOS9 {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].font = font;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setFont:font];
    }
}

/*设置字体颜色*/
- (void)textColor:(UIColor *)textColor {
    
    if IS_IOS9 {
        [UITextField appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]].textColor = textColor;
    }else {
        [[UITextField appearanceWhenContainedIn:[UISearchBar class], nil] setTextColor:textColor];
    }
}

/*设置取消标题*/
- (void)cancelButtonTitle:(NSString *)title {
    if IS_IOS9 {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitle:title];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitle:title];
    }

}

/*设置取消字体大小*/
- (void)cancelButtonFont:(UIFont *)font {
    
    NSDictionary *textAttr = @{NSFontAttributeName : font};
    if IS_IOS9 {
        [[UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[UISearchBar class]]] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }else {
        [[UIBarButtonItem appearanceWhenContainedIn:[UISearchBar class], nil] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
    }

}

@end
































