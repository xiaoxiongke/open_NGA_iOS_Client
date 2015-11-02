//
//  SMTieziFrameModel.m
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMTieziFrameModel.h"

@implementation SMTieziFrameModel

- (void)setTiezi:(SMTieziModel *)tiezi{

    _tiezi = tiezi;
    
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
    
    CGRect titleRect = [_tiezi.subject boundingRectWithSize:CGSizeMake(titleW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil];
    titleRect.origin.x = titleX;
    titleRect.origin.y = titleY;
    _titleFrame = titleRect;
    
    
    // 作者名称
    
    CGFloat nameX = SMRecommendCellMargin;
    CGFloat nameY = titleY + titleRect.size.height + 2*SMRecommendCellMargin;
    
    NSDictionary *nameDict = [NSDictionary dictionary];
    
    nameDict = @{NSFontAttributeName:SMNameFont};
    CGSize nameSize = [_tiezi.author sizeWithAttributes:nameDict];
    _nameFrame = (CGRect){{nameX,nameY},nameSize};
    
#warning TODO 修改时间frame显示
    // 时间label
    CGFloat timeLabelX = nameX + nameSize.width + 10 * SMRecommendCellMargin;
    CGFloat timeLabelY = nameY;
    CGSize  timeLabelSize = [_tiezi.lastpost sizeWithFont:SMTimeFont];
    //
    //    timeRect.origin.x = timeLabelX;
    //    timeRect.origin.y = timeLabelY;
    _timeLabelFrame = (CGRect){{timeLabelX,timeLabelY},timeLabelSize};
    
    // 消息icon

    CGFloat picX = SMRecommendCellMargin + timeLabelX + timeLabelSize.width;
    CGFloat picY = nameY;
    CGFloat picWH = 2*SMRecommendCellMargin;

    _messIconFrame = CGRectMake(picX, picY, picWH, picWH);
 
    // cell的高度
    
    _height = CGRectGetMaxY(_nameFrame) + SMRecommendCellMargin;
    
    
}

@end
