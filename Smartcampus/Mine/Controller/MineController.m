//
//  MineController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "MineController.h"
#import "MineCell.h"
#import "View.h"
#import "SettingController.h"
#import "VueViewController.h"
@interface MineController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UICollectionView * mineCollection;
@property (nonatomic,strong)NSMutableArray * tupian;
@property (nonatomic,strong)NSMutableArray * titleArray;
@property (nonatomic,strong)NSMutableArray * student_tupian;
@property (nonatomic,strong)NSMutableArray * student_titleArray;
@property (nonatomic,strong)View * headerView;
@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    [self initUI];
    [self loadUserInfo];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.leftButton.isHidden) {
        [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -30, 0, self.titleView.frame.size.width - 50)];
    }
   
}
- (void)initNav{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    self.barStyle = NavigationBarStyleWhite;
    self.showNavigationBottomLine = YES;
    self.title = @"个人中心";
    self.leftButton.hidden = YES;
    [self.rightButton setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
//    [self.rightButton setContentMode:UIViewContentModeCenter];
//    UIButton *setting = [UIButton buttonWithType:UIButtonTypeCustom];
//    CGFloat minX = [UIScreen mainScreen].bounds.size.width - 20 - Adaptive(20);
//    setting.frame = CGRectMake(minX, kStatusBarHeight+10, 20, 20);
    [self.rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
//    [setting setImage:[UIImage imageNamed:@"setting"] forState:UIControlStateNormal];
//    [self.navView addSubview:setting];
}
- (void)initUI{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2FC"];
    for (int i=0; i<64; i++) {
        [self.tupian addObject:[UIImage imageNamed:[NSString stringWithFormat:@"教师_%d.png",i+1]]];
    }
//    for (int i=0; i<32; i++) {
//        [self.student_tupian addObject:[UIImage imageNamed:[NSString stringWithFormat:@"学生_%d.png",i+1]]];
//    }
//    NSLog(@"%@",self.tupian);
    self.titleArray = [NSMutableArray arrayWithObjects:@"大数据",@"个人空间",@"考勤系统",@"巡课系统",@"电子班牌",@"备课系统",@"智慧教室",@"物联平台", @"办公管理",@"人事管理",@"财务管理",@"党团管理",@"教务管理",@"总务管理",@"科研管理",@"办公OA",@"档案管理",@"评价管理",@"成绩分析",@"排课系统",@"健康卡",@"运动打卡",@"体育统计",@"通知公告",@"作业信息",@"课程表",@"请假条",@"学生反馈",@"班级相册",@"APP下载",@"体温记录",@"安全设置",@"通知公告",@"个人空间",@"探究中心",@"实验中心",@"课前预习",@"作业信息",@"学习日志",@"学习反馈",@"课程表",@"家校本",@"错题本",@"问老师",@"请假",@"选课",@"考勤管理",@"家校互动",@"校园直播",@"视频会议",@"在线课堂",@"在线公开课",@"智慧课堂",@"图书馆",@"成绩报表",@"课堂答疑",@"晨午检",@"卫生检查",@"纪律检查",@"文明检查",@"缴费管理",@"每周菜谱",@"宿舍管理",@"我的积分",nil];
//    self.student_titleArray = [NSMutableArray arrayWithObjects:@"通知公告",@"个人空间",@"探究中心",@"实验中心",@"课前预习",@"作业信息",@"学习日志",@"学习反馈",@"课程表",@"家校本",@"错题本",@"问老师",@"请假",@"选课",@"考勤管理",@"家校互动",@"校园直播",@"视频会议",@"在线课堂",@"在线公开课",@"智慧课堂",@"图书馆",@"成绩报表",@"课堂答疑",@"晨午检",@"卫生检查",@"纪律检查",@"文明检查",@"缴费管理",@"每周菜谱",@"宿舍管理",@"我的积分", nil];
    UICollectionViewFlowLayout* flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake((UIWidth-30)/4, 113);
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    self.mineCollection = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight) collectionViewLayout:flowLayout];
    self.mineCollection.backgroundColor = [UIColor clearColor];
    [self.mineCollection registerNib:[UINib nibWithNibName:NSStringFromClass([MineCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"MineCell"];
    self.mineCollection.delegate = self;
    self.mineCollection.dataSource = self;
    self.mineCollection.backgroundColor = [UIColor whiteColor];
    self.headerView = [[NSBundle mainBundle] loadNibNamed:@"View" owner:nil options:nil].firstObject;
    self.headerView.frame = CGRectMake(0, 0, UIWidth, 160);
//    [self.headerView.headIcon setImage:[UIImage imageNamed:[UserInfo shareUserInfo].sStaImage] forState:UIControlStateNormal];
    
    UIView * firstView = [[UIView alloc]initWithFrame:CGRectMake(0, flowLayout.itemSize.height*2+self.headerView.height, UIWidth, 10)];
    firstView.backgroundColor = [UIColor colorWithHexString:@"FAFAFA"];
    UIView * secondView = [[UIView alloc]initWithFrame:CGRectMake(0, firstView.top+flowLayout.itemSize.height *3 +10, UIWidth, 10)];
    secondView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    UIView * thirdView = [[UIView alloc]initWithFrame:CGRectMake(0, secondView.top+flowLayout.itemSize.height *3 +10, UIWidth, 40)];
    UILabel * title = [[UILabel alloc]initWithFrame:CGRectMake(30, 0, UIWidth, 40)];
    title.text = @"学生端";
    title.textColor = [UIColor blackColor];
    title.backgroundColor = [UIColor clearColor];
    [thirdView addSubview:title];
    thirdView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    secondView.backgroundColor = [UIColor colorWithHexString:@"#FAFAFA"];
    [self.mineCollection addSubview:firstView];
    [self.mineCollection addSubview:secondView];
    [self.mineCollection addSubview:thirdView];

    [self.mineCollection addSubview:self.headerView];
    [self.view addSubview:self.mineCollection];
    
}
- (void)loadUserInfo{
    
    [[NetworkingManger shareManger] getDataWithUrl:host(@"/system/staff/list") para:@{} success:^(NSDictionary * _Nonnull result) {
                           NSLog(@"%@",result);
                           if ([result[@"code"] integerValue] == 200) {
                              
//                               [[UserInfo shareUserInfo] setUserData:result[@"data"]];
//
//                               [[UserInfo shareUserInfo] setUsertoken:userInfo[@"token"]];
    //                           [JPUSHService setAlias:[NSString stringWithFormat:@"imei_%@",[result[@"data"] objectForKey:@"id"]] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
    //                           } seq:1];
                           }
                         
    
                       } fail:^(NSError * _Nonnull error) {
//                           if (callback) {
//                               callback();
//                           }
                       }];
}
- (NSMutableArray *)tupian{
    if (!_tupian) {
        _tupian = [NSMutableArray new];
    }
    return _tupian;
}
- (NSMutableArray *)titleArray{
    
    if (!_titleArray) {
        _titleArray = [NSMutableArray new];
    }
    return _titleArray;
}
- (NSMutableArray *)student_tupian{
    if (!_student_tupian) {
        _student_tupian = [NSMutableArray new];
    }
    return _student_tupian;
}
- (NSMutableArray *)student_titleArray{
    if (!_student_titleArray) {
        _student_titleArray = [NSMutableArray new];
    }
    return _student_tupian;
}
- (void)rightButtonClick:(UIButton *)button{
    SettingController *VC = [SettingController new];
    [self.navigationController pushViewController:VC animated:YES];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 3;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(UIWidth, 0);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return CGSizeMake(UIWidth, 160);
    }
//    else if(section == 3){
//        return CGSizeMake(UIWidth,40);
//    }
    else {
    return CGSizeMake(UIWidth, 10);
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }else if(section == 1){
        return 12;
    }
//    else if(section == 2){
//        return 12;
//    }
    else{
        return 12;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((UIWidth-30)/4,113);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 10, 0, 10);
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
  return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID=@"MineCell";
    MineCell * cell = (MineCell *)[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
//    MineModel * model = [[MineModel alloc]init];
    if (indexPath.section == 0) {
        cell.teacherImg.image = self.tupian[indexPath.row];
        cell.teacherLabel.text = self.titleArray[indexPath.row];
    }
    if (indexPath.section == 1){
        cell.teacherImg.image = self.tupian[indexPath.row+8];
        cell.teacherLabel.text = self.titleArray[indexPath.row+8];
    }
    if (indexPath.section == 2) {
        cell.teacherImg.image = self.tupian
        [indexPath.row + 20];
        cell.teacherLabel.text = self.titleArray[indexPath.row+20];
    }
    if (indexPath.section == 3) {
        cell.teacherImg.image = self.tupian[indexPath.row + 32];
        cell.teacherLabel.text = self.titleArray[indexPath.row + 32];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    VueViewController * VC = [[VueViewController alloc]init];
    if (indexPath.section == 0) {
        VC.title = self.titleArray[indexPath.item];
        if (indexPath.item == 4 || indexPath.item == 0) {
             [self.navigationController pushViewController:VC animated:YES];
        }else{
            [Toast showToastMessage:@"该功能暂未开放" inview:self.view];
        }
    }else if(indexPath.section == 1){
        if (indexPath.item == 11 ) {
            [self.navigationController pushViewController:VC animated:YES];
        }else{
            [Toast showToastMessage:@"该功能暂未开放" inview:self.view];
        }
        VC.title = self.titleArray[indexPath.item + 8];
    }else if(indexPath.section == 2){
        if (indexPath.item == 0 || indexPath.item == 1 || indexPath.item == 3 || indexPath.item == 4 || indexPath.item == 5 || indexPath.item == 11 || indexPath.item == 8 || indexPath.item == 7 ) {
           [self.navigationController pushViewController:VC animated:YES];
            }else{
                [Toast showToastMessage:@"该功能暂未开放" inview:self.view];
            }
        VC.title = self.titleArray[indexPath.item + 20];
    }
    
//    else{
//        if (indexPath.item == 28 ) {
//            [self.navigationController pushViewController:VC animated:YES];
//        }else{
//            [Toast showToastMessage:@"该功能暂未开放" inview:self.view];
//        }
//        VC.title = self.titleArray[indexPath.item + 32];
//    }
//
   
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
