//
//  SMSettingItem.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSettingItem.h"

@implementation SMSettingItem

+ (instancetype)itemWithTitle:(NSString *)title{
    
    SMSettingItem *item = [[self alloc] init];
    
    item.title = title;
    
    return item;
    
}

@end
