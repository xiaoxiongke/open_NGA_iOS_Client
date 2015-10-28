//
//  SMLeftView.m
//  NGA
//
//  Created by eorin on 15/10/28.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMLeftView.h"

@interface SMLeftView()

@property (weak, nonatomic) IBOutlet UIImageView *userIcoN;
- (IBAction)loginBtnClick:(id)sender;


- (IBAction)userCenter:(id)sender;

- (IBAction)alertMessage:(id)sender;
- (IBAction)messages:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *IDlabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;



@end

@implementation SMLeftView


- (IBAction)loginBtnClick:(id)sender {
}

- (IBAction)userCenter:(id)sender {
}

- (IBAction)alertMessage:(id)sender {
}

- (IBAction)messages:(id)sender {
}

+ (instancetype)leftView{
    return [[[NSBundle mainBundle] loadNibNamed:@"SMLeftView" owner:nil options:nil] lastObject];
}



@end
