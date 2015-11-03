//
//  SMForumListTableController.h
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMForumCatagory.h"
@interface SMForumListTableController : UITableViewController

/**
 *  标题
 */
@property(nonatomic,copy) NSString *menuTitle;

@property (nonatomic,assign) NSInteger index;

/**
 *  大模型
 */
//@property (nonatomic,strong)NSArray *bigModelArray;

@property (nonatomic,strong)SMForumCatagory *bigModel;




@end
