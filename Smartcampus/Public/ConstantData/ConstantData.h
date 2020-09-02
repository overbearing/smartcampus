//
//  ConstantData.h
//  RoseRiding
//
//  Created by MR_THT on 2020/3/24.
//  Copyright © 2020 MR_THT. All rights reserved.
//

#ifndef ConstantData_h
#define ConstantData_h

//MARK:- UI适配
#define Adaptive(x) (x / 375.0 * UIWidth)
#define UIWidth UIScreen.mainScreen.bounds.size.width
#define UIHeight UIScreen.mainScreen.bounds.size.height
#define UIKeyWindow [[UIApplication sharedApplication] keyWindow]

#define Device_iPhoneX (UIHeight >= 812.f ? YES : NO)// iPhone X系列
#define Device_iPhone5 (UIWidth == 320.f && UIHeight == 568.f ? YES : NO)// iPhone SE / 5s 等小屏幕。有些地方需要单独适配小屏幕的尺寸
#define Device_iPhone_Plus (UIWidth == 414.f && UIHeight == 736.f ? YES : NO)// plus
#define Device_iPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)// iPad

#define kStatusBarHeight (Device_iPhoneX ? 44.f : 20.f)// status bar height.
#define kSafeAreaTopHeight (Device_iPhoneX ? 24.f : 0)// 顶部safe area
#define kSafeAreaBottomHeight (Device_iPhoneX ? 34.f : 0.f)// 底部safe area
#define kNavHeight (Device_iPhoneX ? 88.f : 64.f)// navbar+statusbar height

//MARK:- 颜色字体
#define kRGB(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define kFont(fontSize) [UIFont systemFontOfSize:(fontSize)]
#define kBoldFont(fontSize) [UIFont boldSystemFontOfSize:(fontSize)]
#define kMediumFont(fontSize) [UIFont fontWithName:@"PingFang-SC-Medium" size:(fontSize)]
#define kImageViewColor kColor(@"#FFF2F2F2")//图片的背景颜色

//MARK:- 常用宏
// weakSelf
#define kWeakSelf __block __weak __typeof(&*self)weakSelf = self;\
// APP版本
#define kAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
// biuld版本
#define kBuildVersion [[[NSBundle mainBundle] infoDictionary] valueForKey:@"CFBundleVersion"]
// 本地存储
#define kUserDefaults [NSUserDefaults standardUserDefaults]
//用户反馈消息提示

//#define AUTO_CONNECTING @"auto connecting "

#endif /* ConstantData_h */

