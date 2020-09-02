//
//  CDHeaderView.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "CDHeaderView.h"

@implementation CDHeaderView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    self.head.layer.borderColor = [UIColor colorWithHexString:@"#D9D9D9"].CGColor;
    self.head.layer.borderWidth = 1.0f;
}


@end
