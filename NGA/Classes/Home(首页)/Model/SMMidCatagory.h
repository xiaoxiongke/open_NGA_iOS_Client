//
//  SMMidCatagory.h
//  NGA
//
//  Created by eorin on 15/11/1.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMMidCatagory : NSObject

/**
 *  序号 id
 */
@property (nonatomic,copy)NSString *ID;


/**
 *  列表名称
 */
@property (nonatomic,copy) NSString *name;

///**
// *  列表数据
// */
@property (nonatomic,strong)NSArray *list;


@end
