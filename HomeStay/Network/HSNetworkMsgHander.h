//
//  HSNetworkMsgHander.h
//  Fanggs
//
//  Created by Q房通 on 2017/11/22.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>


extern NSString *const NetworkConnectionFailure;

extern NSString *const NetworkConnectionTimeout;

extern NSString *const NetworkResponseDataException;

extern NSString *const NetworkReturnEmptyData;

extern NSString *const NetworkCouldNotConnectToServer;

extern NSString *const NetworkConnectionCancel;

extern NSString *const NetworkRequestFailure;

extern NSString *const NetworkConnectionNotFound;

@interface HSNetworkMsgHander : NSObject

// 判断请求成功状态
+ (BOOL)requestSuccess:(NSString *)code;
// 判断是否需要重新登陆
+ (BOOL)isNeedReLogin:(NSString *)code;
// 判断登陆错误状态
+ (BOOL)isLoginError:(NSString *)code;
// 网络错误码
+ (NSString *)msgFromCode:(NSInteger)code;

@end




























