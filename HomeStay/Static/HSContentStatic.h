//
//  QFContentStatic.h
//  Fanggs
//
//  Created by Q房通 on 2017/8/31.
//  Copyright © 2017年 Q房通. All rights reserved.
//  常量


#import <UIKit/UIKit.h>

//MARK:--Block self
#define WeakSelf    __weak typeof(self) weakSelf = self;
#define StrongSelf  __strong typeof(weakSelf) strongSelf = weakSelf;


//MARK:--------------颜色--------------
#define HSColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define seperatorLineColor HSColor(0xcccccc) //线条颜色
#define Color_CCCCCC HSColor(0xcccccc)
#define Cell_e5e5e5 HSColor(0xe5e5e5) //UITableView Cell底部分割线
#define Color_a71a1a   HSColor(0xa71a1a) //选中色 0xf7ab00
#define Color_333333  HSColor(0x333333) //选中色
#define Color_999999  HSColor(0x999999) //选中色
#define Color_666666  HSColor(0x666666) //选中色
#define Color_ffffff  HSColor(0xffffff)
#define AppBackgroundColor HSColor(0xf5f5f5)
#define Color_5aa572  HSColor(0x5aa572)


//MARK:--------------设置图片--------------
#define HSImage(imagename) [UIImage imageNamed:imagename]

//MARK:--------------字体大小--------------
#define HSFont(font) [UIFont systemFontOfSize:font]
#define Font_10 HSFont(10)
#define Font_11 HSFont(11)
#define Font_12 HSFont(12)
#define Font_13 HSFont(13)
#define Font_14 HSFont(14)
#define Font_15 HSFont(15)
#define Font_16 HSFont(16)
#define Font_18 HSFont(18)

//MARK:--------------屏幕比例相关以及缩放系数--------------
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//缩放系数 以iphone6为标准
#define iPhone_6_Width_Zoom  ScreenWidth/375.0
#define iPhone_6_Height_Zoom Screenheight/667.0

#define HSLineWidth (1/[UIScreen mainScreen].scale)

//MARK:--------------设备相关--------------

//MARK:--------------判断是否为iOS7以上--------------
#define iOS7 ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)

#define iOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0)

#define iOS9 ([[UIDevice currentDevice].systemVersion doubleValue] >= 9.0)

#define iOS10 ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0)

#define iOS11 ([[UIDevice currentDevice].systemVersion doubleValue] >= 11.0)

#define IS_IPHONEX   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define SYSTEMVERSION_FLOAT     ([[[UIDevice currentDevice] systemVersion] floatValue])

#define SYSTEMVERSION_DOUBLE    ([[[UIDevice currentDevice] systemVersion] doubleValue])

#define SYSTEMVERSION_STRING    ([[UIDevice currentDevice] systemVersion])


#define NONULLSTRING(str)  ((str == nil || [str isKindOfClass:[NSNull class]]) ? @"" : str)

#define NONSTRING(str)  ((str == nil || [str isEqualToString:@""] || [str isKindOfClass:[NSNull class]]) ? @"--" : str)



//MARK:--------------通知相关--------------
#define kAddOrRemoveSelfSelectedGarden @"AddOrRemoveSelfSelectedGardem"
#define kClickOptionalAddSelfSelectBtn @"ClickOptionalAddSelfSelectBtn"
#define kIsHiddenTabBarNotification @"IsHiddenTabBarNotification"
#define kFirstClickCityChangeNotification @"FirstClickCityChangeNotification" //第一次打开app在全部页面切换了城市
#define kChangeCityInQuoteClassNotification @"ChangeCityInQuoteClassNotification"


//MARK:--------------枚举相关--------------





//MARK:--------------友盟定义相关--------------


























