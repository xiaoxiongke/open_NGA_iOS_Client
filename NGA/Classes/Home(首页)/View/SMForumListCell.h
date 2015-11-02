//
//  SMForumListCell.h
//  NGA
//
//  Created by eorin on 15/11/1.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMForumList.h"
@interface SMForumListCell : UITableViewCell

+ (instancetype)cellOfForumListWithTableView:(UITableView *)tableView;

@property (nonatomic,strong)SMForumList *listModel;

@end
