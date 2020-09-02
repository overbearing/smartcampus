//
//  AttendanceToday.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/20.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "AttendanceToday.h"
#import "SYPageControlView.h"
#import "ClockedinCell.h"
#import "ContactsCell.h"
@interface AttendanceToday ()<UITableViewDelegate,UITableViewDataSource,SYPageControlIndexDelegate>
@property (nonatomic, strong)UITableView * table;

@end

@implementation AttendanceToday

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
//    self.view.backgroundColor = [UIColor blueColor
//                                 ];
    [self initUI];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    NSArray * titles = @[@"到校打卡",@"离校打卡",@"体温测量"];
    UIViewController *firstVC = [[UIViewController alloc]init];
      UIViewController *secondVC = [[UIViewController alloc]init];
      UIViewController *thirdVC = [[UIViewController alloc]init];
      NSArray *controllers = @[firstVC,secondVC,thirdVC];
    SYPageControlView *pageControlView = [[SYPageControlView alloc]initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight - kNavHeight) controllertitles:titles childViewControllers:controllers delegate:self];
    [self.view addSubview:pageControlView];
    pageControlView.maxMenuCount = 3;
    pageControlView.selectIndex = 0;
    pageControlView.titleSelectFont = [UIFont systemFontOfSize:14];
    pageControlView.titleNormalColor = [UIColor colorWithHexString:@"#666666"];
    pageControlView.titleSelectColor = [UIColor systemBlueColor];
    pageControlView.indicatorWidth = UIWidth/3;
    pageControlView.indicatorColor = [UIColor systemBlueColor];
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight + pageControlView.btnViewHeight, UIWidth, UIHeight - kNavHeight - pageControlView.btnViewHeight) style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.table registerNib:[UINib nibWithNibName:@"ContactsCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
    [self.table registerNib:[UINib nibWithNibName:@"ClockedinCell" bundle:nil] forCellReuseIdentifier:@"ClockedinCell"];
    [self.view addSubview:self.table];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return 10;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIWidth, 30)];
    view.backgroundColor = [UIColor colorWithHexString:@"#F5F5FC"];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(16, 9, UIWidth-16, 12)];
    title.textColor = [UIColor colorWithHexString:@"#666666"];
    title.font = [UIFont systemFontOfSize:12];
    if (section == 0) {
        title.text = @"未打卡";
    }else{
        title.text = @"已打卡";
    }
    [view addSubview:title];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
//    NSInteger row = indexPath.row;
    if (section == 0) {
        ContactsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell" forIndexPath:indexPath];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        ClockedinCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ClockedinCell" forIndexPath:indexPath];
        cell.selectionStyle =  UITableViewCellSelectionStyleNone;
        return cell;
    }
    
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
