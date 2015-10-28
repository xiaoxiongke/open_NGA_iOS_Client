//
//  SMSettingLabelItem.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSettingLabelItem.h"

@implementation SMSettingLabelItem

+ (instancetype)itemWithTitle:(NSString *)title rightLabelText:(NSString *)rightLabelText{
    
    SMSettingLabelItem *item = [[self alloc] init];
    
    item.title = title;
    item.rightLabelText = rightLabelText;
    
    return item;
    
}

@end
