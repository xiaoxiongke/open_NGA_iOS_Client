//
//  SMResult.m
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMResult.h"
#import "MJExtension.h"
#import "SMTieziModel.h"
@implementation SMResult

+ (NSDictionary *)objectClassInArray{

    return @{@"data":[SMTieziModel class]};
    
}

@end
