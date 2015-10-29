//
//  SMLabelItem.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMItem.h"

@interface SMLabelItem : SMItem


@property (nonatomic, copy) NSString *rightLabelText;

+ (instancetype)itemWithTitle:(NSString *)title rightLabelText:(NSString *)rightLabelText;

@end
