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



- (void)getModel{


    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMGlobleColor;
    self.tableView.rowHeight = 80;
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
