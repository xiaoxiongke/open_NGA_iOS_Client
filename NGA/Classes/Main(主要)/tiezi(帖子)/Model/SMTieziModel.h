//
//  SMTieziModel.h
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMTieziModel : NSObject


/**
 "tid": 8678563,
 "fid": 459,
 "titlefont": "",
 "author": "zhtaaahhh",
 "authorid": 1517896,
 "subject": "[杂谈] 我现在觉得网易是对的。。。",
 "postdate": 1446433781,
 "lastpost": 1446433983,
 "lastposter": "yyw1991129",
 "replies": 4,
 "error": "",
 "type": 512,
 "orginal_tid": 0,
 "titlefont_api": null,
 "set_elm_parent": 0,
 "is_set": false,
 "is_set_elm": false,
 "forumname": "守望先锋"
 */


/**
 *  字符串型的帖子ID
 */
@property (nonatomic, copy) NSString *tid;

/**
 *  字符串型的帖子fid
 */
@property (nonatomic, copy) NSString *fid;

/**
 *  作者名称
 */
@property (nonatomic, copy) NSString *author;

/**
 *  帖子最后回复时间
 */
@property (nonatomic, copy) NSString *lastpost;


/**
 *  发布的帖子标题
 */
@property (nonatomic, copy) NSString *subject;

/**
 *  回复个数
 */
@property (nonatomic,copy)NSString *replies;

/**
 *  字体设置字典
 */
@property (nonatomic,copy) NSDictionary *titlefont_api;


/**
 *  来自的论坛名称
 */
@property (nonatomic,copy) NSString *forumname;

/**
 *  messIcon
 */
@property (nonatomic,copy) NSString *messIcon;


///**
// *  发布的帖子内容
// */
//@property (nonatomic, copy) NSString *thread_abstract;


@end
