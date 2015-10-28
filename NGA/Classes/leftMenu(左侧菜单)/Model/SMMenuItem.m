//
//  SMMenuItem.m
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMMenuItem.h"

@implementation SMMenuItem

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(__unsafe_unretained Class)destVcClass{

        SMMenuItem *item = [[self alloc] init];
        
        item.title = title;
        item.destVcClass = destVcClass;
        
        return item;

}

@end
