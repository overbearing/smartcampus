//
//  NetworkingManger.m
//  RoseRiding
//
//  Created by MR_THT on 2020/3/23.
//  Copyright © 2020 MR_THT. All rights reserved.
//

#import "NetworkingManger.h"
#import "LoginViewController.h"

@interface NetworkingManger ()

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NetworkingManger

+ (NetworkingManger *)shareManger{
    static NetworkingManger *manger;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manger = [[NetworkingManger alloc] init];
    });
    return manger;
}

- (instancetype)init {
    if (self == [super init]) {
        NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:nil sessionConfiguration:configuration];
        
        //接收参数类型
        self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
        
       AFJSONResponseSerializer *responseSerializer = [AFJSONResponseSerializer serializer];
        responseSerializer.removesKeysWithNullValues = YES;
        self.sessionManager.responseSerializer = responseSerializer;
        self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", @"text/plain", @"image/gif", @"text/html; charset=utf-8", @"application/json; charset=utf-8", nil];
        
        //设置超时时间
        [self.sessionManager requestSerializer].timeoutInterval = 30;
        //安全策略
        self.sessionManager.securityPolicy = [AFSecurityPolicy defaultPolicy];
    }
    return self;
}

- (void)getDataWithUrl:(NSString *)url para:(NSDictionary * _Nullable)dic success:(void (^)(NSDictionary * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail{
    if ([UserInfo shareUserInfo].token != nil) {
         [self.sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",[UserInfo shareUserInfo].token] forHTTPHeaderField:@"Authorization"];
    }
    
    [[NetworkingManger shareManger].sessionManager GET:url parameters:dic progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            if ([[responseObject objectForKey:@"code"] integerValue] == 500) {
                [[NSNotificationCenter defaultCenter] postNotificationName:loginsuccess object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"loginfailed",@"name", nil] ];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
        }
    }];
}
- (void)postDataWithUrl:(NSString *)url para:( NSDictionary * _Nullable)dic success:(void (^)(NSDictionary * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail{
    
     if ([UserInfo shareUserInfo].token != nil) {
          [self.sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"Bearer %@",[UserInfo shareUserInfo].token] forHTTPHeaderField:@"Authorization"];
     }
    NSMutableDictionary * dics = [[NSMutableDictionary alloc] initWithDictionary:dic];
    //统一添加一个TOKEN
    [[NetworkingManger shareManger].sessionManager POST:url parameters:dics progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
            if ([[responseObject objectForKey:@"code"] integerValue] == 500) {
                [[NSNotificationCenter defaultCenter] postNotificationName:loginsuccess object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"loginfailed",@"name", nil] ];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (fail) {
            fail(error);
            return;
        }
    }];
}

- (void)uploadFile:(NSString *)url para:(NSDictionary *)dic data:(NSData *)fileData fileName:(NSString *)fileName mimetype:(NSString *)mimetype success:(void (^)(NSDictionary * _Nonnull))success fail:(void (^)(NSError * _Nonnull))fail{
    [[NetworkingManger shareManger].sessionManager POST:url parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:fileData name:fileName fileName:fileName mimeType:mimetype];
    } progress:NULL success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //打印看下返回的是什么东西
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error) {
            fail(error);
             return;
        }
    }];
}
- (void)deleteWithUrl:(NSString *)url para:(NSDictionary * _Nullable)dic success:(void(^)(NSDictionary *result))success fail:(void(^)(NSError *error))fail{
    [[NetworkingManger shareManger].sessionManager DELETE:url parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (fail) {
                          fail(error);
                      }
    }];
}
@end
