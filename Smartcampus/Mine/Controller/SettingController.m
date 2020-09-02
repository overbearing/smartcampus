//
//  SettingController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "SettingController.h"
#import "settingView.h"

@interface SettingController ()
@property (nonatomic,strong)settingView * mineView;
@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self initNav];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2FC"];
    self.mineView = [[NSBundle mainBundle] loadNibNamed:@"settingView" owner:nil options:nil].firstObject;
    self.mineView.frame = CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight);
    kWeakSelf
    self.mineView.logout = ^{
       UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            [alert addAction:[UIAlertAction actionWithTitle:@"退出" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//                [JPUSHService deleteAlias:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//                } seq:1];
        //        NSMutableArray * account = [[NSUserDefaults standardUserDefaults] objectForKey:@"accounts"];
        //        [[[NSUserDefaults standardUserDefaults] objectForKey:@"accounts"] remo];
                [weakSelf logout];
                [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"accounts"];
                LoginViewController *loginVC = [LoginViewController new];
                loginVC.islogout = YES;
                loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
                [weakSelf presentViewController:loginVC animated:YES completion:nil];
            }]];
            [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            }]];
            [weakSelf presentViewController:alert animated:YES completion:nil];
    };
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(chooseimg:)];
    [tapGesture setNumberOfTapsRequired:1];
    [self.mineView.headimg addGestureRecognizer:tapGesture];
//    self.mineView.name.text = [UserInfo shareUserInfo].sStaname;
    [self.view addSubview:self.mineView];
}
- (void)chooseimg:(UITapGestureRecognizer *)tap{
//    选择照片;
    
}
- (void)initNav{
    self.title = @"个人信息";
    self.barStyle = NavigationBarStyleWhite;
    [self.rightButton setTitle:@"保存" forState:UIControlStateNormal];
}
- (void)logout{
    NSString * url = host(@"/auth/token/logout");
    [[NetworkingManger shareManger]deleteWithUrl:url para:@{} success:^(NSDictionary * _Nonnull result) {
        NSString *msg = result[@"msg"];
        if (![msg isEqualToString:@""]) {
            [Toast showToastMessage:msg];
        }
        
    } fail:^(NSError * _Nonnull error) {
        
    }];
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
