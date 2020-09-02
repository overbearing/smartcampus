//
//  dynamicModel.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/27.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface dynamicModel : NSObject
//    动态id
@property (nonatomic,strong) NSString * clDid;
// 动态创建者头像
@property (nonatomic,strong) NSString * clDimage;
// 动态创建者的姓名
@property (nonatomic,strong) NSString * userName;
//已读数量
@property (nonatomic,strong) NSString * clDfrequency;
// 动态的标题
@property (nonatomic,strong) NSString * clDtitle;
//简介
@property (nonatomic,strong) NSString * clDsynopsis;
//内容
@property (nonatomic,strong) NSString * clDcontent;
//动态的创建时间
@property (nonatomic,strong) NSString * clDcreateTime;
//动态类型 0为普通动态，1为公告，2为通知
@property (nonatomic,strong) NSString * clDtype;
@end

NS_ASSUME_NONNULL_END
