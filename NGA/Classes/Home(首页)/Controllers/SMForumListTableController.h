//
//  SMForumListTableController.h
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMForumListTableController : UIViewController

/**
 *  url端口
 */
@property(nonatomic,copy) NSString *urlString;

/**
 *  标题
 */
@property(nonatomic,copy) NSString *titleNavBarTitle;

@property (nonatomic,assign) NSInteger index;

@end
