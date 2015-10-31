//
//  SMTestViewController.m
//  NGA
//
//  Created by eorin on 15/10/30.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMTestViewController.h"

@interface SMTestViewController ()
@property (weak, nonatomic) IBOutlet UILabel *asdasd;
@property (weak, nonatomic) IBOutlet UIButton *asdads;

@end

@implementation SMTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = SMGlobleColor;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
