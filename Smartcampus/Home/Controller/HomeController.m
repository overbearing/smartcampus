//
//  HomeController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "HomeController.h"
#import "SportsCell.h"
#import "Sports.h"
#import "AttendanceToday.h"
#import "ClassdynamicsCell.h"
//#import "ConstantData.h"
#import "LoginViewController.h"
#import "DynamiclistViewController.h"
#import "dynamicModel.h"
#import "NSString+NCDate.h"
@interface HomeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * table;
@property (nonatomic,strong)NSMutableArray <dynamicModel *>* list;
@end

@implementation HomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self nsnotification];
    self.barStyle = NavigationBarStyleWhite;
    [self setShowNavigationBottomLine:YES];
    self.leftButton.hidden = YES;
    self.title = @"首页";
    [self initUI];
    [self gotologin];
    [self loadlist];
    
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.leftButton.isHidden) {
        [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -60, 0, self.titleView.frame.size.width-50)];
    }
}

- (NSMutableArray *)list{
    if (!_list) {
        _list = [NSMutableArray new];
    }
    return _list;
}
- (void)nsnotification{
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(login:) name:loginsuccess object:nil];
    
}
- (void)login:(NSNotification*)notify{
    NSLog(@"%@",notify.userInfo[@"name"]);
    if ([notify.userInfo[@"name"] isEqualToString:@"loginfailed"]) {
        [self gotologin];
    }
    if([notify.userInfo[@"name"] isEqualToString:@"login"]) {
        [self loadlist];
    }
    
}
- (void)initUI{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight,UIWidth , UIHeight - kNavHeight) style:UITableViewStylePlain];
    self.table.backgroundColor = [UIColor colorWithHexString:@"#F5F5FC"];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerNib:[UINib nibWithNibName:@"SportsCell" bundle:nil] forCellReuseIdentifier:@"SportsCell"];
    [self.table registerNib:[UINib nibWithNibName:@"ClassdynamicsCell" bundle:nil] forCellReuseIdentifier:@"ClassdynamicsCell"];
    [self.view addSubview:self.table];
}
- (void)loadtodaySportlist{
    NSString * url = host(@"/sports/achievement/list");
    NSString * timestr = [NSString getNowTime];
    
    if (timestr == nil) {
        return;
    }
    if ([UserInfo shareUserInfo].token == nil) {
        return;
    }
    NSDictionary * para = @{@"saNowtime":timestr};
   [[NetworkingManger shareManger] getDataWithUrl:url para:para success:^(NSDictionary * _Nonnull result) {
           NSLog(@"%@",result);
       } fail:^(NSError * _Nonnull error) {
           
       }];
}
- (void)loadAttendancelist{
    NSString * timestr = [NSString getNowTime];
    
    if (timestr == nil) {
        return;
    }
    if ([UserInfo shareUserInfo].token == nil) {
        return;
    }
    NSString * url = host(@"/attendance/clockin/countAttInfo/{time}");
    NSDictionary * para = @{@"time":timestr};
    [[NetworkingManger shareManger] getDataWithUrl:url para:para success:^(NSDictionary * _Nonnull result) {
        NSLog(@"%@",result);
    } fail:^(NSError * _Nonnull error) {
        
    }];
}
- (void)loadlist{
    if ([UserInfo shareUserInfo].sCid == nil) {
        return;
    }
    NSString * url = host(@"/management/dynamics/list");
    NSDictionary * para = @{@"sCid":[UserInfo shareUserInfo].sCid};
    [[NetworkingManger shareManger] getDataWithUrl:url para:para success:^(NSDictionary * _Nonnull result) {
        NSLog(@"---------%@",result);
        
        NSInteger stateCode = [result[@"code"] integerValue];
        NSString *msg = result[@"msg"];
        if (![msg isEqualToString:@""]) {
            [Toast showToastMessage:msg];
        }
       
        if (stateCode == 200) {
            self.list = [dynamicModel mj_objectArrayWithKeyValuesArray:result[@"rows"]];
            NSLog(@"%@",self.list);
            [self.table reloadData];
        }
    } fail:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
- (void)gotologin{
//    NSMutableArray *localAccounts = [[[NSUserDefaults standardUserDefaults] objectForKey:@"accounts"] mutableCopy];
//     NSString * localtoken = [[[NSUserDefaults standardUserDefaults]objectForKey:@"usertoken"] mutableCopy];
//    if (localtoken == nil){
               LoginViewController*loginVC = [LoginViewController new];
               loginVC.islogout = NO;
                loginVC.modalPresentationStyle = UIModalPresentationFullScreen;
               [self presentViewController:loginVC animated:YES completion:nil];
//        return;
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
              SportsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SportsCell" forIndexPath:indexPath];
                  if (cell == nil) {
                      cell = [[SportsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SportsCell"];
                  }
                  cell.selectionStyle = UITableViewCellSelectionStyleNone;
                  cell.record = ^{
                      AttendanceToday * VC = [[AttendanceToday alloc]init];
                      VC.title = @"今日打卡";
                      [self.navigationController pushViewController:VC animated:YES];
                  };
            cell.attend = ^{
//               [self loadAttendancelist];
            };
            cell.today = ^{
//                [self loadtodaySportlist];
            };
                  return cell;
        }else{
            UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIImageView * img = [[ UIImageView alloc]initWithImage:[UIImage imageNamed:@"homeimg"]];
            cell.backgroundView = img;
            return cell;
        }
    }else{
        ClassdynamicsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ClassdynamicsCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.list.count>0) {
           dynamicModel * model = self.list[indexPath.row];
            cell.model = model;
        }
        
        return  cell;
    }
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * view = [[UIView alloc]initWithFrame:(CGRect)CGRectMake(0, 0, UIWidth, 40)];
    UILabel * blue = [[UILabel alloc]initWithFrame:CGRectMake(15, 12.5, 4.5, 14)];
    blue.backgroundColor = [UIColor systemBlueColor];
    blue.layer.cornerRadius = 2.3;
    blue.layer.masksToBounds = YES;
    [view addSubview:blue];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(blue.left+7.5+blue.width, 12.5, 100, 14)];
    title.text = @"班级动态";
    title.textColor = [UIColor colorWithHexString:@"#333333"];
    title.font = [UIFont systemFontOfSize:15];
    view.backgroundColor = [UIColor whiteColor];
    [view addSubview:title];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 40;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }else{
        return self.list.count;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            return 263;
        }
        return 200;
    }else{
//        ClassdynamicsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ClassdynamicsCell" forIndexPath:indexPath];
       
        return 185;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section>0 ) {
        DynamiclistViewController * VC = [[DynamiclistViewController alloc]init];
        [self.navigationController pushViewController:VC animated:YES];
    }
    
}
@end
