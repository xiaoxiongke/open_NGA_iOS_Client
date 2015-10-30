//
//  SMAccountTool.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#define SMAuthorizeBaseUrl @"https://account.178.com/app_api.php"
#define SMAccess_Token @"6f23492e8a6b747fe97a40b54a8fbc93"
#define SMRedirect_uri  @"http://www.baidu.com"
#define SMClient_secret @"03729d16a4cd277c7da26398f7a01282"

#define SMAccountFileName [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.data"]


#import "SMAccountTool.h"
#import "MJExtension.h"
#import "SMHttpTool.h"
#import "AFNetworking.h"
#import "SMAccount.h"
#import "SMAccountParam.h"

@implementation SMAccountTool

// 类方法一般用静态变量代替成员属性

static  SMAccount *_account;
+ (void)saveAccount:(SMAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:SMAccountFileName];
}

+ (SMAccount *)account
{
    if (_account == nil) {
        
        _account = [NSKeyedUnarchiver unarchiveObjectWithFile:SMAccountFileName];
        
    }
    
    return _account;
}

+ (void)accountWithCode:(NSString *)code success:(void (^)())success failure:(void (^)(NSError *))failure
{
    
    // 创建参数模型
    SMAccountParam *param = [[SMAccountParam alloc] init];
    param.client_secret = SMClient_secret;
    param.grant_type = @"authorization_code";
    param.code = code;
    param.redirect_uri = SMRedirect_uri;
    
    [SMHttpTool Post:@"https://account.178.com/app_api.php" parameters:param.keyValues success:^(id responseObject) {
        // 字典转模型
        SMAccount *account = [SMAccount accountWithDict:responseObject];

        // 保存账号信息:
        // 数据存储一般我们开发中会搞一个业务类，专门处理数据的存储
        // 以后我不想归档，用数据库，直接改业务类
        [SMAccountTool saveAccount:account];
        
        if (success) {
            success();
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
}



@end
