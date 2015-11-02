//
//  SMFavorViewController.h
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SMFavorViewController : UITableViewController

/**
 *  标题
 */
@property(nonatomic,copy) NSString *menuTitle;

// 列表索引
@property (nonatomic,assign) NSInteger index;
@end
