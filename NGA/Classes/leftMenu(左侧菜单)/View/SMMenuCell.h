//
//  SMMenuCell.h
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMMenuItem.h"
@interface SMMenuCell : UITableViewCell


@property (nonatomic, strong) SMMenuItem *item;

//@property (nonatomic, strong) NSIndexPath *indexPath;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
