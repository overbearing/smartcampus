//
//  ContactsController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "ContactsController.h"
#import "ContactsModel.h"
#import "ContactsCell.h"
#import "SZDatanormal.h"
#import "ContactsDetail.h"
#import "searchView.h"
@interface ContactsController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource,UISearchTextFieldDelegate,UITextFieldDelegate>
@property (nonatomic, strong) NSMutableArray *sectionArray;
@property (nonatomic, strong) NSMutableArray *sectionTitlesArray;
@property (nonatomic, strong) UITableView * contactsTable;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) searchView * searchView;
@end

@implementation ContactsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    self.showNavigationBottomLine = YES;
    self.title = @"通讯录";
    self.leftButton.hidden = YES;
    [self initUI];
    [self loadlist];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.leftButton.isHidden) {
        [self.titleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -40, 0, self.titleView.frame.size.width-50)];
    }
}
- (void)loadlist{
    NSString * url = host(@"/system/student/list");
    if ([UserInfo shareUserInfo].sCid == nil) {
        return;
    }
    [[NetworkingManger shareManger]getDataWithUrl:url para:@{@"sCid":[UserInfo shareUserInfo].sCid} success:^(NSDictionary * _Nonnull result) {
        NSLog(@"%@",result);
        if (result[@"rows"]!= nil) {
            for (NSDictionary * dic  in result[@"rows"]) {
                ContactsModel * model = [[ContactsModel alloc]init];
                model.name = dic[@"sSname"];
                model.imageName = dic[@"sCimage"];
                model.sStuid = dic[@"sStuid"];
                model.sCname = dic[@"scname"];
                model.sSsignature = dic[@"sSsignature"];
                [self.dataArray addObject:model];
            }
            if (self.dataArray.count >0) {
                 [self setUpTableSection];
            }else{
                return;
            }
        }
    } fail:^(NSError * _Nonnull error) {
        
    }];
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray new];
    }
    return _dataArray;
}
- (NSMutableArray * )sectionArray{
    if (!_sectionArray) {
        _sectionArray = [NSMutableArray new];
    }
    return _sectionArray;;
}

- (NSMutableArray *)sectionTitlesArray{
    if (!_sectionTitlesArray) {
        _sectionTitlesArray = [NSMutableArray new];
    }
    return _sectionTitlesArray;
}

- (void)initUI{
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F2F2FC"];
    self.contactsTable = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight-kNavHeight) style:UITableViewStylePlain];
    self.contactsTable.delegate = self;
    self.contactsTable.dataSource = self;
    [self.contactsTable registerNib:[UINib nibWithNibName:@"ContactsCell" bundle:nil] forCellReuseIdentifier:@"ContactsCell"];
        self.contactsTable.rowHeight = 57.5;
        self.contactsTable.sectionHeaderHeight = 30;
//    [self genDataWithCount:30];
    [self.view addSubview:self.contactsTable];
}
//- (void)genDataWithCount:(NSInteger)count
//{
//    NSArray *xings = @[@"赵",@"钱",@"孙",@"李",@"周",@"吴",@"郑",@"王",@"冯",@"陈",@"楚",@"卫",@"蒋",@"沈",@"韩",@"杨"];
//    NSArray *ming1 = @[@"大",@"美",@"帅",@"应",@"超",@"海",@"江",@"湖",@"春",@"夏",@"秋",@"冬",@"上",@"左",@"有",@"纯"];
//    NSArray *ming2 = @[@"强",@"好",@"领",@"亮",@"超",@"华",@"奎",@"海",@"工",@"青",@"红",@"潮",@"兵",@"垂",@"刚",@"山"];
//
//    for (int i = 0; i < count; i++) {
//        NSString *name = xings[arc4random_uniform((int)xings.count)];
//        NSString *ming = ming1[arc4random_uniform((int)ming1.count)];
//        name = [name stringByAppendingString:ming];
//        if (arc4random_uniform(10) > 3) {
//            NSString *ming = ming2[arc4random_uniform((int)ming2.count)];
//            name = [name stringByAppendingString:ming];
//        }
//        ContactsModel *model = [ContactsModel new];
//        model.name = name;
//        model.imageName = [SZDatanormal randomIconImageName];
//        [self.dataArray addObject:model];
//    }
//
//}
- (void) setUpTableSection {
    UILocalizedIndexedCollation *collation = [UILocalizedIndexedCollation currentCollation];
    
    //create a temp sectionArray
    NSUInteger numberOfSections = [[collation sectionTitles] count];
    NSMutableArray *newSectionArray =  [[NSMutableArray alloc]init];
    for (NSUInteger index = 0; index<numberOfSections; index++) {
        [newSectionArray addObject:[[NSMutableArray alloc]init]];
    }
    
    // insert Persons info into newSectionArray
    for (ContactsModel *model in self.dataArray) {
        NSUInteger sectionIndex = [collation sectionForObject:model collationStringSelector:@selector(name)];
        [newSectionArray[sectionIndex] addObject:model];
    }
    
    //sort the person of each section
    for (NSUInteger index=0; index<numberOfSections; index++) {
        NSMutableArray *personsForSection = newSectionArray[index];
        NSArray *sortedPersonsForSection = [collation sortedArrayFromArray:personsForSection collationStringSelector:@selector(name)];
        newSectionArray[index] = sortedPersonsForSection;
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    [newSectionArray enumerateObjectsUsingBlock:^(NSArray *arr, NSUInteger idx, BOOL *stop) {
        if (arr.count == 0) {
            [temp addObject:arr];
        } else {
            [self.sectionTitlesArray addObject:[collation sectionTitles][idx]];
        }
    }];
    
    [newSectionArray removeObjectsInArray:temp];
    [self.sectionTitlesArray insertObject:@"" atIndex:0];
    
    self.sectionArray = newSectionArray;
    [self.contactsTable reloadData];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitlesArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return [self.sectionArray[section-1] count];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        self.searchView = [[NSBundle
                            mainBundle]loadNibNamed:@"searchView" owner:self options:nil].firstObject;
        return self.searchView;
    }else{
        UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, UIWidth, 30)];
        UILabel * title = [[UILabel alloc]init];
        title.frame = CGRectMake(15.5, 0, UIWidth, view.frame.size.height -1);
        title.backgroundColor = [UIColor colorWithHexString:@"#F5F5FC"];
        title.textColor = [UIColor colorWithHexString:@"#838383"];
        title.font = [UIFont systemFontOfSize:15.0f weight:UIFontWeightMedium];
        if (self.sectionTitlesArray.count > 0) {
            title.text = [self.sectionTitlesArray objectAtIndex:section];
        }
        view.backgroundColor = [UIColor colorWithHexString:@"#F5F5FC"];
        [view addSubview:title];
        return view;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
//    tableView.tableFooterView = [[UIView alloc]init];
//    //设置分割线内边距
//    tableView.separatorInset = UIEdgeInsetsZero;
    ContactsCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ContactsCell" forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[ContactsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactsCell"];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (section >0) {
        if (self.sectionArray != nil) {
            if (self.sectionArray > 0) {
                ContactsModel *model = self.sectionArray[section-1][row];
                cell.model = model;
            }
            
        }
    }
    
    
    return cell;
   
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return [self.sectionTitlesArray objectAtIndex:section];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 42;
    }else{
        return 30;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSUInteger section = indexPath.section;
    NSUInteger row = indexPath.row;
     ContactsModel *model = self.sectionArray[section-1][row];
    ContactsDetail * VC = [[ContactsDetail alloc]init];
    VC.sStuid = model.sStuid;
    VC.title = model.name;
    VC.name = model.name;
    VC.sCname =model.sCname;
    VC.sSsignature = model.sSsignature;
    [self.navigationController pushViewController:VC animated:YES];
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//
//    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width,25)];
//    [headerLabel setTextColor:topviewColor];
//    headerLabel.text=[self.sectionTitlesArray objectAtIndex:section];
//    return headerLabel;
//}
//- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
//    return self.sectionTitlesArray;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
