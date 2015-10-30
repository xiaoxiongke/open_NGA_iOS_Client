//
//  SMRecommendNesFrame.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMRecommendNesFrame.h"
#import "SMRecommendNews.h"


@implementation SMRecommendNesFrame

- (void)setRecommendNews:(SMRecommendNews *)recommendNews{

    _recommendNews = recommendNews;
    // 计算帖子的frame
    [self setUpRecommendNesFrame];


}


#pragma mark - 计算帖子的frame
- (void)setUpRecommendNesFrame{

//    // 帖子标题
    CGFloat titleX = SMRecommendCellMargin;
    CGFloat titleY = SMRecommendCellMargin;
    CGFloat titleW = SMScreenW - 2*SMRecommendCellMargin;

    NSDictionary *attrs =  @{NSFontAttributeName:SMTitleFont};
//    CGSize titleSize = [_recommendNews.titleText sizeWithAttributes:attrs];
    
    
    CGRect titleRect = [_recommendNews.subject boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];

//    _titleFrame = (CGRect){{titleX,titleY},titleSize};
    _titleFrame = titleRect;

    
    // 作者icon
    CGFloat iconX = titleX;
    CGFloat iconY = titleY + SMRecommendCellMargin;
    CGFloat iconWH = 20;
    _userIconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    
    // 作者名称
    
    CGFloat nameX = iconX + SMRecommendCellMargin;
    CGFloat nameY = iconY + iconWH *0.5;
    NSDictionary *nameDict = [NSDictionary dictionary];
    
    nameDict = @{NSFontAttributeName:SMNameFont};
    CGSize nameSize = [_recommendNews.author sizeWithAttributes:nameDict];
    _nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 时间icon
    
    CGFloat timeIconX = nameX + SMRecommendCellMargin;
    CGFloat timeIconY = iconY;
    CGFloat timeIconWH = 20;
    _timeIconFrame = CGRectMake(timeIconX, timeIconY, timeIconWH, timeIconWH);
    
    
    // 时间label
    
    CGFloat timeLabelX = timeIconX + SMRecommendCellMargin;
    CGFloat timeLabelY = nameY;
    NSDictionary *timeDict = [NSDictionary dictionary];
    
    timeDict = @{NSFontAttributeName:SMNameFont};
    CGSize timeLabelSize = [_recommendNews.postdate sizeWithAttributes:timeDict];
    _timeLabelFrame = (CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    // 配图
    
    CGFloat picX = SMRecommendCellMargin;
    CGFloat picY = iconY + SMRecommendCellMargin;
    CGFloat picW = SMScreenW - 2*SMRecommendCellMargin;
    CGFloat picH = SMPicHeight;
    _picFrame = CGRectMake(picX, picY, picW, picH);
    
//    // 如果有配图
//        
//        CGFloat picX = SMRecommendCellMargin;
//        CGFloat picY = iconY + SMRecommendCellMargin;
//        CGFloat picW = SMScreenW - 2*SMRecommendCellMargin;
//        CGFloat picH = SMPicHeight;
//        _picFrame = CGRectMake(picX, picY, picW, picH);

    
    // 正文
        // 如果有配图
        if (_recommendNews.thread_icon) {
    
            CGFloat textLabelX = SMRecommendCellMargin;
            CGFloat textLabelY = CGRectGetMaxY(_picFrame)  + SMRecommendCellMargin;
            NSDictionary *textDict = [NSDictionary dictionary];
            
            textDict = @{NSFontAttributeName:SMContentTextFont};
            CGSize textLabelSize = [_recommendNews.thread_abstract sizeWithAttributes:textDict];
            _contentFrame = (CGRect){{textLabelX,textLabelY},textLabelSize};
    
        }
        // 没有配图
        else {
            
            CGFloat textLabelX = SMRecommendCellMargin;
            CGFloat textLabelY = iconY + SMRecommendCellMargin;
            NSDictionary *textDict = [NSDictionary dictionary];
            
            textDict = @{NSFontAttributeName:SMContentTextFont};
            CGSize textLabelSize = [_recommendNews.thread_abstract sizeWithAttributes:textDict];
            _contentFrame = (CGRect){{textLabelX,textLabelY},textLabelSize};
            
        }

    // cell的高度
    
    _height = CGRectGetMaxY(_contentFrame) + SMRecommendCellMargin;
    

}


@end
