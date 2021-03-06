//
//  SMBaseTieziViewController.m
//  NGA
//
//  Created by eorin on 15/11/2.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMBaseTieziViewController.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "SMTieziFrameModel.h"
#import "SMTieziCell.h"
#import "MJExtension.h"
#import "UIBarButtonItem+Extension.h"
@interface SMBaseTieziViewController ()



@end

@implementation SMBaseTieziViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadMoreData];
    
    // 设置导航条
    [self setUpNav];
    
    [self loadNewData];
    self.tableView.backgroundColor = SMGlobleColor;
    
    // 设置headerView

    // 添加下拉刷新控件
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    
    // 马上进入刷新状态
    [self.tableView.header beginRefreshing];
    
    // 添加上拉刷新控件
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadMoreData方法）
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
//
    self.tableView.rowHeight = 80;
    
}


- (void)setUpNav{
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(backToForumList) image:@"back_arrow" highImage:@"back_arrow_night"];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(moreClick) image:@"navbar_moremenu_selected" highImage:@"navbar_moremenu_selected"];
    self.title = self.list.name;
}

/**
 *  返回论坛列表
 */
- (void)backToForumList{

    [self dismissViewControllerAnimated:YES completion:nil];

}


/**
 *  点击了更多
 */
- (void)moreClick{

    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"更多" message:@"点击了更多按钮" preferredStyle:UIAlertControllerStyleActionSheet];
 
    UIAlertAction *cancleBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        SMLog(@"点击了取消按钮");
    }];
    UIAlertAction *resetBtn = [UIAlertAction actionWithTitle:@"重置" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        SMLog(@"点击了重置按钮");
    }];
    UIAlertAction *defaultBtn = [UIAlertAction actionWithTitle:@"默认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        SMLog(@"点击了默认按钮");
    }];
    [alertVc addAction:cancleBtn];
    [alertVc addAction:resetBtn];
    [alertVc addAction:defaultBtn];
    
    
    [self presentViewController:alertVc animated:YES completion:nil];
}

#pragma mark - tableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
//    SMTieziFrameModel *tieziF = self.tieziFrameArray[section];
    return self.tieziFrameArray.count;
    
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *ID = @"tieziCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 获取news模型
        SMTieziCell * cell = [SMTieziCell cellWithTieziTableView:tableView];
        
        SMTieziFrameModel *tieziF = self.tieziFrameArray[indexPath.row];
        // 给cell 传递模型
        cell.tieziFrame = tieziF;

        cell.selectedBackgroundView.backgroundColor = SMColor(69, 17, 3);
        cell.selectedBackgroundView.frame = cell.frame;
        
        return cell;
    }
    
    return cell;
}



#pragma mark - tableView的代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2f];
    
}

/**
 *  取消cell选择痕迹
 */
- (void)deselect
{
    
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  加载最新新闻
 */
- (void)loadNewData{
    
    NSInteger page = 1;
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
//    NSString *param = nil;
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"access_token"] = @"9a9a07dff2a3bd3ec92d52c1303439cf";
    param[@"access_uid"] = @"8081883";
    param[@"app_id"] = @"1001";
    param[@"fid"] = self.list.ID;
    param[@"sign"] = @"56660402e0a03d1b4bae45af4039e799";
    
    param[@"page"] = @(++page);
    
    NSDate *now = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[now timeIntervalSince1970]];
    
    param[@"t"] = timeSp;
    
    [mgr POST:@"http://bbs.nga.cn/app_api.php?__lib=subject&__act=list" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        // 设置最新获取的帖子
        
        if ([NSThread isMainThread])
        {
            // 列表菜单模型数组
            
            NSArray *tieziArray = [SMTieziModel objectArrayWithKeyValuesArray:responseObject[@"data"]];
            
            for (SMTieziModel *tiezi in tieziArray) {
                SMTieziFrameModel *tieziF = [[SMTieziFrameModel alloc] init];
                tieziF.tiezi = tiezi;
                [self.tieziFrameArray addObject:tieziF];
            }
            
        }
        else
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                NSArray *tieziArray = [SMTieziModel objectArrayWithKeyValuesArray:responseObject[@"data"]];
                
                for (SMTieziModel *tiezi in tieziArray) {
                    SMTieziFrameModel *tieziF = [[SMTieziFrameModel alloc] init];
                    tieziF.tiezi = tiezi;
                    [self.tieziFrameArray addObject:tieziF];
                }
                
                
            });
        }
        
        
        // 刷新表格
        [self.tableView reloadData];
        // 结束下拉刷新
        [self.tableView.header endRefreshing];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        // 结束下拉刷新
        [self.tableView.header endRefreshing];
    }];
    
}

/**
 *  加载更多新闻
 */

- (void)loadMoreData{
    
    AFHTTPRequestOperationManager *mggr = [AFHTTPRequestOperationManager manager];
    
#warning TODO 请求更多数据暂时不会实现
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    //    param[@"currentPage"] = @2;
    //    param[@"guest_token"] = @"guest056332ba85d0d4";
    
    [mggr POST:@"http://bbs.nga.cn/app_api.php?__lib=subject&__act=list" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        

        
        if ([NSThread isMainThread])
        {
            // 列表菜单模型数组
            NSArray *newsArray = [SMTieziModel objectArrayWithKeyValuesArray:responseObject[@"data"]];
            NSMutableArray *moreNews = [NSMutableArray array];
            for (SMTieziModel *news in newsArray) {
                SMTieziFrameModel *recF = [[SMTieziFrameModel alloc] init];
                recF.tiezi = news;
                [moreNews addObject:recF];
            }
            [self.tieziFrameArray addObjectsFromArray:moreNews];
            
            
            // 刷新表格
            [self.tableView reloadData];
            // 结束下拉刷新
            [self.tableView.footer endRefreshing];
            

        }
        else
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
                // 列表菜单模型数组
                NSArray *newsArray = [SMTieziModel objectArrayWithKeyValuesArray:responseObject[@"data"]];
                NSMutableArray *moreNews = [NSMutableArray array];
                for (SMTieziModel *news in newsArray) {
                    SMTieziFrameModel *recF = [[SMTieziFrameModel alloc] init];
                    recF.tiezi = news;
                    [moreNews addObject:recF];
                }
                [self.tieziFrameArray addObjectsFromArray:moreNews];
                
                
                // 刷新表格
                [self.tableView reloadData];
                // 结束下拉刷新
                [self.tableView.footer endRefreshing];
                
            });  
        }

        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        // 结束下拉刷新
        [self.tableView.footer endRefreshing];
    }];
    
}



@end
