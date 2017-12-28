//
//  QFRootTabBarController.m
//  Fanggs
//
//  Created by Q房通 on 2017/8/31.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSRootTabBarController.h"

#import "HSHomeViewController.h"
#import "HSNewsViewController.h"
#import "HSOrderViewController.h"
#import "HSUserCenterViewController.h"


#define kClassKey @"classKey"
#define kClassTitleKey @"classTitleKey"
#define kClassImageKey @"classImageKey"
#define kClassSelectImageKey @"classSelectImageKey"

@interface HSRootTabBarController ()


@end

@implementation HSRootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.tabBar.barTintColor = [UIColor whiteColor];
    
    [self initChildController:[[HSHomeViewController alloc] init] title:@"首页" image:@"" selectImage:@""];
    
    [self initChildController:[[HSNewsViewController alloc] init] title:@"消息" image:@"" selectImage:@""];

    [self initChildController:[[HSOrderViewController alloc] init] title:@"订单" image:@"" selectImage:@""];
    
    [self initChildController:[[HSUserCenterViewController alloc] init] title:@"我的" image:@"" selectImage:@""];
  
}


- (void)initChildController:(UIViewController *)controller title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage {

    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:nav];
    UITabBarItem *item = nav.tabBarItem;
    item.title = title;
    item.image = [UIImage imageNamed: image];
    item.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName: Color_333333,NSFontAttributeName:HSFont(11)} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName: Color_a71a1a,NSFontAttributeName:HSFont(11)} forState:UIControlStateSelected];
}





//- (void)dropShadowWithOffset:(CGSize)offset
//                      radius:(CGFloat)radius
//                       color:(UIColor *)color
//                     opacity:(CGFloat)opacity {
//
//    // Creating shadow path for better performance
//    CGMutablePathRef path = CGPathCreateMutable();
//    CGPathAddRect(path, NULL, self.tabBar.bounds);
//    self.tabBar.layer.shadowPath = path;
//    CGPathCloseSubpath(path);
//    CGPathRelease(path);
//
//    self.tabBar.layer.shadowColor = color.CGColor;
//    self.tabBar.layer.shadowOffset = offset;
//    self.tabBar.layer.shadowRadius = radius;
//    self.tabBar.layer.shadowOpacity = opacity;
//
//    // Default clipsToBounds is YES, will clip off the shadow, so we disable it.
//    self.tabBar.clipsToBounds = NO;
//}


//- (void)configTabBar {
//    
//    NSArray *childArray = @[
//                            @{
//                                kClassKey : @"QFAllViewController",
//                                kClassTitleKey : @"全部",
//                                kClassImageKey:@"home_all_default",
//                                kClassSelectImageKey:@"home_all_select"
//                                },
//                            @{
//                                kClassKey : @"QFOptionalViewController",
//                                kClassTitleKey : @"自选",
//                                kClassImageKey:@"home_optional_default",
//                                kClassSelectImageKey:@"home_optional_select"
//                                },
//                            @{
//                                kClassKey : @"QFQuoteViewController",
//                                kClassTitleKey : @"行情",
//                                kClassImageKey:@"home_quote_default",
//                                kClassSelectImageKey:@"home_quote_select"
//                                },
//                            @{
//                                kClassKey : @"QFNewsViewController",
//                                kClassTitleKey : @"资讯",
//                                kClassImageKey:@"home_news_default",
//                                kClassSelectImageKey:@"home_news_select"
//                                }
//                            ];
//    [childArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        
//        
//        NSDictionary *dict = obj;
//        UIViewController *childCtrl = [[NSClassFromString(dict[kClassKey]) alloc] init];
//        
//        
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childCtrl];
//        UITabBarItem *item = nav.tabBarItem;
//        item.title = dict[kClassTitleKey];
//        item.image = [UIImage imageNamed:dict[kClassImageKey]];
//        item.selectedImage = [[UIImage imageNamed:dict[kClassSelectImageKey]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:QFColor(0x333333),NSFontAttributeName:QFFont(11)} forState:UIControlStateNormal];
//        [item setTitleTextAttributes:@{NSForegroundColorAttributeName:QFColor(0xf7ab00),NSFontAttributeName:QFFont(11)} forState:UIControlStateSelected];
//        [self addChildViewController:nav];
//        
//    }];
//}


@end

































