//
//  RecordCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "RecordCell.h"
#import "LXCalender.h"
@interface RecordCell()
@property(nonatomic,strong)LXCalendarView *calenderView;
@end
@implementation RecordCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.calenderView =[[LXCalendarView alloc]initWithFrame:CGRectMake(15, 40.5, UIWidth-30, 0)];
      
      self.calenderView.currentMonthTitleColor =[UIColor hexStringToColor:@"2c2c2c"];
      self.calenderView.lastMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];
      self.calenderView.nextMonthTitleColor =[UIColor hexStringToColor:@"8a8a8a"];

      self.calenderView.isHaveAnimation = YES;
      
      self.calenderView.isCanScroll = YES;
      self.calenderView.isShowLastAndNextBtn = YES;
      
      self.calenderView.todayTitleColor =[UIColor whiteColor];
      
      self.calenderView.selectBackColor =[UIColor systemBlueColor];
      
      self.calenderView.isShowLastAndNextDate = NO;
      
      [self.calenderView dealData];
      
      self.calenderView.backgroundColor =[UIColor whiteColor];
      [self.contentView addSubview:self.calenderView];
      
      self.calenderView.selectBlock = ^(NSInteger year, NSInteger month, NSInteger day) {
          NSLog(@"%ld年 - %ld月 - %ld日",year,month,day);
      };

    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
