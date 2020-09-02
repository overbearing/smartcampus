//
//  SportsCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "SportsCell.h"
#import "Sports.h"
@interface SportsCell()
@property (weak, nonatomic) IBOutlet Sports *header;

@end
@implementation SportsCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.header = [[NSBundle mainBundle] loadNibNamed:@"Attendance:Sports" owner:nil options:nil].firstObject;
    self.header.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //添加手势
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gorecord:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.header addGestureRecognizer:tapGesture];
    self.header.today = ^{
        if (self.attend) {
            self.attend();
        }
    };
    self.header.record = ^{
        if (self.today) {
            self.today();
        }
    };
    [self addSubview:self.header];
    // Initialization code
}
- (void)gorecord:(UITapGestureRecognizer*)tap{
    if (self.record) {
        self.record();
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
