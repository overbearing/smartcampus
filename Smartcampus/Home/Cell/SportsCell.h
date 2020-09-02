//
//  SportsCell.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SportsCelltoday)(void);
typedef void(^SportsCelltodayrecord)(void);
typedef void(^SportsCelltodayattend)(void);
@interface SportsCell : UITableViewCell
@property (nonatomic,copy)SportsCelltoday record;
@property (nonatomic,copy)SportsCelltodayrecord today;
@property (nonatomic,copy)SportsCelltodayattend attend;
@end

NS_ASSUME_NONNULL_END
