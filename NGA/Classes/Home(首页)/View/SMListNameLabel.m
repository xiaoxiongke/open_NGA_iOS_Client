//
//  SMListNameLabel.m
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMListNameLabel.h"

@implementation SMListNameLabel
#warning TODO 待修改
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = SMTitleFont;
        self.textColor = [UIColor redColor];
        self.scale = 0.0;
        
    }
    return self;
}


/** 通过scale的改变改变多种参数 */
- (void)setScale:(CGFloat)scale
{
    _scale = scale;

    CGFloat minScale = 0.8;
    CGFloat trueScale = minScale + (1-minScale)*scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}



@end
