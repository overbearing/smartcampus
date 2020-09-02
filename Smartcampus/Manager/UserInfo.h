//
//  UserInfo.h
//  RoseRiding
//
//  Created by MR_THT on 2020/3/24.
//  Copyright © 2020 MR_THT. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfo : NSObject

+ (UserInfo *)shareUserInfo;
- (void)setUsertoken:(NSDictionary *)usertoken;
- (void)setUserData:(NSDictionary *)userInfo;

@property (nonatomic, strong)NSString *token;
@property (nonatomic, strong)NSString *user_id;
@property (nonatomic, strong)NSString *uuid;
@property (nonatomic, strong)NSString *teacherId;
@property (nonatomic, strong)NSString *searchValue;
@property (nonatomic, strong)NSString *createBy;
@property (nonatomic, strong)NSString *createTime;
@property (nonatomic, strong)NSString *updateBy;
@property (nonatomic, strong)NSString *updateTime;
@property (nonatomic, strong)NSString *remark;
@property (nonatomic, strong)NSString *params;
@property (nonatomic, strong)NSString *sStaid;
@property (nonatomic, strong)NSString *sCid;
@property (nonatomic, strong)NSString *schoolId;
@property (nonatomic, strong)NSString *sStaname;
@property (nonatomic, strong)NSString *sStaloginName;
@property (nonatomic, strong)NSString *sStapassword;
@property (nonatomic, strong)NSString *sStasex;
@property (nonatomic, strong)NSString *sStapoliticalOutlook;
@property (nonatomic, strong)NSString *sStanation;
@property (nonatomic, strong)NSString *sStaidNumber;
@property (nonatomic, strong)NSString *sStapermanentAddress;
@property (nonatomic, strong)NSString *sStaaddress;
@property (nonatomic, strong)NSString *sStaemail;
@property (nonatomic, strong)NSString *sStaphoneNumber;
@property (nonatomic, strong)NSString *sStaentryTime;
@property (nonatomic, strong)NSString *sStadepartureTime;
@property (nonatomic, strong)NSString *sStauniversity;
@property (nonatomic, strong)NSString *sStaeducation;
@property (nonatomic, strong)NSString *sStagraduated;
@property (nonatomic, strong)NSString *sStatitle;
@property (nonatomic, strong)NSString *sStaexist;
@property (nonatomic, strong)NSString *sStaImage;
@property (nonatomic, strong)NSString *sStaSignature;
@property (nonatomic, strong)NSString *sCname;
@property (nonatomic, strong)NSString *sIdenname;

@end

NS_ASSUME_NONNULL_END
