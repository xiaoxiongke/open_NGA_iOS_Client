//
//  SMTieziCell.m
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMTieziCell.h"
#import "UIImageView+WebCache.h"
#import "SMTieziModel.h"
#import "SMTieziFrameModel.h"


@interface SMTieziCell()
//
//// 标题
//@property (nonatomic, weak) UILabel *titleView;
//
//
//// 昵称
//@property (nonatomic, weak) UILabel *nameView;
//
//
//// 最后回复时间
//@property (nonatomic, weak) UILabel *timeView;
//
//
//// messIcon
//@property (nonatomic, weak) UIButton *messIconView;
//
//
//// 回复数
//@property (nonatomic, weak) UILabel *replyView;


@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *last_post;

@property (weak, nonatomic) IBOutlet UIImageView *messIcon;
@property (weak, nonatomic) IBOutlet UILabel *replyCount;

@end

@implementation SMTieziCell

+ (instancetype)cellWithTieziTableView:(UITableView *)tableView{
    
    return [[[NSBundle mainBundle] loadNibNamed:@"tieziCell" owner:nil options:nil] lastObject];
    
}

- (void)setTieziFrame:(SMTieziFrameModel *)tieziFrame{

    _tieziFrame = tieziFrame;
    
    self.titleLabel.text = tieziFrame.tiezi.subject;
    self.author.text = [NSString stringWithFormat:@"作者:%@",tieziFrame.tiezi.author];
    self.last_post.text = [NSString stringWithFormat:@"最后回复:%@",tieziFrame.tiezi.lastpost];
    self.replyCount.text = tieziFrame.tiezi.replies;
}

// 以下为代码创建 需要调整 换XIB了
//// 初始化cell
//
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    
//    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        
//        // 添加所有子控件
//        [self setUpAllChildView];
//        //        self.backgroundColor = [UIColor clearColor];
//    }
//    
//    return self;
//    
//}
//
///**
// *  设置所有子控件
// */
//- (void)setUpAllChildView{
//    
//    
//    // 标题
//    UILabel *titleLabel = [[UILabel alloc] init];
//    titleLabel.font = SMTitleFont;
//    titleLabel.numberOfLines = 0;
//    [self addSubview:titleLabel];
//    _titleView = titleLabel;
//
//    // 昵称
//    UILabel *nameView = [[UILabel alloc] init];
//    nameView.font = SMNameFont;
//    [self addSubview:nameView];
//    _nameView = nameView;
//    
//    // 时间
//    UILabel *timeView = [[UILabel alloc] init];
//    timeView.font = SMTimeFont;
//    [self addSubview:timeView];
//    _timeView = timeView;
//    
//    
//    // messIcon
//    UIButton *messIconView = [[UIButton alloc] init];
//    [self addSubview:messIconView];
//    _messIconView = messIconView;
//    
//    // reply
//    UILabel *replyView = [[UILabel alloc] init];
//    nameView.font = SMNameFont;
//    [self addSubview:replyView];
//    _replyView = replyView;
//}
//
//
//- (void)setTieziFrame:(SMTieziFrameModel *)tieziFrame{
//    _tieziFrame = tieziFrame;
//    // 设置frame
//    [self setupFrame];
//    
//    // 设置data
//    [self setUpData];
//
//}
//
//
///**
// *  设置frame
// */
//- (void)setupFrame{
// 
//    // 作者昵称
//    _nameView.frame = _tieziFrame.nameFrame;
//    
//    // 标题
//    _titleView.frame = _tieziFrame.titleFrame;
//    
//    // 时间label
//    _timeView.frame = _tieziFrame.timeLabelFrame;
//    
//    // 正文
//    _messIconView.frame = _tieziFrame.messIconFrame;
//    
//}
//
///**
// *  设置Data
// */
//- (void)setUpData{
//    
//    SMTieziModel *news = _tieziFrame.tiezi;
//    
//    // 作者昵称
//    _nameView.text = [NSString stringWithFormat:@"作者:%@", news.author];
//   
//    // 标题
//    _titleView.text = news.subject;
//    
//    // 时间label
//    _timeView.text = [NSString stringWithFormat:@"最后回复:%@",news.lastpost];
//    
//    // 回复
//    _replyView.text = news.lastpost;
//    
//    
//}
//
//
//+ (instancetype)cellTieziWithTableView:(UITableView *)tableView
//{
//    static NSString *ID = @"cell";
//    id cell = [tableView dequeueReusableCellWithIdentifier:ID ];
//    
//    if (cell == nil) {
//        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//        
//        
//    }
//    
//    return cell;
//}


@end
