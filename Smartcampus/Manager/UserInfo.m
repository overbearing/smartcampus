//
//  UserInfo.m
//  RoseRiding
//
//  Created by MR_THT on 2020/3/24.
//  Copyright © 2020 MR_THT. All rights reserved.
//

#import "UserInfo.h"

@implementation UserInfo

+ (UserInfo *)shareUserInfo{
    static dispatch_once_t onceToken;
    static UserInfo *userinfo;
    dispatch_once(&onceToken, ^{
        userinfo = [[UserInfo alloc] init];
    });
    return userinfo;
}

- (void)setUserData:(NSDictionary *)userInfo{
    self.user_id = userInfo[@"user_id"];
//    self.teacherId = userInfo[@"teacherId"];
    self.token = [userInfo[@"access_token"] stringValue];
    self.createBy = userInfo[@"createBy"];
    self.sCid = userInfo[@"sCid"];
    self.sStaaddress = userInfo[@"sStaaddress"];
    self.sStaemail = userInfo[@"sStaemail"];
    self.sStaentryTime = userInfo[@"sStaentryTime"];
    self.sStaexist = userInfo[@"sStaexist"];
    self.sStaid = userInfo[@"sStaid"];
    self.sStaidNumber = userInfo[@"sStaidNumber"];
    self.sStaloginName = userInfo[@"sStaloginName"];
    self.sStaname = userInfo[@"sStaname"];
    self.sStanation = userInfo[@"sStanation"];
    self.sStapassword = userInfo[@"sStapassword"];
    self.sStapermanentAddress = userInfo[@"sStapermanentAddress"];
    self.sStaphoneNumber = userInfo[@"sStaphoneNumber"];
    self.sStapoliticalOutlook = userInfo[@"sStapoliticalOutlook"];
    self.sStauniversity = userInfo[@"sStauniversity"];
    self.schoolId = userInfo[@"schoolId"];
    self.sStasex = userInfo[@"sStasex"];
    self.sStaImage = userInfo[@"sStaImage"];
}

- (void)setUsertoken:(NSDictionary *)usertoken{
    self.token = usertoken[@"access_token"];
}

@end
