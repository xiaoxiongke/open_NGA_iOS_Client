//
//  SMSettingViewController.m
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMSettingViewController.h"
#import "SMMenuItem.h"
#import "SMSettingCell.h"
#import "SMSettingItem.h"
#import "SMAccountManaController.h"
#import "SMAboutUsController.h"
#import "SMChangePwdController.h"
#import "SMChatSettingController.h"
#import "SMSettingLabelCell.h"
#import "SMSettingLabelItem.h"
#import "SMSettingGroup.h"




@interface SMSettingViewController ()

@property (nonatomic,strong)NSMutableArray *settingItems;

@end

@implementation SMSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor grayColor];
    
    // 第0组
    [self addGroup0];
    // 第1组
    [self addGroup1];
    // 第2组
    [self addGroup2];
}

- (void)addGroup0
{
    // 0组
    SMMenuItem *accountMana = [SMMenuItem itemWithTitle:@"账号管理" destVcClass:[SMAccountManaController class]];

    SMMenuItem *changPwd = [SMMenuItem itemWithTitle:@"修改密码" destVcClass:[SMChangePwdController class]];
    
    SMSettingItem *openAlert = [SMSettingItem itemWithTitle:@"启用提醒"];
    
    SMSettingItem *receiveSystemAlert = [SMSettingItem itemWithTitle:@"接受系统消息提醒"];
    
    SMMenuItem *chatSetting = [SMMenuItem itemWithTitle:@"聊天设置" destVcClass:[SMChatSettingController class]];
    
    
    SMSettingGroup *group0 = [[SMSettingGroup alloc] init];
    group0.items = @[accountMana,changPwd,openAlert,receiveSystemAlert,chatSetting];
    
    [self.settingItems addObject:group0];
    
    
}


- (void)addGroup1
{
    // 1组
    SMSettingItem *noWifiShowIcon = [SMSettingItem itemWithTitle:@"非WiFi时显示用户头像"];
    
    SMSettingItem *noWifiShowImage = [SMSettingItem itemWithTitle:@"非WiFi时显示帖子图片"];
    
    SMSettingItem *showSign = [SMSettingItem itemWithTitle:@"签名"];
    
    SMSettingItem *nightMode = [SMSettingItem itemWithTitle:@"夜间模式"];
    
    SMSettingLabelItem *clearCache = [SMSettingLabelItem itemWithTitle:@"清除缓存" rightLabelText:@"888 MB"];
    
    clearCache.option = ^{
        
        NSLog(@"清除缓存");
    
    };
    
    
    SMSettingGroup *group1 = [[SMSettingGroup alloc] init];
    group1.items = @[noWifiShowIcon,noWifiShowImage,showSign,nightMode,clearCache];
    
    [self.settingItems addObject:group1];
    
}


- (void)addGroup2
{
    // 2组
    SMSettingItem *mark = [SMSettingItem itemWithTitle:@"评价评分"];
    
    mark.option = ^{
    
        NSLog(@"跳转到appstore!");
    
    };
    
    SMMenuItem *aboutUs = [SMMenuItem itemWithTitle:@"关于我们" destVcClass:[SMAboutUsController class]];
    
    SMSettingGroup *group2 = [[SMSettingGroup alloc] init];
    group2.items = @[mark,aboutUs];
    
    [self.settingItems addObject:group2];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.settingItems.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // 创建cell
    SMSettingCell *cell = [[SMSettingCell class] cellWithTableView:tableView];
    
    // 取出模型
    SMSettingGroup *group = self.settingItems[indexPath.section];
    SMSettingItem *item = group.items[indexPath.row];
    
    
    // 传递模型
    cell.item = item;
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
