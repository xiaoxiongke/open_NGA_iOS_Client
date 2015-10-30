//
//  SMNewsParam.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

// 参数模型如何设计，直接参考接口文档的参数列表
@interface SMNewsParam : NSObject

/**
 *  访问命令牌
 */
@property (nonatomic, copy) NSString *access_token;

/**
 *  访客命令牌
 */
@property (nonatomic, copy) NSString *guest_token;

/**
 *  总页数
 */
@property (nonatomic, assign) NSNumber * totalPage;

/**
 *  当前页数，默认加载第1页。
 */
@property (nonatomic, assign) NSNumber *currentPage;

/**
 *  操作成功
 */
@property (nonatomic, copy) NSString *msg;

/**
 *  code。
 */
@property (nonatomic, assign) NSNumber * code;


/**
 *  每页显示个数。
 */
@property (nonatomic, assign) NSNumber * perPage;

/**
 *  __ngaClientChecksum //取值为 md5(当前用户数字uid+认证码+当前时间戳)+当前时间戳
。
 */
@property (nonatomic, copy) NSString *__ngaClientChecksum;

@end
