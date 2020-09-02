//
//  ClassdynamicsCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "ClassdynamicsCell.h"
@interface ClassdynamicsCell()
@property (weak, nonatomic) IBOutlet UIImageView *headimg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *type;

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *number;

@end
@implementation ClassdynamicsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.type.layer.borderColor = [UIColor colorWithHexString:@"FFB04B"].CGColor;
    self.type.layer.borderWidth = 0.5;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setModel:(dynamicModel *)model{
//    self.model = model;
    if (model != nil) {
        self.name.text = model.userName;
        self.title.text = model.clDtitle;
        NSString *str = model.clDsynopsis;
        NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
         self.content.attributedText = attrStr;
        [self.content sizeToFit];
//        self.height = self.content.height + 100;
        self.cellheight = self.content.height + 140;
        switch ( [model.clDtype integerValue]) {
            case 0:
                self.type.text = @"";
                self.type.hidden = YES;
                break;
              case 1:
                self.type.text = @"公告";
                self.type.hidden = NO;
                break;
                case 2:
                self.type.text = @"通知";
                self.type.hidden = NO;
                break;
            default:
                break;
        }
        
            self.time.text = model.clDcreateTime;
        self.number.text = [NSString  stringWithFormat:@"%@人已读",model.clDfrequency];
    }
    
    
}
@end
