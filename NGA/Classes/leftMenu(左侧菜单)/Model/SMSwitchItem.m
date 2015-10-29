//
//  SMSwitchItem.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSwitchItem.h"

@implementation SMSwitchItem

+ (instancetype)itemWithTitle:(NSString *)title{
    
    SMSwitchItem *item = [[self alloc] init];
    
    item.title = title;
    
    return item;
    
}


@end
