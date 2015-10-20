//
//  NetWork.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/20.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "NetWork.h"

@implementation NetWork

+(void)sendGetUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}


+(void)sendGetByReplacingUrl:(NSString *)url withParams:(NSDictionary *)params success:(successBlock)success failure:(failureBlock)failure
{
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:urlStr parameters:params
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

@end
