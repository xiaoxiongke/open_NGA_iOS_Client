//
//  SMUser.h
//  NGA
//
//  Created by eorin on 15/10/30.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMUser : NSObject

/**
 *  字符串型的帖子ID
 */
@property (nonatomic, copy) NSString *tid;


/**
 *  作者名称
 */
@property (nonatomic, copy) NSString *name;

/**
 *  热门帖子配图
 */
@property (nonatomic, strong) NSURL *image_url;

/**
 *  帖子发布时间
 */
@property (nonatomic, copy) NSString *created_at;


/**
 *  发布的帖子标题
 */
@property (nonatomic, copy) NSString *titleText;


/**
 *  发布的帖子内容
 */
@property (nonatomic, copy) NSString *recommendContent;


// 是否配图
@property (nonatomic, assign,getter=isHasPic) BOOL hasPic;

@end
