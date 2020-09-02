//
//  AppDelegate.m
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/17.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import "AppDelegate.h"
#import "MainTabbarController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
      self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
                 self.window.backgroundColor = [UIColor whiteColor];
                 self.window.rootViewController = [[MainTabbarController alloc] init];
                 [self.window makeKeyAndVisible];
    [Bugly startWithAppId:@"348d4a7823"];
    return YES;
}
- (void)checkoutAutoLoginCallback:(void(^)(void))callback{
//    NSMutableArray *localAccounts = [[[NSUserDefaults standardUserDefaults] objectForKey:@"accounts"] mutableCopy];
//    NSString * localtoken = [[[NSUserDefaults standardUserDefaults]objectForKey:@"usertoken"] mutableCopy];
//    if (localtoken == nil) {
//        if (callback) {
//            callback();
//        }
        LoginViewController * lo = [[LoginViewController alloc]init];
        [self.window.rootViewController  presentViewController:lo animated:YES completion:nil];
        return;
//    }else{
        
//        [[UserInfo shareUserInfo] setToken:localtoken];
//        for (NSDictionary *userInfo in localAccounts) {
//               if ([userInfo[@"isMain"] isEqual:@"1"]) {
//                   [[NetworkingManger shareManger] getDataWithUrl:host(@"/system/user") para:@{@"user_id":userInfo[@"user_id"]} success:^(NSDictionary * _Nonnull result) {
//                       NSLog(@"%@",result);
//                       if ([result[@"code"] integerValue] == 200) {
//                           [[UserInfo shareUserInfo] setUserData:result[@"data"]];
//                           [[UserInfo shareUserInfo] setToken:userInfo[@"token"]];
////                           [JPUSHService setAlias:[NSString stringWithFormat:@"imei_%@",[result[@"data"] objectForKey:@"id"]] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
////                           } seq:1];
//                       }
//                       if (callback) {
//                           callback();
//                       }
//
//                   } fail:^(NSError * _Nonnull error) {
//                       if (callback) {
//                           callback();
//                       }
//                   }];
//               }
//           }
//    }
   
//    for (NSDictionary *userInfo in localAccounts) {
//        if ([userInfo[@"isMain"] isEqual:@"1"]) {
//            [[NetworkingManger shareManger] postDataWithUrl:host(@"user/mesg") para:@{@"userid":userInfo[@"id"],@"token":userInfo[@"token"]} success:^(NSDictionary * _Nonnull result) {
//                if ([result[@"code"] integerValue] != 1) {
//                }else{
//                    [[UserInfo shareUserInfo] setUserData:result[@"data"]];
//                    [[UserInfo shareUserInfo] setToken: userInfo[@"token"]];
//                    [JPUSHService setAlias:[NSString stringWithFormat:@"imei_%@",[result[@"data"] objectForKey:@"id"]] completion:^(NSInteger iResCode, NSString *iAlias, NSInteger seq) {
//                    } seq:1];
//                }
//                if (callback) {
//                    callback();
//                }
//
//            } fail:^(NSError * _Nonnull error) {
//                if (callback) {
//                    callback();
//                }
//            }];
//        }
//    }
   
}

#pragma mark - UISceneSession lifecycle

/** 
- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}

- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}
*/
- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"applicationWillEnterForeground");

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"applicationDidEnterBackground");

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"applicationDidBecomeActive");

}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"applicationWillResignActive");

}
@end
