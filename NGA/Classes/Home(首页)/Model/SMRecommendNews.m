//
//  SMRecommendNews.m
//  NGA
//
//  Created by eorin on 15/10/29.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMRecommendNews.h"
#import "MJExtension.h"
#import "NSDate+MJ.h"


@implementation SMRecommendNews

// 重写时间显示格式
- (NSString *)postdate{
    
    // 时间戳转日期 (秒数转日期)
    
    NSString *timeStamp = _postdate;
    long long int date1 = (long long int)[timeStamp intValue];

    
    
    // Tue Mar 10 17:32:22 +0800 2015
    // 字符串转换NSDate
    //    _created_at = @"Tue Mar 11 17:48:24 +0800 2015";
    
    // 日期格式字符串
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"EEE MMM d HH:mm:ss Z yyyy";
    
    // 设置格式本地化,日期格式字符串需要知道是哪个国家的日期，才知道怎么转换
//    fmt.locale = [NSLocale localeWithLocaleIdentifier:@"en_us"];
    
    NSDate *postdate = [NSDate dateWithTimeIntervalSince1970:date1];
    
    if ([postdate isThisYear]) { // 今年
        
        if ([postdate isToday]) { // 今天
            
            // 计算跟当前时间差距
            NSDateComponents *cmp = [postdate deltaWithNow];
            
            if (cmp.hour >= 1) {
                return [NSString stringWithFormat:@"%d小时之前",cmp.hour];
            }else if (cmp.minute > 1){
                return [NSString stringWithFormat:@"%d分钟之前",cmp.minute];
            }else{
                return @"刚刚";
            }
            
        }else if ([postdate isYesterday]){ // 昨天
            fmt.dateFormat = @"昨天 HH:mm";
            return  [fmt stringFromDate:postdate];
            
        }else{ // 前天
            fmt.dateFormat = @"MM-dd HH:mm";
            return  [fmt stringFromDate:postdate];
        }
        
        
        
    }else{ // 不是今年
        
        fmt.dateFormat = @"yyyy-MM-dd HH:mm";
        
        return [fmt stringFromDate:postdate];
        
    }
    
    return _postdate;

}

@end
