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

    CGRect titleRect = [_recommendNews.subject boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    titleRect.origin.x = titleX;
    titleRect.origin.y = titleY;
    _titleFrame = titleRect;

    
    // 作者icon
    CGFloat iconX = titleX;
    CGFloat iconY = titleY + titleRect.size.height + SMRecommendCellMargin;
    CGFloat iconWH = 20;
    _userIconFrame = CGRectMake(iconX, iconY, iconWH, iconWH);

    // 作者名称
    
    CGFloat nameX = iconX + iconWH +SMRecommendCellMargin;
    CGFloat nameY = iconY + iconWH *0.25;
    NSDictionary *nameDict = [NSDictionary dictionary];
    
    nameDict = @{NSFontAttributeName:SMNameFont};
    CGSize nameSize = [_recommendNews.author sizeWithAttributes:nameDict];
    _nameFrame = (CGRect){{nameX,nameY},nameSize};
    
    // 时间icon
    CGFloat timeIconX = nameX + nameSize.width + SMRecommendCellMargin;
    CGFloat timeIconY = iconY;
    CGFloat timeIconWH = iconWH;
    _timeIconFrame = CGRectMake(timeIconX, timeIconY, timeIconWH, timeIconWH);
    
    // 时间label
    
    CGFloat timeLabelX = timeIconX + timeIconWH + SMRecommendCellMargin;
    CGFloat timeLabelY = nameY;
    CGSize  timeLabelSize = [_recommendNews.postdate sizeWithFont:SMTimeFont];
//    
//    timeRect.origin.x = timeLabelX;
//    timeRect.origin.y = timeLabelY;
    _timeLabelFrame = (CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    // 配图
    
    if (_recommendNews.thread_icon.length) {
        CGFloat picX = SMRecommendCellMargin;
        CGFloat picY = iconY + iconWH +SMRecommendCellMargin;
        CGFloat picW = SMScreenW - 2*SMRecommendCellMargin;
        CGFloat picH = SMPicHeight;
        _picFrame = CGRectMake(picX, picY, picW, picH);
    }else{
        
        _picFrame = CGRectMake(SMRecommendCellMargin, iconY +iconWH, 0, 0);
    
    }
    
    // 正文
        // 如果有配图
        if (_recommendNews.thread_icon) {
    

            NSDictionary *textDict = [NSDictionary dictionary];
            
            textDict = @{NSFontAttributeName:SMContentTextFont};
//            CGSize textLabelSize = [_recommendNews.thread_abstract sizeWithAttributes:textDict];
//            _contentFrame = (CGRect){{textLabelX,textLabelY},textLabelSize};
            
            
            CGRect textLabelRect = [_recommendNews.thread_abstract boundingRectWithSize:CGSizeMake(SMScreenW - 2*SMRecommendCellMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:textDict context:nil];
            CGFloat textLabelX = SMRecommendCellMargin;
            CGFloat textLabelY = CGRectGetMaxY(_picFrame)  + SMRecommendCellMargin;
            textLabelRect.origin.x = textLabelX;
            textLabelRect.origin.y = textLabelY;
            _contentFrame = textLabelRect;
    
        }
        // 没有配图
        else {
            
            CGFloat textLabelX = SMRecommendCellMargin;
            CGFloat textLabelY = iconY + iconWH + SMRecommendCellMargin;
            NSDictionary *contentDict = [NSDictionary dictionary];
            
            contentDict = @{NSFontAttributeName:SMContentTextFont};
            CGRect textLabelRect = [_recommendNews.thread_abstract boundingRectWithSize:CGSizeMake(SMScreenW - 2*SMRecommendCellMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:contentDict context:nil];
            
            textLabelRect.origin.x = textLabelX;
            textLabelRect.origin.y = textLabelY;
            _contentFrame = textLabelRect;

            
        }

    // cell的高度
    
    _height = CGRectGetMaxY(_contentFrame) + SMRecommendCellMargin;
    

}


@end
