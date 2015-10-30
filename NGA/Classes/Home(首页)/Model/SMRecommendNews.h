//
//  SMRecommendNews.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SMRecommendNews : NSObject


/**
 {
 totalPage = 74,
 result = [
 {
 subject = DOTA2更新日志：6.85b版本末日使者被削弱,
 author = 素艳染苍穹丶,
 is_live = 0,
 thread_icon = http://img.178.com/wow/201510/240172961685/240173022325.jpg,
 thread_abstract = 今日DOTA2迎来了6.85b版本的更新，本次更新中末日使者和育母蜘蛛将被削弱，另外公布了秋季赛新珍藏及万圣节活动的相关内容。,
 replies = 17,
 postdate = 1446169705,
 tid = 8669567
 },],
 code = 0,
 msg = 操作成功,
 perPage = 20,
 guest_token = guest05632db6ea0467,
 currentPage = 1
 }
 
 */

/**
 *  字符串型的帖子ID
 */
@property (nonatomic, copy) NSString *tid;


/**
 *  作者名称
 */
@property (nonatomic, copy) NSString *author;

/**
 *  热门帖子配图
 */
@property (nonatomic,copy) NSString *thread_icon;

/**
 *  帖子发布时间
 */
@property (nonatomic, copy) NSString *postdate;


/**
 *  发布的帖子标题
 */
@property (nonatomic, copy) NSString *subject;


/**
 *  发布的帖子内容
 */
@property (nonatomic, copy) NSString *thread_abstract;





@end
