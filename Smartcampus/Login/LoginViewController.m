//
//  LoginViewController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/26.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()<ASAuthorizationControllerDelegate,ASWebAuthenticationPresentationContextProviding,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *phoneview;
@property (weak, nonatomic) IBOutlet UITextField *number;
@property (weak, nonatomic) IBOutlet UIView *codeView;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIView *passView;
@property (weak, nonatomic) IBOutlet UITextField *code;
@property (weak, nonatomic) IBOutlet UIImageView *codeimg;
@property (weak, nonatomic) IBOutlet UIButton *submit;
- (IBAction)login:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topheight;
@property (weak, nonatomic) IBOutlet UIButton *getcodebtn;
- (IBAction)getcode:(UIButton *)sender;
//@property (nonatomic,strong) NSString * vercode;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    self.leftButton.hidden = YES;
    self.title = @"用户登录";
    [self initUI];
    [self setRACSignal];
    // Do any additional setup after loading the view from its nib.
}
- (void)initUI{
    self.topheight.constant = kNavHeight + 13.5;
    self.phoneview.layer.cornerRadius = 5.f;
    self.passView.layer.cornerRadius = 5.f;
    self.codeView.layer.cornerRadius = 5.f;
    self.getcodebtn.layer.cornerRadius = 5.f;
    self.phoneview.layer.masksToBounds = YES;
    self.passView.layer.masksToBounds = YES;
    self.codeimg.layer.masksToBounds = YES;
    self.getcodebtn.layer.masksToBounds = YES;
    self.passView.layer.borderColor = [UIColor colorWithHexString:@"#DEDEDE"].CGColor;
    self.passView.layer.borderWidth = 0.5;
    self.phoneview.layer.borderColor = [UIColor colorWithHexString:@"#DEDEDE"].CGColor;
    self.phoneview.layer.borderWidth = 0.5;
    self.codeView.layer.borderColor = [UIColor colorWithHexString:@"#DEDEDE"].CGColor;
    self.codeView.layer.borderWidth = 0.5;
    self.code.delegate =self;
    self.number.delegate = self;
    self.password.delegate = self;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)setRACSignal
{
    // 创建用户名信号道
    RACSignal *userNameSignal = [self.number.rac_textSignal map:^id(id value) {
        return @([self isValidUsername:value]);
    }];
    
    // 创建密码信号道
    RACSignal *passwordSignal = [self.password.rac_textSignal map:^id(id value) {
        return @([self isValidPassword:value]);
    }];
    
    // 通过信号道返回的值，设置文本字体颜色
    RAC(self.number, textColor) = [userNameSignal map:^id(id value) {
        return [value boolValue] ? [UIColor colorWithHexString:@"#1C1C1C"] : [UIColor colorWithHexString:@"#1C1C1C"];
    }];
    
    // 通过信号道返回的值，设置文本字体颜色
    RAC(self.password, textColor) = [passwordSignal map:^id(id value) {
        return [value boolValue] ? [UIColor colorWithHexString:@"#1C1C1C"] : [UIColor colorWithHexString:@"#1C1C1C"];
    }];
    
    // 创建登陆按钮信号道，并合并用户名和密码信号道
    RACSignal *loginSignal = [RACSignal combineLatest:@[userNameSignal, passwordSignal] reduce:^id(NSNumber *userNameValue, NSNumber *passwordValue){
        return @([userNameValue boolValue] && [passwordValue boolValue]);
    }];
    
    // 订阅信号
    [loginSignal subscribeNext:^(id boolValue) {
//        if ([boolValue boolValue]) {
//            self.loginBtn.userInteractionEnabled = YES;
//            [self.loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#121212"]];
//            [self.loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        }else {
//            self.loginBtn.userInteractionEnabled = NO;
//            [self.loginBtn setBackgroundColor:[UIColor colorWithHexString:@"#EDEDED"]];
//            [self.loginBtn setTitleColor:[UIColor colorWithHexString:@"#4B4B4B"] forState:UIControlStateNormal];
//        }
    }];
    
    [[self.submit rac_signalForControlEvents:(UIControlEventTouchUpInside)] subscribeNext:^(UIButton *sender) {
        [self loginAction];
    }];
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


// 验证用户名
- (BOOL)isValidUsername:(NSString *)username {
    
    // 验证用户名 - 手机号码
    NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    
    return [phoneTest evaluateWithObject:username];
}

// 验证密码 - 由数字和26个英文字母组成的字符串
- (BOOL)isValidPassword:(NSString *)password {
    
//    NSString *regEx = @"^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,20}$";
//    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
//    return [passwordTest evaluateWithObject:password];
    return YES;
}
- (BOOL)isValidEamil:(NSString *)email{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}
- (void)loginAction{
    self.number.text = @"T13526321965";
    self.password.text = @"123456";
    
    NSLog(@"%@\n%@\n%@",self.number.text,[UserInfo shareUserInfo].uuid,self.code.text);
    if ([UserInfo shareUserInfo].uuid == nil) {
        return;
    }
    //三目运算处理
    NSString *url = host(@"/auth/oauth/token");
//    NSString * url = "http://192.168.28.237:8080/auth/oauth/token";
    if (self.password.text.length <6 || self.password.text.length > 30) {
        [Toast showToastMessage:@"Password is invalid"];
        return;;
    }
    NSDictionary *para = @{@"username":self.number.text,@"password":self.password.text,@"code":self.code.text,@"uuid":[UserInfo shareUserInfo].uuid,@"client_id":@"web",@"client_secret":@"123456",@"grant_type":@"password",@"scope":@"server"};
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    [[NetworkingManger shareManger] getDataWithUrl :url para:para success:^(NSDictionary * _Nonnull result) {
          [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSInteger stateCode = [result[@"code"] integerValue];
        NSString *msg = result[@"msg"];
        if (![msg isEqualToString:@""]) {
            [Toast showToastMessage:msg];
        }
        NSLog(@"%@",result
              );
        if (stateCode == 200) {
            //成功获取datas保存用户信息
            [[UserInfo shareUserInfo] setUserData:result[@"data"]];
            [[UserInfo shareUserInfo] setToken:result[@"access_token"]];
            [[NSUserDefaults standardUserDefaults]setValue:result[@"access_token"] forKey:@"usertoken"];
//            [[UserInfo shareUserInfo] setToken:result[@"access_token"]];
            //本地存储用户账号信息(判断账户信息是否存在，是更新，否写入)
//            [JPUSHService setAlias:[NSString stringWithFormat:@"imei_%@",result[@"data"][@"id"]] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//              } seq:1];
//            NSMutableArray *localAccounts = [[[NSUserDefaults standardUserDefaults] objectForKey:@"accounts"] mutableCopy];
//            if (localAccounts == nil) {
//                localAccounts = [NSMutableArray array];
//            }
//            if (localAccounts.count == 0) {
//                NSMutableDictionary *dic = [result[@"data"] mutableCopy];
//                [dic setValue:@"1" forKey:@"isMain"];
//                [dic setValue:@"token" forKey:result[@"access_token"]];
//                [localAccounts addObject:dic];
//            }else{
//                for (NSDictionary *userInfo in localAccounts) {
//                    if ([[UserInfo shareUserInfo].user_id isEqual:userInfo[@"user_id"]]) {
//                        [localAccounts removeObject:userInfo];
//                        NSMutableDictionary *dic = [result[@"data"] mutableCopy];
//                        [dic setValue:@"1" forKey:@"isMain"];
//                        [dic setValue:@"token" forKey:result[@"access_token"]];
//                        [localAccounts addObject:dic];
//                    }else{
//                        NSMutableDictionary *dic = [result[@"data"] mutableCopy];
//                        [dic setValue:@"1" forKey:@"isMain"];
//                        [dic setValue:@"token" forKey:result[@"access_token"]];
//                        [localAccounts addObject:dic];
//                    }
//                }
//            }
//            [[NSUserDefaults standardUserDefaults] setObject:localAccounts forKey:@"accounts"];
             [[NSNotificationCenter defaultCenter] postNotificationName:loginsuccess object:nil userInfo:[[NSDictionary alloc] initWithObjectsAndKeys:@"login",@"name", nil] ];
            //返回首页
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    } fail:^(NSError * _Nonnull error) {
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    }];
    NSLog(@"%@",[UserInfo shareUserInfo].token);
}

- (IBAction)login:(UIButton *)sender {
    
}
- (IBAction)getcode:(UIButton *)sender {
    self.number.text = @"13526321965";
    self.password.text = @"123456";
    if (self.number.text.length == 0) {
               NSString *msg = @"请输入手机号";
               [Toast showToastMessage:msg];
           }else{
               if ([self isValidUsername:self.number.text]) {
                   if (self.password.text.length == 0) {
                       NSString *msg = @"请输入密码";
                       [Toast showToastMessage:msg];
                   }else{
                       [self getVerificationCode];
                   }
               }else{
                   NSString *msg = @"请输入有效手机号";
                   [Toast showToastMessage:msg];
               }
           }
}
- (void)getVerificationCode{
//TODO 获取验证码地址(三木运算)
[MBProgressHUD showHUDAddedTo:self.view animated:YES];
NSString *url = host(@"/code");
NSDictionary *para = @{};
    [[NetworkingManger shareManger] getDataWithUrl:url para:para success:^(NSDictionary * _Nonnull result) {
     [MBProgressHUD hideHUDForView:self.view animated:YES];
        NSLog(@"%@",result);
        if (result[@"data"] != nil) {
           [[UserInfo shareUserInfo] setValue:result[@"data"][@"uuid"] forKey:@"uuid"];
           
            self.code.text = result[@"data"][@"verifyCode"];
        }
//    NSInteger stateCode = [result[@"code"] integerValue];
//        NSString * imgurl = result[@"img"];
//        [self.codeimg sd_setImageWithURL:[NSURL URLWithString:imgurl] placeholderImage:[UIImage imageNamed:@""]];
    NSString *msg = result[@"msg"];
    if (![msg isEqualToString:@""]) {
        [Toast showToastMessage:msg];
    }
   
} fail:^(NSError * _Nonnull error) {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}];
    
    
}
@end
