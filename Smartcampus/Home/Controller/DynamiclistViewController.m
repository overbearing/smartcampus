//
//  DynamiclistViewController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/22.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "DynamiclistViewController.h"
#import "ClassdynamicsCell.h"
#import "EditdynamicViewController.h"
#import "dynamicModel.h"
#import "Aynamicdetail.h"
@interface DynamiclistViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * table;
@property (nonatomic,strong)NSMutableArray <dynamicModel *>* list;
@end

@implementation DynamiclistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self loadlist];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    self.barStyle = NavigationBarStyleWhite;
    self.title = @"班级动态";
    [self.rightButton setTitle:@"发动态" forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(Senddynamic) forControlEvents:UIControlEventTouchUpInside];
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight,UIWidth , UIHeight - kNavHeight) style:UITableViewStylePlain];
    self.table.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.backgroundColor = [UIColor colorWithHexString:@"#F5F5FC"];
//    [self.table registerNib:[UINib nibWithNibName:@"SportsCell" bundle:nil] forCellReuseIdentifier:@"SportsCell"];
    [self.table registerNib:[UINib nibWithNibName:@"ClassdynamicsCell" bundle:nil] forCellReuseIdentifier:@"ClassdynamicsCell"];
    [self.view addSubview:self.table];
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
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ClassdynamicsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ClassdynamicsCell" forIndexPath:indexPath];
    if (self.list.count>0) {
              dynamicModel * model = self.list[indexPath.row];
               cell.model = model;
           }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.list.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 185;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Aynamicdetail * VC = [[Aynamicdetail alloc]init];
     dynamicModel * model = self.list[indexPath.row];
    VC.htmlstring = model.clDcontent;
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)Senddynamic{
    EditdynamicViewController * VC = [[EditdynamicViewController alloc]init];
    [self.navigationController pushViewController:VC animated:YES];
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
