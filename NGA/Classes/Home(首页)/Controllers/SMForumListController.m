//
//  SMForumListController.m
//  NGA
//
//  Created by eorin on 15/10/30.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMForumListController.h"
#import "SMConst.h"
#import "SMHomeNavViewController.h"

@interface SMForumListController ()



@end

@implementation SMForumListController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = SMGlobleColor;

    
    self.tableView.tableHeaderView = [self setUpHeaderSegmentControl];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - tableView 初始化

- (instancetype)initWithStyle:(UITableViewStyle)style{
    
    return [super initWithStyle:UITableViewStylePlain];
    
}


#pragma mark - tableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
    
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"版块";
    return cell;
}
//
//// 设置tableview的header为SegmentControl
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//    return [self setUpHeaderSegmentControl];
//
//}

- (UIView *)setUpHeaderSegmentControl{

    NSArray *items = @[@"我的收藏",@"往事杂谈精选",@"魔兽世界",@"网事杂谈",@"暴雪游戏",@"游戏专版"];
    
    UISegmentedControl *seg = [[UISegmentedControl alloc] initWithItems:items];
    
    //设置位置 大小
    seg.frame = CGRectMake(0, 0, SMScreenW, 30);
    //默认选择往事杂谈精选
    seg.selectedSegmentIndex = 1;
    //设置背景色
    [seg setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"homeview_navscroll_selected_line"]]];
    //设置监听事件
    [seg addTarget:self action:@selector(changeForumList:) forControlEvents:UIControlEventValueChanged];
    return seg;
}

- (void)changeForumList:(id)sender{

    SMLog(@"切换了版块");
    
}

#pragma mark - tableView的代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)dealloc{

    [SMNotificationCenter removeObserver:self name:SMSelectForumList object:nil];

}

@end
