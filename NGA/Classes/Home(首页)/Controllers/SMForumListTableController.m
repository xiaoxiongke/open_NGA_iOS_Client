//
//  SMForumListTableController.m
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMForumListTableController.h"
#import "SMForumListCell.h"
#import "MJExtension.h"
#import "SMForumCatagory.h"
#import "SMMidCatagory.h"
#import "SMForumList.h"
#import "SMBaseTieziViewController.h"
#import "SMHomeNavViewController.h"
#import "AFNetworking.h"
#import "SMTieziModel.h"
#import "SMTieziFrameModel.h"
#import "SMResult.h"

@interface SMForumListTableController ()

/**
 *  中间模型
 */
@property (nonatomic,strong)NSMutableArray *midModelArray;

/**
 *  小模型（最里层的数据，即为需要的列表数据）
 */
@property (nonatomic,strong)NSMutableArray *smallModelArray;


@property (nonatomic,strong)NSMutableArray *tieziFrameArray;

@property (nonatomic,strong)NSMutableArray *tieziArray;

@property (nonatomic,copy) NSString *tieziTitle;

@end

@implementation SMForumListTableController

- (instancetype)init{
    if (self = [super init]) {

        SMHomeNavViewController *nav = [[SMHomeNavViewController alloc] initWithRootViewController:self];
        nav.view.backgroundColor = SMRandomColor;
        
    }
    return self;

}


- (NSMutableArray *)midModelArray{
    if (!_midModelArray) {
        _midModelArray = [NSMutableArray array];
    }
    return _midModelArray;
}

- (NSMutableArray *)smallModelArray{
    if (!_smallModelArray) {
        _smallModelArray = [NSMutableArray array];
    }
    return _smallModelArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMGlobleColor;
    self.tableView.rowHeight = 80;
//    
//    self.navigationController.navigationBarHidden = YES;
}


- (void)setMenuTitle:(NSString *)menuTitle{

    _menuTitle = menuTitle;
    self.title = menuTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView的数据源方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    // 取出模型
    SMForumCatagory *bigModel = self.bigModel;
    SMMidCatagory *midModel = bigModel.list[0];
    return midModel.list.count;
    
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    SMForumListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [SMForumListCell cellOfForumListWithTableView:tableView];

        // 取出模型
        SMForumCatagory *bigModel = self.bigModel;
        SMMidCatagory *midModel = bigModel.list[0];
        SMForumList *list = midModel.list[indexPath.row];
        // 传递模型
        cell.listModel = list;
//        self.tieziTitle = [[NSString alloc] init];
//        self.tieziTitle = cell.listModel.name;

        cell.selectedBackgroundView.backgroundColor = SMColor(69, 17, 3);
        cell.selectedBackgroundView.frame = cell.frame;
    }

    return cell;
}



#pragma mark - tableView的代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    // 取出模型
    SMForumCatagory *bigModel = self.bigModel;
    SMMidCatagory *midModel = bigModel.list[0];
    SMForumList *list = midModel.list[indexPath.row];

    // 发送请求，给创建出来的控制器传递模型
    [self loadNewData:list];
    //消除cell选择痕迹
    [self performSelector:@selector(deselect) withObject:nil afterDelay:0.2f];

}

- (void)deselect
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


//
//- (void)dealloc{
//    [SMNotificationCenter removeObserver:self name:@"SMForumList" object:nil];
//}


/**
 *  加载最新新闻
 */
- (void)loadNewData:(SMForumList *)list{
    
    AFHTTPRequestOperationManager *mgr = [AFHTTPRequestOperationManager manager];
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"access_token"] = @"9a9a07dff2a3bd3ec92d52c1303439cf";
    param[@"access_uid"] = @8081883;
    param[@"app_id"] = @1001;
    param[@"fid"] = @-7;
    param[@"sign"] = @"a1b9e2091db56c4d62d4807a22ae5b7d";
    param[@"t"] = @1446458975;
    
    [mgr POST:@"http://bbs.nga.cn/app_api.php?__lib=subject&__act=list" parameters:param success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *dict = responseObject[@"result"];
        // 设置最新获取的帖子
        NSArray *dataArray = [dict objectForKey:@"data"];
        
        NSArray *tieziArray = [SMTieziModel objectArrayWithKeyValuesArray:dataArray];
        // 列表菜单模型数组
        NSMutableArray *arrMF = [NSMutableArray array];
        
        // 设置最新获取的帖子
        
        
        if ([NSThread isMainThread])
        {
            
            for (SMTieziModel *tiezi in tieziArray) {
                SMTieziFrameModel *tieziF = [[SMTieziFrameModel alloc] init];
                tieziF.tiezi = tiezi;
                [arrMF addObject:tieziF];
            }
            self.tieziFrameArray = arrMF;
            
            SMBaseTieziViewController *tieziVc = [[SMBaseTieziViewController alloc] initWithStyle:UITableViewStylePlain];
            SMHomeNavViewController *nav = [[SMHomeNavViewController alloc] initWithRootViewController:tieziVc];
            // 取出模型
            tieziVc.tieziFrameArray = self.tieziFrameArray;
            
            // 传递模型
            tieziVc.list = list;

           
            if (ios8dwon) {
                [self presentViewController:nav  animated:YES completion:nil];
//                [self.navigationController pushViewController:tieziVc animated:YES];

                
            }else{
                [self showViewController:nav sender:nil];
            }
        
        }
        else
        {
            dispatch_sync(dispatch_get_main_queue(), ^{
                
                for (SMTieziModel *tiezi in tieziArray) {
                    SMTieziFrameModel *tieziF = [[SMTieziFrameModel alloc] init];
                    tieziF.tiezi = tiezi;
                    [arrMF addObject:tieziF];
                }
                self.tieziFrameArray = arrMF;
                
                SMBaseTieziViewController *tieziVc = [[SMBaseTieziViewController alloc] initWithStyle:UITableViewStylePlain];
                SMHomeNavViewController *nav = [[SMHomeNavViewController alloc] initWithRootViewController:tieziVc];
                
                // 取出模型
                tieziVc.tieziFrameArray = self.tieziFrameArray;
                
                // 传递模型
                tieziVc.list = list;
                
                if (ios8dwon) {
                    [self presentViewController:nav  animated:YES completion:nil];
//                [self.navigationController pushViewController:tieziVc animated:YES];
                    
                }else{
                    [self showViewController:nav sender:nil];
                }
                
            });
        }
        
    
        
    }
      failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         
         SMLog(@"%@",error);
         
     }];
    
}
  
    
@end
    
    
