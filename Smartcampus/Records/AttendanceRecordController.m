//
//  AttendanceRecordController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "AttendanceRecordController.h"
#import "RecordCell.h"
#import "SportsCell.h"

@interface AttendanceRecordController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView * recordTable;
@end

@implementation AttendanceRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    self.showNavigationBottomLine = YES;
    self.title = @"考勤记录";
    [self initUI];
    self.leftButton.hidden = YES;
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.leftButton.isHidden) {
        [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, self.titleView.frame.size.width-50)];
    }
}
-(void)initUI{
    
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2FC"];
    self.recordTable = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight) style:UITableViewStylePlain];
    self.recordTable.backgroundColor = [UIColor clearColor];
    self.recordTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.recordTable.delegate =self;
    self.recordTable.dataSource = self;
    [self.recordTable registerNib:[UINib nibWithNibName:@"RecordCell" bundle:nil] forCellReuseIdentifier:@"RecordCell"];
     [self.recordTable registerNib:[UINib nibWithNibName:@"SportsCell" bundle:nil] forCellReuseIdentifier:@"SportsCell"];
    [self.view addSubview:self.recordTable];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        RecordCell * cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
       
       cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else{
        SportsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"SportsCell" forIndexPath:indexPath];
        if (cell == nil) {
            cell = [[SportsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SportsCell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        cell.record = ^{
//            AttendanceToday * VC = [[AttendanceToday alloc]init];
//            VC.title = @"今日打卡";
//            [self.navigationController pushViewController:VC animated:YES];
//        };
        return cell;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 390;
    }else{
        return 264;
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
