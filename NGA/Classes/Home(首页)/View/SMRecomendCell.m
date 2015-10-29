//
//  SMRecomendCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMRecomendCell.h"

@implementation SMRecomendCell


+ (instancetype)cellWithTableView:(UITableView *)tableView{

    return [[[NSBundle mainBundle] loadNibNamed:@"SMRecomendCell" owner:nil options:nil] lastObject];
    
}

@end
