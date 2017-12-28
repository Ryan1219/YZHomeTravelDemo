//
// HSNetworkMsgHander.m
//  Fanggs
//
//  Created by Q房通 on 2017/11/22.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSNetworkMsgHander.h"

NSString *const NetworkConnectionFailure = @"网络连接失败，请检查网络";

NSString *const NetworkConnectionTimeout = @"网络连接超时";

NSString *const NetworkResponseDataException = @"服务器数据异常";

NSString *const NetworkReturnEmptyData = @"暂无数据哦";

NSString *const NetworkCouldNotConnectToServer = @"无法连接到服务器";

NSString *const NetworkConnectionCancel = @"取消上一个请求";

NSString *const NetworkRequestFailure = @"服务请求失败";

NSString *const NetworkConnectionNotFound = @"服务连接失败，请重试";


@implementation HSNetworkMsgHander

+ (BOOL)requestSuccess:(NSString *)code {
    
    return [code isEqualToString:REQUEST_STATU_SUCCESS_C0000] ||
            [code isEqualToString:REQUEST_STATU_SUCCESS_1000] ||
            [code isEqualToString:REQUEST_STATU_SUCCESS_NODATA];
}

+ (BOOL)isNeedReLogin:(NSString *)code {
    
    BOOL isReLogin = [code isEqualToString:REQUEST_STATU_UNLOGIN];
    
    // 已在其他设备上登陆
    if ([code isEqualToString:REQUEST_STATU_LOGIN_ON_OTHER_DEVICE]) {
        isReLogin = YES;
    } // 未登录，需要重新登陆
    else if ([code isEqualToString:REQUEST_STATU_ACCOUNT_NOT_LOGIN]) {
        isReLogin =  YES;
    } // 账号停用
    else if ([code isEqualToString:REQUEST_STATU_ACCOUNT_DISABLED]) {
        isReLogin = YES;
    }
    return isReLogin;
}

+  (BOOL)isLoginError:(NSString *)code {
    
    return [code isEqualToString:REQUEST_STATU_ACCOUNT_DISABLED] ||
            [code isEqualToString:REQUEST_STATU_ACCOUNT_BINDING_ERROR ] ||
            [code isEqualToString:REQUEST_STATU_ACCOUNT_BINDING_TIMES];
}

+ (NSString *)msgFromCode:(NSInteger)code {
    
    switch (code) {
        case -999: { // 取消上一个请求，不提示
            return @"";
        }
            break;
        case -1001: { // 请求超时
            return NetworkConnectionTimeout;
        }
            break;
        case -1009: { // 网络连接失败
            return NetworkConnectionFailure;
        }
            break;
        case -1004: { // 无法连接到服务器
            return NetworkConnectionFailure;
        }
            break;
        case -1011: { // 404
            return NetworkConnectionFailure;
        }
            break;
        case 3840: { //json解析错误
            return NetworkConnectionFailure;
        }
            break;
        default: // 服务请求失败
            return NetworkRequestFailure;
            break;
    }
}



@end








































