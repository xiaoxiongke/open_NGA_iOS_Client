//
//  SMForumCatagory.m
//  NGA
//
//  Created by eorin on 15/11/1.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMForumCatagory.h"
#import "MJExtension.h"
#import "SMMidCatagory.h"

@implementation SMForumCatagory

+ (NSDictionary *)objectClassInArray{

    return @{@"list":[SMMidCatagory class]};
    
}

@end
