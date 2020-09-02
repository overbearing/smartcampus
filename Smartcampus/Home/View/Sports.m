//
//  Sports.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "Sports.h"
@implementation Sports


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    CALayer *layer = [CALayer layer];
       layer.frame = self.backview.frame;
    layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
       layer.shadowOffset = CGSizeMake(0, 0);
       layer.shadowColor = [UIColor colorWithRed:87/255.0 green:107/255.0 blue:255/255.0 alpha:0.26].CGColor;
    layer.shadowOpacity = 0.6;
       layer.shadowRadius = 6;
       layer.cornerRadius = 5;
       [self.layer insertSublayer:layer atIndex:0];
       [self.backview.layer setBorderColor:[UIColor whiteColor].CGColor];
        [self.backview.layer setBorderWidth:1.0];
       [self.backview.layer setCornerRadius:layer.cornerRadius];
       self.backview.layer.masksToBounds = YES;
       [self.backview.layer setShadowColor:[UIColor systemBlueColor].CGColor];
       [self.backview.layer setShadowPath: [UIBezierPath bezierPathWithRect:self.backview.bounds].CGPath];
    self.Attendance_today.layer.borderColor = [UIColor systemBlueColor].CGColor;
    self.Attendance_today.layer.borderWidth = 0.5;
    self.Sport_today.layer.borderColor = [UIColor systemBlueColor].CGColor;
    self.Sport_today.layer.borderWidth = 0.5;
}
//今日运动
- (IBAction)sportForToday:(UIButton *)sender {
    NSLog(@"今日运动");
    self.Sport_today = sender;
    [self.Sport_today setBackgroundColor:[UIColor systemBlueColor]];
    [self.Sport_today setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.Attendance_today setBackgroundColor:[UIColor whiteColor]];
    [self.Attendance_today setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    if (self.record) {
        self.record();
    }
}
//今日考勤
- (IBAction)attendanceForToday:(UIButton *)sender {
    NSLog(@"今日考勤");
    self.Attendance_today = sender;
    [self.Sport_today setBackgroundColor:[UIColor whiteColor]];
       [self.Sport_today setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
       [self.Attendance_today setBackgroundColor:[UIColor systemBlueColor]];
       [self.Attendance_today setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    if (self.today) {
        self.today();
    }
}
@end
