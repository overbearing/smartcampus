//
//  VueViewController.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/25.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "VueViewController.h"
#import <WebKit/WebKit.h>
@interface VueViewController ()
@property (nonatomic , strong)WKWebView *webview;
@property (nonatomic , strong)NSString  *htmlContent;
@end

@implementation VueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    // Do any additional setup after loading the view.
}
- (void)initUI{
    NSString * url = vuehost;
    self.barStyle = NavigationBarStyleWhite;
//    self.view.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
    WKWebViewConfiguration *configure = [[WKWebViewConfiguration alloc] init];
    self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight - kNavHeight) configuration:configure];
//    self.webview.backgroundColor = [UIColor colorWithHexString:@"#F7F7F7"];
//    教师端
    http://121.41.79.239/#/monitor  大数据
    if ([self.title isEqualToString:@"电子班牌"]) {
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Board",url]]]];
    }
    if ([self.title isEqualToString:@"健康卡"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@HealthCard",url]]]];
    }
    if ([self.title isEqualToString:@"运动打卡"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Clock",url]]]];
    }
    if ([self.title isEqualToString:@"通知公告"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Message",url]]]];
    }
    if ([self.title isEqualToString:@"作业信息"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Homework",url]]]];
    }
    if ([self.title isEqualToString:@"课程表"]) {
           [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@TimeTable",url]]]];
    }
    if([self.title isEqualToString:@"每周菜谱"]){
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Recipe",url]]]];
    }
    if([self.title isEqualToString:@"课前预习"]){
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@Preview",url]]]];
    }
    if([self.title isEqualToString:@"问老师"]){
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@AskTeacher",url]]]];
    }
    if ([self.title isEqualToString:@"安全设置"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@securitySetting",url]]]];
    }
    if ([self.title isEqualToString:@"班级相册"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@photoAlbum",url]]]];
    }
    if ([self.title isEqualToString:@"请假条"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@leave",url]]]];
    }
    if ([self.title isEqualToString:@"学生反馈"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@studentFeedback",url]]]];
    }
    if ([self.title isEqualToString:@"排课系统"]) {
            [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@arrangeSystem",url]]]];
    }
    if ([self.title isEqualToString:@"大数据"]){
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@monitor",url]]]];
    }
//    学生端
    
//    http://121.41.79.239/#/payment 缴费管理
    if ([self.title isEqualToString:@"缴费管理"]){
        [self.webview  loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@payment",url]]]];
    }
    [self.view addSubview:self.webview];
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
