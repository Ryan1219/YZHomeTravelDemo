//
//  HSNetworkManager.m
//  Fanggs
//
//  Created by Q房通 on 2017/11/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSNetworkManager.h"


@implementation HSHttpSessionManager

/*
 *单例
 */
static id _sharedSessionInstance = nil;
+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSessionInstance = [[self alloc] init];
    });
    return _sharedSessionInstance;
}


@end

@implementation HSNetworkManager

/*
 *单例
 */
static id _sharedInstance = nil;
+ (instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

// 网络请求头部封装方法
- (AFHTTPSessionManager *)httpRequestOperationManager:(AFHTTPRequestSerializer *)requestSerializer responseSerializer:(AFHTTPResponseSerializer *)responseSerializer{
    // 创建请求管理对象
    AFHTTPSessionManager *manager = [HSHttpSessionManager sharedManager];
    // 设置请求超时
    manager.requestSerializer.timeoutInterval = 30;
    
    if (requestSerializer != nil){
        [manager setRequestSerializer:requestSerializer];
    }
    
    if (responseSerializer != nil){
        [manager setResponseSerializer:responseSerializer];
    }
    // 设置可接收接口返回数据类型
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript",@"text/plain", nil];
    // 设置请求头
    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    return manager;
}

/**
 *  发送一个POST请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)postJsonWithURL:(NSString *)url params:(NSDictionary *)params completion:(void (^)(id, NSError *))completion {
    
    AFHTTPSessionManager *mgr = [self httpRequestOperationManager:[AFJSONRequestSerializer serializer] responseSerializer:nil];
    
    [mgr POST:url parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        WeakSelf
//        if (completion) {
//            completion(responseObject,nil);
//        }
        [weakSelf requestSuccessWithResponseObject:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil,error);
        }
    }];
    
}

/**
 *  发送一个POST请求(上传文件数据)
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param formDataArray  文件参数
 *  @param progress  上传过程
 *  @param completion 请求的回调
 */
- (void)postWithURL:(NSString *)url params:(NSDictionary *)params formDataArray:(NSArray *)formDataArray progress:(void (^)(NSProgress *))progress completion:(void (^)(id, NSError *))completion {
    
    AFHTTPSessionManager *mgr = [self httpRequestOperationManager:nil responseSerializer: nil];
    
    [mgr POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        for (QFFormData *subFormData in formDataArray) {
            [formData appendPartWithFileData:subFormData.data name:subFormData.name fileName:subFormData.filename mimeType:subFormData.mimeType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (completion) {
//            completion(responseObject,nil);
//        }
        WeakSelf
        [weakSelf requestSuccessWithResponseObject:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil,error);
        }
    }];
}

/**
 *  发送一个GET请求
 *
 *  @param url     请求路径
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)getWithURL:(NSString *)url params:(NSDictionary *)params completion:(void (^)(id, NSError *))completion {
    
    AFHTTPSessionManager *mgr = [self httpRequestOperationManager:nil responseSerializer:nil];
    [mgr GET:url parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
    
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (completion) {
//            completion(responseObject,nil);
//        }
        WeakSelf
        [weakSelf requestSuccessWithResponseObject:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil,error);
        }
    }];
}

/**
 *  PUT请求
 *
 *  @param url     请求地址
 *  @param params  请求参数
 *  @param completion 请求的回调
 */
- (void)putWithURL:(NSString *)url params:(NSDictionary *)params completion:(void (^)(id, NSError *))completion {
    
    AFHTTPSessionManager *mgr = [self httpRequestOperationManager:[AFJSONRequestSerializer serializer] responseSerializer:nil];
    [mgr PUT:url parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        if (completion) {
//            completion(responseObject,nil);
//        }
        WeakSelf
        [weakSelf requestSuccessWithResponseObject:responseObject completion:completion];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (completion) {
            completion(nil,error);
        }
    }];
}

/**
 *  缓存逻辑
 */
- (void)requestSuccessWithResponseObject:(id)responseObject
                              completion:(void (^)(id responseObject,NSError *error))completion
{
    
    if (!completion) return;
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        
        NSString *code = [responseObject objectForKey:REQUEST_STATUS_CODE];
        NSString *msg = [responseObject objectForKey:REQUEST_STATUS_MSG];
        
        WeakSelf;
        if ([HSNetworkMsgHander requestSuccess:code] || [HSNetworkMsgHander isLoginError:code]) {
            StrongSelf;
            if (strongSelf) {
//                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//                    [[QFCacheManager sharedManager] saveCacheResponseObjectWithURL:[MD5 md532BitLower:url] responseObject:responseObject];
//                });
            }
            completion(responseObject,nil);
        }
        else if ([HSNetworkMsgHander isNeedReLogin:code]) {
            NSError *error = [NSError errorWithDomain:@"com.qfang" code:-1 userInfo:@{
                                                                                      @"NSLocalizedDescription":NONULLSTRING(msg),
                                                                                      @"code":NONULLSTRING(code)
                                                                                      }];
            completion(nil,error);
        }
        else {
            NSError *error = [NSError errorWithDomain:@"com.qfang" code:-1 userInfo:@{
                                                                                      @"NSLocalizedDescription":NONULLSTRING(msg),
                                                                                      @"code":NONULLSTRING(code)
                                                                                      }];
            completion(nil,error);
        }
    }
    else {
        NSError *error = [NSError errorWithDomain:@"com.qfang" code:-1 userInfo:@{
                                                                            @"NSLocalizedDescription":NONULLSTRING(NetworkReturnEmptyData)
                                                                                  
                                                                                  }];
        completion(nil,error);
    }
}

//- (void)requestFailWithError:(NSError *)error completion:(void (^)(id responseObject,NSError *error))completion {
//    completion(nil,error);
//}

@end


/**
 *  用来封装文件数据的模型
 */
@implementation QFFormData

@end


































































