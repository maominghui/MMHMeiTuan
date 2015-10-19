//
//  GetUrlString.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/16.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MMHHomeServiceModel;
@interface GetUrlString : NSObject
/**
 *  获取URL的单例
 */
+(GetUrlString *)sharedManager;
/**
 *  抢购URL
 */
-(NSString *)urlWithRushBuy;
/**
 *  热门排队的URL
 */
-(NSString *)urlWithHotQueue;

@end
