//
//  SMMainViewController.m
//  NGA
//
//  Created by eorin on 15/10/31.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMMainViewController.h"
#import "UIBarButtonItem+Extension.h"
#import "SMHomeViewController.h"
#import "SMForumListController.h"

@interface SMMainViewController ()


@property (nonatomic,strong) UISegmentedControl *seg;

@property (nonatomic,strong) SMHomeViewController *homeVc;
@property (nonatomic,strong) SMForumListController *forumVc;

@end

@implementation SMMainViewController

- (UISegmentedControl *)seg{
    if (!_seg) {
#warning TODO 待修改右边的显示图片
        // titleView
        _seg = [[UISegmentedControl alloc] initWithItems:@[@"推荐",@"版块"]];
        _seg.frame =CGRectMake(0,0,200.0,20);
        
        [_seg setTitle:@"推荐"forSegmentAtIndex:0];//设置指定索引的题目
        
        [_seg setBackgroundImage:[UIImage imageNamed:@"navbar_titleview_leftbtn_unselected"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [_seg setBackgroundImage:[UIImage imageNamed:@"navbar_titleview_leftbtn_selected"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
        
        NSDictionary *normalAttrs = [NSDictionary dictionary];
        normalAttrs = @{NSFontAttributeName:SMContentTextFont,NSForegroundColorAttributeName:SMForumListFontColor};
        [_seg setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
        
        NSDictionary *selectAttrs = [NSDictionary dictionary];
        selectAttrs = @{NSFontAttributeName:SMContentTextFont,NSForegroundColorAttributeName:[UIColor whiteColor]};
        
        [_seg setTitleTextAttributes:selectAttrs forState:UIControlStateSelected];
        
        [_seg setTitle:@"版块" forSegmentAtIndex:1];
        //    [seg setImage:[UIImage imageNamed:@"recommend_forumbg"] forSegmentAtIndex:1];//设置指定索引的图片
        
        [_seg addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];

//        [SMNotificationCenter addObserver:self selector:@selector(segmentValueChanged:) name:@"UIControlEventValueChanged" object:nil];
        
        _seg.selectedSegmentIndex = 0;
        self.seg = _seg;
        self.navigationItem.titleView = _seg;

    }
    return _seg;
}

- (SMHomeViewController *)homeVc{
    if (!_homeVc) {
        _homeVc = [[SMHomeViewController alloc] init];
        _homeVc.view.frame = CGRectMake(0, 64, self.view.width, self.view.height);
    }
    return _homeVc;
}

- (SMForumListController *)forumVc{
    if (!_forumVc) {
        _forumVc = [[SMForumListController alloc] init];
        _forumVc.view.frame = CGRectMake(0, 64, self.view.width, self.view.height);
    }
    return _forumVc;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SMGlobleColor;
    
    // 设置导航条
    [self setNav];
    
    // 进入后默认选中了推荐
    [self enterHomeView];
    self.seg.selectedSegmentIndex = 0;
//    [SMNotificationCenter postNotificationName:@"UIControlEventValueChanged" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setNav{
    // 修改颜色
    self.navigationController.navigationBar.tintColor = [UIColor clearColor];

    // 设置左右导航按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(showLeftMenu) image:@"index_drawerleft" highImage:@"index_drawerleft_night"];

    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(searchClick) image:@"navigationbar_search" highImage:@"navigationbar_search"];


    self.navigationController.navigationBar.backgroundColor = SMGlobleColor;
}

/**
 *  显示左侧菜单
 */
- (void)showLeftMenu{
    NSLog(@"showL");
    
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

/**
 *  搜索
 */
- (void)searchClick{
    NSLog(@"search");
}


//全部/分组页面的切换
- (void)segmentValueChanged:(id)sender
{
    
    if (self.seg.selectedSegmentIndex == 0) {
        
        [self enterHomeView];
    }else
    {
        [self enterForumView];
    }
    
}

- (void)enterHomeView{
    SMLog(@"dasd");
//    self.homeVc.view.hidden = NO;
//    self.forumVc.view.hidden = YES;
    [self.forumVc.view removeFromSuperview];
    [self.view addSubview:self.homeVc.view];
}

- (void)enterForumView{
    SMLog(@"dasdaaa");
//    self.homeVc.view.hidden = YES;
//    self.forumVc.view.hidden = NO;
    [self.homeVc.view removeFromSuperview];
    [self.view addSubview:self.forumVc.view];
}

//
//- (void)dealloc{
//    [SMNotificationCenter removeObserver:self name:@"UIControlEventValueChanged" object:nil];
//}
@end
