//
//  SMAccount.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMAccount : NSObject
/**
 // NGA返回账号数据
 "uid": "8081883",
 "email": "sama1333258",
 "nickname": "sama1333258",
 "access_token": "6f23492e8a6b747fe97a40b54a8fbc93",
 "avatar": "http:\/\/pic1.178.com\/avatars\/00\/7b\/51\/nga_8081883.jpg",
 "bound_mobile": true
 */


/**
*  获取数据的访问令牌
*/
@property (nonatomic, copy) NSString *access_token;

/**
 *  用户唯一标识符
*
*/
@property (nonatomic, copy) NSString *uid;

/**
 *  用户邮箱
 *
 */
@property (nonatomic, copy) NSString *email;


/**
 *  用户的头像
 */
@property (nonatomic, copy) NSString *avatar;

/**
 *  用户的昵称
 */

@property (nonatomic, copy) NSString *nickname;

/**
 *  是否绑定手机bound_mobile
 */
@property (nonatomic, assign) BOOL bound_mobile;


+ (instancetype)accountWithDict:(NSDictionary *)dict;


@end
