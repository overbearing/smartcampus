//
//  View.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "View.h"

@implementation View
- (IBAction)shouprofile:(UIButton *)sender {
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
     CALayer *layer = [CALayer layer];
    layer.frame = self.headIcon.frame;
    layer.backgroundColor = [UIColor systemBlueColor].CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowColor = [UIColor systemBlueColor].CGColor;
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 33.5;
    [self.layer insertSublayer:layer atIndex:0];
    [self.headIcon.layer setBorderColor:[UIColor whiteColor].CGColor];
     [self.headIcon.layer setBorderWidth:1.0];
    [self.headIcon.layer setCornerRadius:layer.cornerRadius];
    self.headIcon.layer.masksToBounds = YES;
    [self.headIcon.layer setShadowColor:[UIColor systemBlueColor].CGColor];
    [self.headIcon.layer setShadowPath: [UIBezierPath bezierPathWithRect:self.headIcon.bounds].CGPath];
    
}
@end
