//
//  Sports.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^Sportstoday)(void);
typedef void(^SportstodayRecord)(void);
@interface Sports : UIView
@property (weak, nonatomic) IBOutlet UIView *backview;
@property (weak, nonatomic) IBOutlet UIButton *Attendance_today;
@property (weak, nonatomic) IBOutlet UIButton *Sport_today;
@property (nonatomic,copy) Sportstoday  today;
@property (nonatomic,copy) SportstodayRecord  record;
- (IBAction)attendanceForToday:(UIButton *)sender;
- (IBAction)sportForToday:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
