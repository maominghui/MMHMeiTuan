//
//  MMHMineModel.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHMineModel : NSObject
/**
 *  标题
 */
@property (nonatomic, copy)NSString *title;

/**
 *  图片名
 */
@property (nonatomic,copy)NSString *imageName;
+(instancetype)mineModel:(NSDictionary *)dict;
-(instancetype)initWithDict:(NSDictionary *)dict;

@end
