//
//  SMNewsTool.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMNewsTool.h"
#import "MJExtension.h"
#import "SMRecommendNews.h"
#import "SMHttpTool.h"
#import "SMNewsParam.h"
#import "SMAccountTool.h"
#import "SMNewsResult.h"
#import "SMAccount.h"


@implementation SMNewsTool

+ (void)newStatusWithSinceId:(NSString *)sinceId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure{


    // 创建参数模型
    SMNewsParam *param = [[SMNewsParam alloc] init];
    SMAccount *account = [SMAccountTool account];
    param.access_token = account.access_token;
    
    [SMHttpTool Post:@"http://bbs.nga.cn/app_api.php?__lib=home&__act=bannerrecm" parameters:param.keyValues success:^(id responseObject) {
        
        SMNewsResult *result = [SMNewsResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
    
    [SMHttpTool Post:@"http://bbs.nga.cn/app_api.php?__lib=home&__act=recmthreads" parameters:param.keyValues success:^(id responseObject) {
        
        SMNewsResult *result = [SMNewsResult objectWithKeyValues:responseObject];
        
        if (success) {
            success(result.statuses);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    

}

+ (void)moreStatusWithMaxId:(NSString *)maxId success:(void (^)(NSArray *))success failure:(void (^)(NSError *))failure
{
    // 创建参数模型
    SMNewsParam *param = [[SMNewsParam alloc] init];
    param.access_token = [SMAccountTool account].access_token;

    
    [SMHttpTool Post:@"http://bbs.nga.cn/app_api.php?__lib=home&__act=recmthreads" parameters:param.keyValues success:^(id responseObject) { // HttpTool请求成功的回调
            // 请求成功代码先保存
    
            // 把结果字典转换结果模型
            SMNewsResult *result = [SMNewsResult objectWithKeyValues:responseObject];
    
            if (success) {
                success(result.statuses);
            }
    
        } failure:^(NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    
}


@end
