//
//  SMMenuItem.h
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SMMenuItemOption)();

@interface SMMenuItem : NSObject

@property (nonatomic, copy) NSString *title;

// 保存一段功能，在恰当的时候调用
@property (nonatomic, copy) SMMenuItemOption option;

// 要跳转的控制器的类名
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;

@end
