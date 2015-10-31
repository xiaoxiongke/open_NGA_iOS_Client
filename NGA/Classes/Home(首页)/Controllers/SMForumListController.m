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
#import "SMListNameLabel.h"
#import "SMForumListTableController.h"



@interface SMForumListController ()<UIScrollViewDelegate>

/**
 *  横向标题列表
 */
@property (nonatomic,strong) UIScrollView *listScrollView;

@property (nonatomic,strong) NSArray *listNameArray;

///** 标题下面的内容栏 */
@property (nonatomic,strong) UIScrollView *contentScrollView;



@end

@implementation SMForumListController

- (UIScrollView *)listScrollView{
    if (!_listScrollView) {

        _listScrollView = [[UIScrollView alloc] init];
        [self.view addSubview:_listScrollView];
    }
    return _listScrollView;
}

- (UIScrollView *)contentScrollView{
    if (!_contentScrollView) {

        _contentScrollView = [[UIScrollView alloc] init];
        [self.view addSubview:_contentScrollView];
    }
    return _contentScrollView;
}


- (NSArray *)listNameArray{
    if (!_listNameArray) {
        _listNameArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"NewsURLs.plist" ofType:nil]];
    }
    return _listNameArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
 
   UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(120, 120, 50, 50);
    [self.view addSubview:btn];
    
    CGFloat listScrollY = 64;
    CGFloat listScrollH = 44;
    self.listScrollView.frame = CGRectMake(0, listScrollY, SMScreenW, listScrollH);
    self.contentScrollView.frame = CGRectMake(0, listScrollY + listScrollH, SMScreenW, self.view.height - listScrollH - 64);
//    
//    [self.view addSubview:self.listScrollView];
//    [self.view addSubview:self.contentScrollView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.listScrollView.showsHorizontalScrollIndicator = NO;
    self.listScrollView.showsVerticalScrollIndicator = NO;
    self.contentScrollView.delegate = self;
    
    [self addController];
    [self addLable];
    
    CGFloat contentX = self.childViewControllers.count * [UIScreen mainScreen].bounds.size.width;
    self.contentScrollView.contentSize = CGSizeMake(contentX, 0);
    self.contentScrollView.pagingEnabled = YES;
    
    // 添加默认控制器
    UIViewController *vc = [self.childViewControllers firstObject];
    vc.view.frame = self.contentScrollView.bounds;
    [self.contentScrollView addSubview:vc.view];
    SMListNameLabel *lable = [self.listScrollView.subviews firstObject];
    lable.scale = 1.0;
    self.contentScrollView.showsHorizontalScrollIndicator = NO;

    
}

#pragma mark - ******************** 添加方法

/** 添加子控制器 */
- (void)addController
{
    for (int i=0 ; i<self.listNameArray.count ;i++){
        SMForumListTableController  *vc1 = [[SMForumListTableController alloc] init];

        vc1.titleNavBarTitle = self.listNameArray[i][@"title"];
        vc1.urlString = self.listNameArray[i][@"urlString"];
        [self addChildViewController:vc1];
    };
}

/** 添加标题栏 */
- (void)addLable
{
    for (int i = 0; i < 8; i++) {
        CGFloat lblW = 70;
        CGFloat lblH = 40;
        CGFloat lblY = 0;
        CGFloat lblX = i * lblW;
        SMListNameLabel *lbl1 = [[SMListNameLabel alloc]init];
        UIViewController *vc = self.childViewControllers[i];
        lbl1.text =vc.title;
        lbl1.frame = CGRectMake(lblX, lblY, lblW, lblH);
        lbl1.font = [UIFont fontWithName:@"HYQiHei" size:19];
        [self.listScrollView addSubview:lbl1];
        lbl1.tag = i;
        lbl1.userInteractionEnabled = YES;
        
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
    }
    self.listScrollView.contentSize = CGSizeMake(70 * 8, 0);
    
}

/** 标题栏label的点击事件 */
- (void)lblClick:(UITapGestureRecognizer *)recognizer
{
    SMListNameLabel *titlelable = (SMListNameLabel *)recognizer.view;
    
    CGFloat offsetX = titlelable.tag * self.contentScrollView.frame.size.width;
    
    CGFloat offsetY = self.contentScrollView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    
    [self.contentScrollView setContentOffset:offset animated:YES];
    
    
}

#pragma mark - ******************** scrollView代理方法

/** 滚动结束后调用（代码导致） */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.contentScrollView.frame.size.width;
    
    // 滚动标题栏
    SMListNameLabel *titleLable = (SMListNameLabel *)self.listScrollView.subviews[index];
    
    CGFloat offsetx = titleLable.center.x - self.listScrollView.frame.size.width * 0.5;
    
    CGFloat offsetMax = self.listScrollView.contentSize.width - self.listScrollView.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    
    CGPoint offset = CGPointMake(offsetx, self.listScrollView.contentOffset.y);
    [self.listScrollView setContentOffset:offset animated:YES];
    // 添加控制器
    SMForumListTableController *newsVc = self.childViewControllers[index];
    newsVc.index = index;
    
    [self.listScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index) {
            SMListNameLabel *temlabel = self.listScrollView.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    
    if (newsVc.view.superview) return;
    
    newsVc.view.frame = scrollView.bounds;
    [self.contentScrollView addSubview:newsVc.view];
}

/** 滚动结束（手势导致） */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    SMListNameLabel *labelLeft = self.listScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.listScrollView.subviews.count) {
        SMListNameLabel *labelRight = self.listScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
    
}



@end
