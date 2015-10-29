//
//  SMItem.h
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SMItemOption)();

@interface SMItem : NSObject


@property (nonatomic, copy) NSString *title;

//@property (nonatomic, copy) NSString *rightText;
// 保存一段功能，在恰当的时候调用
@property (nonatomic, copy) SMItemOption option;

// 要跳转的控制器的类名
@property (nonatomic, assign) Class destVcClass;

+ (instancetype)itemWithTitle:(NSString *)title destVcClass:(Class)destVcClass;



@end
