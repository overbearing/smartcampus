//
//  ContactsDetailCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "ContactsDetailCell.h"
@interface ContactsDetailCell()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *number;


@end
@implementation ContactsDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(ContactsdetailModel *)model{
    self.model = model;
    self.name.text = model.clPCname;
    self.number.text = model.clPCphoneNumber
    ;
    
}
@end
