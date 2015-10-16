//
//  MMHHomeServiceModel.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/16.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHHomeServiceModel : NSObject
@property(nonatomic, strong) NSString *background;
@property(nonatomic, strong) NSNumber *cateId;
@property(nonatomic, strong) NSString *cateImgUrl;
@property(nonatomic, strong) NSString *cateName;
@property(nonatomic, strong) NSString *clickable;

@property(nonatomic, strong) NSString *jumpType;
@property(nonatomic, strong) NSString *jumpUrl;
@property(nonatomic, strong) NSString *open;
@property(nonatomic, strong) NSString *showType;

@end
