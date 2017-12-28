//
//  HSNetworkManager.h
//  Fanggs
//
//  Created by Q房通 on 2017/11/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HSHttpSessionManager : AFHTTPSessionManager

/*
 *单例
 */
+ (instancetype)sharedManager;


@end

@interface HSNetworkManager : NSObject

/*
 *单例
 */
+ (instancetype)sharedManager;

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)postJsonWithURL:(NSString *)url
                 params:(NSDictionary *)params
             completion:(void (^)(id responseObject,NSError *error))completion;

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formDataArray  文件参数
 *  @param progress  上传过程
 *  @param completion 请求的回调
 */
- (void)postWithURL:(NSString *)url
             params:(NSDictionary *)params
      formDataArray:(NSArray *)formDataArray
           progress:(void (^)(NSProgress *uploadProgress))progress
         completion:(void (^)(id responseObject,NSError *error))completion;


/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)getWithURL:(NSString *)url
            params:(NSDictionary *)params
        completion:(void (^)(id responseObject,NSError *error))completion;

/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)putWithURL:(NSString *)url
            params:(NSDictionary *)params
        completion:(void (^)(id responseObject,NSError *error))completion;

@end


/**
 *  用来封装文件数据的模型
 */
@interface QFFormData : NSObject

/**
 *  文件数据
 */
@property (nonatomic, strong) NSData *data;

/**
 *  参数名
 */
@property (nonatomic, copy) NSString *name;

/**
 *  文件名
 */
@property (nonatomic, copy) NSString *filename;

/**
 *  文件类型
 */
@property (nonatomic, copy) NSString *mimeType;

@end










































