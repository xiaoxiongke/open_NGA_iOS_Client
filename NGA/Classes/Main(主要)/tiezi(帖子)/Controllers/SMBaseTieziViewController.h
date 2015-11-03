//
//  SMBaseTieziViewController.h
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMTieziFrameModel.h"
#import "SMForumList.h"

@interface SMBaseTieziViewController : UITableViewController

@property (nonatomic,strong)NSMutableArray *tieziFrameArray;

@property (nonatomic,copy) NSString *navTitle;

@property (nonatomic,strong)SMForumList *list;

@end
