//
//  SMSettingLabelCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSettingLabelCell.h"

@interface SMSettingLabelCell ()

@property (nonatomic,strong)UILabel *rightLabel;

@end

@implementation SMSettingLabelCell


- (UILabel *)rightLabel{

    if (_rightLabel == nil) {
        _rightLabel = [[UILabel alloc] init];
    }
    
    return _rightLabel;
}


// 设置右边视图
- (void)setUpAccessoryView
{
    self.accessoryView = self.rightLabel;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
}

@end
