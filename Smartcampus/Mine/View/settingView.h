//
//  settingView.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/25.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^settingViewlogout)(void);
@interface settingView : UIView
@property (nonatomic, copy)settingViewlogout  logout;
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *Identity;
@property (weak, nonatomic) IBOutlet UIImageView *headimg;

@end

NS_ASSUME_NONNULL_END
