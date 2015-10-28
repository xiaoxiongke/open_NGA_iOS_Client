//
//  SMSettingCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSettingCell.h"
@interface SMSettingCell()

@property (nonatomic,strong)UISwitch *rightSwitch;

@end



@implementation SMSettingCell

- (UISwitch *)rightSwitch{
    if (_rightSwitch == nil) {
        _rightSwitch = [[UISwitch alloc] init];
    }
    return _rightSwitch;
}



// 设置右边视图
- (void)setUpAccessoryView
{
    self.accessoryView = self.rightSwitch;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    
}
@end
