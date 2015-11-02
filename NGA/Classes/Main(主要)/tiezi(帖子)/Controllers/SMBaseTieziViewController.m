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

@interface SMBaseTieziViewController ()


@end

@implementation SMBaseTieziViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadMoreData];
    [self loadNewData];
    self.tableView.backgroundColor = SMGlobleColor;
    
    // 设置headerView
//    self.tableView.tableHeaderView = [[UISwitch alloc] init];
    
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
        
        return cell;
    }
    
    return cell;
}

#pragma mark - tableView的代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  加载最新新闻
 */
- (void)loadNewData{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSString *param = nil;
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
                
            });  
        }

        
        // 刷新表格
        [self.tableView reloadData];
        // 结束下拉刷新
        [self.tableView.footer endRefreshing];
        
        
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        // 结束下拉刷新
        [self.tableView.footer endRefreshing];
    }];
    
}



@end
