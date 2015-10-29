//
//  SMItem.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMItem.h"

@implementation SMItem


+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(__unsafe_unretained Class)destVcClass{
    
    SMItem *item = [[self alloc] init];
    
    item.title = title;
    item.destVcClass = destVcClass;
    
    return item;
    
}


@end
