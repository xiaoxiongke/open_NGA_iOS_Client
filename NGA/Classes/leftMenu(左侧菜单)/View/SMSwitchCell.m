//
//  SMSwitchCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSwitchCell.h"

@implementation SMSwitchCell

- (UISwitch *)rightSwitch{
    if (_rightSwitch == nil) {
        _rightSwitch = [[UISwitch alloc] init];
    }
    return _rightSwitch;
}


@end
