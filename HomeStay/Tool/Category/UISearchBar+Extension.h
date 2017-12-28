//
//  UISearchBar+Extension.h
//  Fanggs
//
//  Created by Q房通 on 2017/9/1.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UISearchBar (Extension)

/*设置字体大小*/
- (void)textFont:(UIFont *)font;
/*设置字体颜色*/
- (void)textColor:(UIColor *)textColor;
/*设置取消标题*/
- (void)cancelButtonTitle:(NSString *)title;
/*设置取消字体大小*/
- (void)cancelButtonFont:(UIFont *)font;

@end
