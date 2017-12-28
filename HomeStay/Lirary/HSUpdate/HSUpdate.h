//
//  HSUpdate.h
//  HomeStay
//
//  Created by Ryan on 2017/12/11.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>


@class HSUpdateDataModel;
@interface HSUpdate : NSObject


/**
 单例
 @return 对象
 */
+ (instancetype)sharedInstance;

/**
 检查更新
 */
- (void)checkUpdate:(BOOL)response;


@end



@interface HSUpdateDataModel : NSObject

/* version */
@property (nonatomic,copy) NSString *version;
/* updateTips */
@property (nonatomic,copy) NSString *updateTips;
/* needUpdate */
@property (nonatomic,assign) BOOL needUpdate;
/* 新版本引导图片750*1334 */
@property (nonatomic,strong) NSArray *updateTipsUrl;
/* 新版本引导图片640*1136 */
@property (nonatomic,strong) NSArray *updateTipsUrl2;
/* forceUpdate */
@property (nonatomic,assign) BOOL forceUpdate;
/* downloadUrl */
@property (nonatomic,copy) NSString *downloadUrl;

@end






































































