//
//  CDHeaderView.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDHeaderView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *classname;
@property (weak, nonatomic) IBOutlet UILabel *signname;

@end

NS_ASSUME_NONNULL_END
