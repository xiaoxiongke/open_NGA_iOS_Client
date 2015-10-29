//
//  SMLabelCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMLabelCell.h"
#import "SMLabelItem.h"
@implementation SMLabelCell



- (UILabel *)rightLabel{
    
    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
        SMLabelItem *item = [[SMLabelItem alloc] init];
        _rightLabel.text = item.rightLabelText;
        [_rightLabel setTextColor:[UIColor grayColor]];
        _rightLabel.font = [UIFont systemFontOfSize:23];
    }
    
    return _rightLabel;
}


@end
