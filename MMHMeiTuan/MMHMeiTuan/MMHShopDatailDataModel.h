//
//  MMHShopDatailDataModel.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/22.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHShopDatailDataModel : NSObject
//模型里字段太多，只选了几个需要用的
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSString *imgurl;
@property(nonatomic, strong) NSString *mname;
@property(nonatomic, strong) NSString *title;


@property(nonatomic, strong) NSNumber *price;
@property(nonatomic, strong) NSNumber *value;//原价

@property(nonatomic, strong) NSNumber *solds;//已售
@end
