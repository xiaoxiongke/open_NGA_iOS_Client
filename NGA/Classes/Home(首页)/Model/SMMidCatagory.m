//
//  SMMidCatagory.m
//  NGA
//
//  Created by eorin on 15/11/1.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMMidCatagory.h"
#import "MJExtension.h"
#import "SMForumList.h"

@implementation SMMidCatagory

+ (NSDictionary *)objectClassInArray{
    
    return @{@"list":[SMForumList class]};
    
}
@end
