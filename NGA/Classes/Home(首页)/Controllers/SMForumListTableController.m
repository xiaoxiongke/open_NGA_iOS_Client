//
//  SMForumListTableController.m
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMForumListTableController.h"

@interface SMForumListTableController ()

@end

@implementation SMForumListTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMContentFontColor;
}


- (void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
}

- (void)setTitleNavBarTitle:(NSString *)titleNavBarTitle{

    _titleNavBarTitle = titleNavBarTitle;
    self.title = titleNavBarTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
