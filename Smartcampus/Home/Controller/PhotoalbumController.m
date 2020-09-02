//
//  PhotoalbumController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/25.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "PhotoalbumController.h"
#import "NewphotoController.h"
#import "PhotoalbumCell.h"
@interface PhotoalbumController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * photolist;
@end

@implementation PhotoalbumController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    self.title = @"选择相册";
    self.barStyle = NavigationBarStyleWhite;
    [self.rightButton setTitle:@"新建" forState:UIControlStateNormal];
    [self.rightButton addTarget:self action:@selector(creatphotoAlbum) forControlEvents:UIControlEventTouchUpInside];
    [self setShowNavigationBottomLine:YES];
    self.photolist = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight) style:UITableViewStylePlain];
    self.photolist.delegate = self;
    self.photolist.dataSource = self;
    self.photolist.backgroundColor = [UIColor colorWithHexString:@"#F1F4F9"];
    self.photolist.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.photolist registerNib:[UINib nibWithNibName:@"PhotoalbumCell" bundle:nil] forCellReuseIdentifier:@"PhotoalbumCell"];
    [self.view addSubview:self.photolist];
}
- (void)creatphotoAlbum{
    NewphotoController * VC = [[NewphotoController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PhotoalbumCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PhotoalbumCell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
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
