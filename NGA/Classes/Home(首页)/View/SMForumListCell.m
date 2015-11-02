//
//  SMForumListCell.m
//  NGA
//
//  Created by eorin on 15/11/1.
//  Copyright © 2015年 eorin. All rights reserved.
//

#import "SMForumListCell.h"
#import "UIImageView+WebCache.h"


@interface SMForumListCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;



@end

@implementation SMForumListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setListModel:(SMForumList *)listModel{

    _listModel = listModel;
    
    self.iconView.image = [UIImage imageNamed:@"forum_icon_fist"];
    self.titleLabel.text = self.listModel.name;
    self.detailTextLabel.text = self.listModel.info;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellOfForumListWithTableView:(UITableView *)tableView{

    return [[[NSBundle mainBundle] loadNibNamed:@"SMForumListCell" owner:nil options:nil] lastObject];
    
}



@end
