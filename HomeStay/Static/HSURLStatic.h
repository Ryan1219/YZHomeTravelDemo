//
//  QFURLStatic.h
//  Fanggs
//
//  Created by Q房通 on 2017/9/26.
//  Copyright © 2017年 Q房通. All rights reserved.
//  请求地址



//MARK:-----------网络相关-----------
// 接口返回状态
#define REQUEST_STATUS_CODE                               @"code"
// 接口返回信息
#define REQUEST_STATUS_MSG                               @"msg"
// 返回正常
#define REQUEST_STATU_SUCCESS_C0000                      @"C0000"
// 返回成功
#define REQUEST_STATU_SUCCESS_1000                       @"1000"
// 无数据
#define REQUEST_STATU_SUCCESS_NODATA                     @"C0010"
// 未登录
#define REQUEST_STATU_UNLOGIN                            @"C0001"
// 账号在其它设备上登录
#define REQUEST_STATU_LOGIN_ON_OTHER_DEVICE              @"4000"
// 没有登录，请重新登录
#define REQUEST_STATU_ACCOUNT_NOT_LOGIN                  @"6000"
// 帐号已被停用
#define REQUEST_STATU_ACCOUNT_DISABLED                   @"5000"
// 该账号已绑定其他手机/该手机已绑定其他账号
#define REQUEST_STATU_ACCOUNT_BINDING_ERROR              @"8000"
// 该账号已绑定其他手机多次
#define REQUEST_STATU_ACCOUNT_BINDING_TIMES              @"8001"


//MARK:-----------app接口环境-----------
#ifdef DEBUG_BUILD
    #define kBaseURL @"" //测试
#else
    #define kBaseURL @"" //预发布环境
//#define kBaseURL @"" //发布环境
#endif




//MARK:----------- 接口地址相关-----------




























