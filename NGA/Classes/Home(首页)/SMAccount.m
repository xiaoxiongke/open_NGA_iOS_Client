//
//  SMAccount.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

/**
 // NGA返回账号数据
 "uid": "8081883",
 "email": "sama1333258",
 "nickname": "sama1333258",
 "access_token": "6f23492e8a6b747fe97a40b54a8fbc93",
 "avatar": "http:\/\/pic1.178.com\/avatars\/00\/7b\/51\/nga_8081883.jpg",
 "bound_mobile": true
 */

#define SMAccountTokenKey @"access_token"
#define SMUidKey @"uid"
#define SMEmail @"email"
#define SMAvatar @"avatar"
#define SMBoundMobile @"bound_mobile"
#define SMNameKey @"nickname"

#import "SMAccount.h"
#import "MJExtension.h"


@implementation SMAccount


// 底层便利当前的类的所有属性，一个一个归档和接档
MJCodingImplementation
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    SMAccount *account = [[self alloc] init];
    
    [account setValuesForKeysWithDictionary:dict];
    
    return account;
}

@end
