//
//  SMRecommendNesFrame.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMRecommendNews.h"


@interface SMRecommendNesFrame : NSObject

/**
 *  推荐热门帖子
 */
@property (nonatomic, strong) SMRecommendNews *recommendNews;

// 帖子frame
@property (nonatomic, assign) CGRect originalViewFrame;

/**   ******新闻子控件frame**** */
// cell的高度
@property (nonatomic, assign) CGFloat height;

// 作者icon的Frame
@property (nonatomic, assign) CGRect userIconFrame;

// 帖子标题的Frame
@property (nonatomic, assign) CGRect titleFrame;

// 作者名称的Frame
@property (nonatomic, assign) CGRect nameFrame;

// 时间icon的Frame
@property (nonatomic, assign) CGRect timeIconFrame;

// 时间label的Frame
@property (nonatomic, assign) CGRect timeLabelFrame;

// 配图的Frame
@property (nonatomic, assign) CGRect picFrame;


// 正文的Frame
@property (nonatomic, assign) CGRect contentFrame;



@end
