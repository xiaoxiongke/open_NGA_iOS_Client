//
//  SMMenuCell.m
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMMenuCell.h"
#import "SMMenuItem.h"



@interface SMMenuCell()

@property (nonatomic,strong)UIImageView *imgView;

@end


@implementation SMMenuCell

- (UIImageView *)imgView
{
    if (_imgView == nil) {
        _imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"customactionsheet_subforum"]];
    }
    return _imgView;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setItem:(SMMenuItem *)item
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
    self.accessoryView = self.imgView;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;

}


// 快速创建cell
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    SMMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[SMMenuCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
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
