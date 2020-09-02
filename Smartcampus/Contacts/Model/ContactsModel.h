//
//  ContactsModel.h
//  Smartcampus
//
//  Created by 蜡笔小新 on 2020/8/19.
//  Copyright © 2020 蜡笔小新. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactsModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *sCid;
@property (nonatomic, copy) NSString *sStuid;
@property (nonatomic, copy) NSString * sCname;
@property (nonatomic, copy) NSString * sSsignature;
@property (nonatomic, copy) NSString *imageName;
@end

NS_ASSUME_NONNULL_END
