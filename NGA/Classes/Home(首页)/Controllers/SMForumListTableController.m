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


@interface SMForumListTableController ()

/**
 *  中间模型
 */
@property (nonatomic,strong)NSMutableArray *midModelArray;

/**
 *  小模型（最里层的数据，即为需要的列表数据）
 */
@property (nonatomic,strong)NSMutableArray *smallModelArray;

@end

@implementation SMForumListTableController

- (instancetype)init{
    if (self = [super init]) {
//        
//        // 添加通知
//        [SMNotificationCenter addObserver:self selector:@selector(loadMenuData:) name:@"SMForumList" object:nil];
        


        
    }
    return self;
    
    
}
//
//#pragma mark - 接收通知方法
//
//- (void)loadMenuData:(NSNotification*)notification{
//
//    // 发过来的是整个大得模型
////    SMLog(@"%@",notification.userInfo[@"array"]);
//    self.bigModelArray = notification.userInfo[@"array"];
//    // 遍历数组，取出模型数组
//    for (SMForumCatagory *big in self.bigModelArray) {
//        self.midModelArray = [SMMidCatagory objectArrayWithKeyValuesArray:big.list];
//    }
//  
//    for (SMMidCatagory *mid in self.midModelArray) {
//        self.smallModelArray = [SMForumList objectArrayWithKeyValuesArray:mid.list];
//    }
//
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMGlobleColor;
    self.tableView.rowHeight = 80;
    
    // 取出模型
    for (SMForumCatagory *cata in self.bigModelArray) {
        [self.midModelArray addObjectsFromArray:cata.list];
    }
    for (SMMidCatagory *mid in self.midModelArray) {
        [self.smallModelArray addObjectsFromArray:mid.list];
    }
    
    
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


    
    return self.smallModelArray.count;
    
}

- (UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    SMForumListCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [SMForumListCell cellOfForumListWithTableView:tableView];

        // 取出模型
        
        
        SMForumList *list = self.smallModelArray[indexPath.row];
        // 传递模型
        cell.listModel = list;
  
    }

    return cell;
}

#pragma mark - tableView的代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}




- (void)dealloc{
    [SMNotificationCenter removeObserver:self name:@"SMForumList" object:nil];
}


@end
