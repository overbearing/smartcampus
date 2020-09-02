//
//  editdynamiclis.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "editdynamiclis.h"

@implementation editdynamiclis
- (void)drawRect:(CGRect)rect {
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gorecord:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.photoview addGestureRecognizer:tapGesture];
}
- (void)gorecord:(UITapGestureRecognizer*)tap{
    if (self.gotophoto) {
        self.gotophoto();
    }
}
@end
