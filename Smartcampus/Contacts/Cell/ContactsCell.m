//
//  ContactsCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "ContactsCell.h"
@interface ContactsCell()
@property (weak, nonatomic) IBOutlet UIImageView *headerIcon;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation ContactsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(ContactsModel *)model{
    _model = model;
    self.nameLabel.text = [NSString stringWithFormat:@"%@",model.name];
    self.headerIcon.image = [UIImage imageNamed:model.imageName];
}
@end
