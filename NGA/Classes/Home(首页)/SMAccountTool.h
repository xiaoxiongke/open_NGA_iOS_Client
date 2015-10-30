//
//  SMAccountTool.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//  专门处理账号的业务（账号的存取）

#import <Foundation/Foundation.h>

@class SMAccount;

@interface SMAccountTool : NSObject

+ (void)saveAccount:(SMAccount *)account;

+ (SMAccount *)account;

+ (void)accountWithCode:(NSString *)code success:(void(^)())success failure:(void(^)(NSError *error))failure;


@end
