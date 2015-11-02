//
//  SMTieziCell.h
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SMTieziFrameModel;
@interface SMTieziCell : UITableViewCell

@property (nonatomic, strong) SMTieziFrameModel *tieziFrame;

+ (instancetype)cellWithTieziTableView:(UITableView *)tableView;

@end
