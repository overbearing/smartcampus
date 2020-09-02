//
//  EditdynamicViewController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "EditdynamicViewController.h"
#import "editdynamiclis.h"
#import "PhotoalbumController.h"
@interface EditdynamicViewController ()
@property (nonatomic,strong) editdynamiclis * editView;
@end

@implementation EditdynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.title = @"发动态";
    [self initUI];
    // Do any additional setup after loading the view from its nib.
}
- (void)initUI{
    kWeakSelf
    self.editView = [[NSBundle mainBundle] loadNibNamed:@"editdynamiclis" owner:nil options:nil].firstObject;
    self.editView.frame = CGRectMake(0, kNavHeight, UIWidth, 413);
    self.editView.gotophoto = ^{
        PhotoalbumController * VC = [[PhotoalbumController alloc]init];
        [weakSelf.navigationController pushViewController:VC animated:YES];
    };
    [self.view addSubview:self.editView];
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
