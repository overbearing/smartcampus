//
//  ContactsCell.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface ContactsCell : UITableViewCell
@property (nonatomic,strong) ContactsModel * model;
@end

NS_ASSUME_NONNULL_END
