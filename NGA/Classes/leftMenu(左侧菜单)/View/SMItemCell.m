//
//  SMItemCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMItemCell.h"
#import "SMNormalItem.h"
#import "SMSwitchItem.h"
#import "SMLabelItem.h"

@interface SMItemCell()

@property (nonatomic, strong) UISwitch *switchView;
@property (nonatomic, strong) UILabel *labelView;

@end


@implementation SMItemCell

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.bounds = CGRectMake(0, 0, 100, 44);
        _labelView.textColor = [UIColor grayColor];
        _labelView.textAlignment = NSTextAlignmentRight;
        _labelView.font = [UIFont systemFontOfSize:13];
    }
    return _labelView;
}


- (UISwitch *)switchView
{
    if (_switchView == nil) {
        
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)setItem:(SMItem *)item
{
    _item = item;
    
    
    // 1.设置cell的子控件的数据
    [self setUpData];
    
    // 2.设置右边视图
    [self setUpAccessoryView];
    
}

// 设置cell的子控件的数据
- (void)setUpData
{
    
    self.textLabel.text = _item.title;
    
}

// 设置右边视图
- (void)setUpAccessoryView
{
    if ([_item isKindOfClass:[SMNormalItem class]]) { // 普通箭头
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[SMSwitchItem class]]){ // Switch
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else if ([_item isKindOfClass:[SMLabelItem class]]){ // Label
        self.accessoryView = self.labelView;
        
        SMLabelItem *labelItem = (SMLabelItem *)_item;
        self.labelView.text = labelItem.rightLabelText;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else{
        self.accessoryView = nil;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }
}


// 快速创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"Cell";
    
    SMItemCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[SMItemCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    cell.backgroundColor =  SMColor(255, 251, 233);
    
    return cell;
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 237 233 218
        
        // 设置背景
        [self setUpBg];
        // 清空子视图的背景
        [self setSubViews];
        
    }
    
    return self;
}
// 设置背景
- (void)setUpBg
{
    // 设置背景图片
    UIView *bg = [[UIView alloc] init];
    self.backgroundView = bg;
    
    
    // 设置选中的背景图片
    UIView *selectedBg = [[UIView alloc] init];
    selectedBg.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"leftview_shadow_splitline"]];
    self.selectedBackgroundView = selectedBg;
}

// 清空子控件的背景颜色
- (void)setSubViews
{
    self.textLabel.backgroundColor = [UIColor clearColor];
    
}


@end
