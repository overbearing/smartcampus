//
//  View.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface View : UIView
@property (weak, nonatomic) IBOutlet UIButton *headIcon;

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *sign;

@end

NS_ASSUME_NONNULL_END
