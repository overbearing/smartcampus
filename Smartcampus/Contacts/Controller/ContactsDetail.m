//
//  ContactsDetail.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "ContactsDetail.h"
#import "ContactsDetailCell.h"
#import "CDHeaderView.h"
#import "ContactsdetailModel.h"
@interface ContactsDetail ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * detailtable;
@property (nonatomic,strong)CDHeaderView * headerview;
@property (nonatomic,strong)NSMutableArray <ContactsdetailModel *>*list;

@end

@implementation ContactsDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    [self setShowNavigationBottomLine:YES];
    [self initUI];
    [self loaddata];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    self.detailtable = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight) style:UITableViewStylePlain];
    self.detailtable.delegate = self;
    self.detailtable.dataSource = self;
    self.detailtable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.detailtable registerNib:[UINib nibWithNibName:@"ContactsDetailCell" bundle:nil] forCellReuseIdentifier:@"ContactsDetailCell"];
    self.headerview = [[NSBundle mainBundle] loadNibNamed:@"CDHeaderView" owner:nil options:nil].firstObject;
    self.headerview.frame = CGRectMake(0, 0, UIWidth, 205);
    self.detailtable.tableHeaderView = self.headerview;
    [self.view addSubview:self.detailtable];
}
- (NSMutableArray *)list{
    if (_list) {
        _list = [NSMutableArray new];
    }
    return _list;
}
- (void)loaddata{
    self.headerview.name.text = self.name;
    self.headerview.classname.text = self.sCname;
    self.headerview.signname.text = self.sSsignature;
    if (self.sStuid == nil) {
        return;
    }
    NSString * url = host(@"/management/parentcontact/list");
    [[NetworkingManger shareManger]getDataWithUrl:url para:@{@"sStuid":self.sStuid} success:^(NSDictionary * _Nonnull result) {
           NSLog(@"%@",result);
        NSInteger code = [result[@"code"] integerValue];
                          if(code == 200){
                              self.list = [ContactsdetailModel mj_objectArrayWithKeyValuesArray:result[@"rows"]];
                              NSLog(@"%@",self.list
                                    );
                              [self.detailtable reloadData];
        }
       } fail:^(NSError * _Nonnull error) {
           
       }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.list.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ContactsDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsDetailCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    ContactsdetailModel * model = self.list[indexPath.row];
    cell.model = model;
    return  cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.5;
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
