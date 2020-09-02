//
//  ClassdynamicsCell.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dynamicModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ClassdynamicsCell : UITableViewCell
@property (nonatomic,strong)dynamicModel * model;
@property (nonatomic,assign)CGFloat cellheight;
@end

NS_ASSUME_NONNULL_END
