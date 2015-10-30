//
//  SMNewsResult.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMNewsResult.h"
#import "SMRecommendNews.h"
@implementation SMNewsResult
// 告诉MJ框架，数组里的字典转换成哪个模型
+ (NSDictionary *)objectClassInArray
{
    return @{@"statuses":[SMRecommendNews class]};
}


@end
