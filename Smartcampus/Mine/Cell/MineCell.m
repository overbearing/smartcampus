//
//  MineCell.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "MineCell.h"
@interface MineCell()
//@property (weak, nonatomic) IBOutlet UILabel *teacherLabel;
//@property (weak, nonatomic) IBOutlet UIImageView *teacherImg;

@end
@implementation MineCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

//- (void)registerNib:(UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier{
//
//}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //添加自己需要个子视图控件
        if (self) {
               self = [[NSBundle mainBundle]loadNibNamed:@"MineCell" owner:self options:nil].lastObject;
//            self.teacherImg.image = [UIImage imageNamed:self.model.img];
//            self.teacherLabel.text = self.model.name;
           }
           return self;
    }
    return self;
}
- (void)layoutSubviews{
    
    [super layoutSubviews];//一定不要忘了调用父类的方法，否则cell的布局会产生很奇怪的问题
 
}
@end
