//
//  NewphotoController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/25.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "NewphotoController.h"
#import "NewphotoView.h"
@interface NewphotoController ()
@property (nonatomic, strong)NewphotoView * newphoto;
@end

@implementation NewphotoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initUI];
}
- (void)initUI{
    self.barStyle = NavigationBarStyleWhite;
    self.title = @"新建相册";
    self.newphoto = [[NSBundle mainBundle]loadNibNamed:@"NewphotoView" owner:self options:nil].firstObject;
    self.newphoto.frame = CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight-kSafeAreaBottomHeight);
    [self.view addSubview:self.newphoto];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
