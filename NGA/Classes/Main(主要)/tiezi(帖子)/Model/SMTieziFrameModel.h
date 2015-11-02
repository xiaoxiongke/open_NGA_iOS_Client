//
//  SMTieziFrameModel.h
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMTieziModel.h"


@interface SMTieziFrameModel : NSObject

/**
 *  帖子模型
 */
@property (nonatomic, strong) SMTieziModel *tiezi;

/********帖子子控件frame**** */
// cell的高度
@property (nonatomic, assign) CGFloat height;


// 帖子标题的Frame
@property (nonatomic, assign) CGRect titleFrame;

// 作者名称的Frame
@property (nonatomic, assign) CGRect nameFrame;

// 时间icon的Frame
@property (nonatomic, assign) CGRect timeIconFrame;

// 最后回复时间label的Frame
@property (nonatomic, assign) CGRect timeLabelFrame;

// 消息icon的Frame
@property (nonatomic, assign) CGRect messIconFrame;

// 回复数的Frame
@property (nonatomic, assign) CGRect replyFrame;

@end
