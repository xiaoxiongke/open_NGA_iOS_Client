//
//  SMItemCell.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMItem.h"
@interface SMItemCell : UITableViewCell



@property (nonatomic, strong) SMItem *item;



+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
