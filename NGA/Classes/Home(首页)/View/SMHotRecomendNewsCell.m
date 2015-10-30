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
@property (nonatomic, weak) UIImageView *timeIconView;

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
//        self.backgroundColor = [UIColor clearColor];
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
    timeView.font = SMTitleFont;
    timeView.textColor = [UIColor orangeColor];
    [self addSubview:timeView];
    _timeView = timeView;
    
    
    // 时间icon

    UIImageView *timeIcon = [[UIImageView alloc] init];
    [self addSubview:timeIcon];
    _iconView = timeIcon;
    
    // 配图

    UIImageView *pic = [[UIImageView alloc] init];
    [self addSubview:pic];
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
    _timeIconView.image = [UIImage imageNamed:@"recommend_postdate"];
    
    // 时间label
    _timeView.text = news.postdate;
    
    // 配图
    [_pic sd_setImageWithURL:news.thread_icon placeholderImage:[UIImage imageNamed:@"recommend_loading_listimage"]];
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
