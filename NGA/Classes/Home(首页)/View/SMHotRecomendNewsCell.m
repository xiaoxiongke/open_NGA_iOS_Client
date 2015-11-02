//
//  SMHotRecomendNewsCell.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMHotRecomendNewsCell.h"
#import "SMRecommendNews.h"
#import "SMRecommendNesFrame.h"
#import "UIImageView+WebCache.h"

@interface SMHotRecomendNewsCell ()

// 标题
@property (nonatomic, weak) UILabel *titleView;

// 头像
@property (nonatomic, weak) UIImageView *iconView;


// 昵称
@property (nonatomic, weak) UILabel *nameView;



// 时间
@property (nonatomic, weak) UILabel *timeView;


// 时间icon
@property (nonatomic, weak) UIButton *timeIconView;

// 配图
@property (nonatomic, weak) UIImageView *pic;

// 正文
@property (nonatomic, weak) UILabel *textView;



@end


@implementation SMHotRecomendNewsCell

// 初始化cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 添加所有子控件
        [self setUpAllChildView];
        self.backgroundColor = SMlightColor;
    }
    
    return self;
    
}

/**
 *  设置所有子控件
 */
- (void)setUpAllChildView{
    
    
    // 标题
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.font = SMTitleFont;
    titleLabel.numberOfLines = 0;
    titleLabel.textColor = SMTitleFontColor;
    [self addSubview:titleLabel];
    _titleView = titleLabel;
    
    // 头像
    UIImageView *iconView = [[UIImageView alloc] init];
    [self addSubview:iconView];
    _iconView = iconView;
    
    
    // 昵称
    
    UILabel *nameView = [[UILabel alloc] init];
    nameView.font = SMNameFont;
    [self addSubview:nameView];
    _nameView = nameView;
    
    
    
    // 时间

    UILabel *timeView = [[UILabel alloc] init];
    timeView.font = SMTimeFont;
    [self addSubview:timeView];
    _timeView = timeView;
    
    
    // 时间icon

    UIButton *timeIcon = [[UIButton alloc] init];
    [self addSubview:timeIcon];
    _timeIconView = timeIcon;
    
    // 配图

    UIImageView *pic = [[UIImageView alloc] init];
    [self addSubview:pic];
//    pic.contentMode = UIViewContentModeScaleAspectFill;
    pic.contentMode = UIViewContentModeScaleToFill;
    _pic = pic;
    
    // 正文
    
    UILabel *textView = [[UILabel alloc] init];
    textView.font = SMContentTextFont;
    textView.numberOfLines = 0;
    [self addSubview:textView];
    _textView = textView;


}

- (void)setRecommendF:(SMRecommendNesFrame *)recommendF{

    _recommendF = recommendF;
    // 设置frame
    [self setupFrame];
    
    // 设置data
    [self setUpData];
    

}

/**
 *  设置frame
 */
- (void)setupFrame{

    // 头像
    _iconView.frame = _recommendF.userIconFrame;
    
    // 作者昵称
    _nameView.frame = _recommendF.nameFrame;
    
    // 标题
    _titleView.frame = _recommendF.titleFrame;
    
    // 时间icon
    _timeIconView.frame = _recommendF.timeIconFrame;
    
    // 时间label
    _timeView.frame = _recommendF.timeLabelFrame;
    
    // 配图
    _pic.frame = _recommendF.picFrame;
    
    // 正文
    _textView.frame = _recommendF.contentFrame;
    
}

 /**
 *  设置Data
 */
- (void)setUpData{

    SMRecommendNews *news = _recommendF.recommendNews;
    
    // 头像
    _iconView.image = [UIImage imageNamed:@"recommend_poster"];
    
    // 作者昵称
    _nameView.text = news.author;
    
    // 标题
    _titleView.text = news.subject;

    // 时间icon
    [_timeIconView setBackgroundImage:[UIImage imageNamed:@"recommend_postdate"]forState:UIControlStateNormal];
    _timeIconView.userInteractionEnabled = NO;
    // 时间label
    _timeView.text = news.postdate;
    
    // 配图
    if (_recommendF.recommendNews.thread_icon.length) {
        NSURL *url = [NSURL URLWithString:_recommendF.recommendNews.thread_icon];
        [_pic sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"recommend_loading_listimage"]];
        _pic.contentMode = UIViewContentModeScaleToFill;

    }
    
    // 正文
    _textView.text = news.thread_abstract;


}


+ (instancetype)cellRecommendedWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"cell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
        
    }
    
    return cell;
}



@end
