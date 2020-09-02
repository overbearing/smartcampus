//
//  editdynamiclis.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^editynmaiclisphoto)(void);
@interface editdynamiclis : UIView
@property (weak, nonatomic) IBOutlet UIView *photoview;
@property (weak, nonatomic) IBOutlet UITextView *article;
@property (nonatomic,copy) editynmaiclisphoto  gotophoto;

@end

NS_ASSUME_NONNULL_END
