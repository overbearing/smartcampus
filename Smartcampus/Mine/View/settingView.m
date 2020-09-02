//
//  settingView.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/25.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "settingView.h"

@implementation settingView
- (IBAction)logout:(UIButton *)sender {
    if (self.logout) {
        self.logout();
    }
}

@end
