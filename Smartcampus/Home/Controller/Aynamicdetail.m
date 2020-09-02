//
//  Aynamicdetail.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/29.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "Aynamicdetail.h"
#import <WebKit/WebKit.h>
@interface Aynamicdetail ()
@property (nonatomic , strong)WKWebView *webview;
@end

@implementation Aynamicdetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.barStyle = NavigationBarStyleWhite;
    self.title = @"动态详情";
    [self initUI];
    // Do any additional setup after loading the view.
}
- (void)initUI{
   
    WKWebViewConfiguration *configure = [[WKWebViewConfiguration alloc] init];
    self.webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, kNavHeight, UIWidth, UIHeight - kNavHeight) configuration:configure];
    
    [self.webview loadHTMLString:self.htmlstring baseURL:nil];
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
