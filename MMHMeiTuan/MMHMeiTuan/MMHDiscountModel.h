//
//  MMHDiscountModel.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/22.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHDiscountModel : NSObject

@property(nonatomic, strong) NSNumber *position;
@property(nonatomic, strong) NSString *typeface_color;
@property(nonatomic, strong) NSNumber *id;
@property(nonatomic, strong) NSMutableDictionary *share;
@property(nonatomic, strong) NSString *title;

@property(nonatomic, strong) NSString *module;
@property(nonatomic, strong) NSString *maintitle;
@property(nonatomic, strong) NSString *tplurl;
@property(nonatomic, strong) NSNumber *type;
@property(nonatomic, strong) NSString *imageurl;


@property(nonatomic, strong) NSNumber *solds;
@property(nonatomic, strong) NSString *deputytitle;


@end
