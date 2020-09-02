//
//  MineCell.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MineModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MineCell : UICollectionViewCell
@property (nonatomic,strong)MineModel * model;
@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
@property (weak, nonatomic) IBOutlet UIImageView *teacherImg;
//- (void)registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;
@end

NS_ASSUME_NONNULL_END
