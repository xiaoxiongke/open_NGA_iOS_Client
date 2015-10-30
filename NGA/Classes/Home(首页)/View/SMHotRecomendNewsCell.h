//
//  SMHotRecomendNewsCell.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMRecommendNesFrame;
@interface SMHotRecomendNewsCell : UITableViewCell

@property (nonatomic, strong) SMRecommendNesFrame *recommendF;

+ (instancetype)cellRecommendedWithTableView:(UITableView *)tableView;

@end
