//
//  SmartcampusHeader.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/18.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#ifndef SmartcampusHeader_h
#define SmartcampusHeader_h
#define host(path) [NSString stringWithFormat:@"http://192.168.28.237:8080%@", path]
#define loginsuccess @"loginsuccess"
#define vuehost @"http://121.41.79.239/#/"
//测试
#import "ConstantData.h"
#import "MainNavController.h"
#import "MineController.h"
#import "HomeController.h"
#import "LoginViewController.h"
#import "UIColor+LX.h"
#import "ContactsController.h"
#import "AttendanceRecordController.h"
#import "UIViewExt.h"
#define WeakSelf(weakSelf)  __weak __typeof(self) weakSelf = self;
#define NAVH (MAX(Device_Width, Device_Height)  == 812 ? 88 : 64)
#define TABBARH 49
#define Device_Width  [[UIScreen mainScreen] bounds].size.width//获取屏幕宽高
#define Device_Height [[UIScreen mainScreen] bounds].size.height
#import "LxButton.h"
#import "UIColor+Expanded.h"
#import "UILabel+LXLabel.h"
#import "UIView+LX_Frame.h"
#import "UIView+FTCornerdious.h"
#import "NSString+NCDate.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <AFNetworking/AFHTTPSessionManager.h>
//#import <AFNetworking/Reachability.h>
//#import <AFNetworking/NSURLSession.h>
//#import <AFNetworking/NSURLSession.h>
#import <Masonry.h>
#import <MJRefresh/MJRefresh.h>
#import <MJExtension.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Toast.h>
#import "NetworkingManger.h"
#import "UserInfo.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "Toast.h"
#import <AuthenticationServices/AuthenticationServices.h>
#import <CommonCrypto/CommonDigest.h>
//#import <WMZDialog.h>
#import "WMZDialog.h"
#import <Bugly/Bugly.h>
#import "JPUSHService.h"
#endif /* SmartcampusHeader_h */
