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
 *  toast
 */
- (void)showtoast:(NSString *)toastStr;
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
/**
 *  推荐的URL
 */
-(NSString *)urlWithRecomment;
/**
 *  折扣的URL
 */
-(NSString *)urlWithDiscount;
/**
 *  获取上门广告的数据
 */
-(NSString*)urlWithVisitAd;

/**
 *  获取上门的服务的数据
 */
-(NSString*)urlWithVisitService;
/**
 *  获取商家分类数据
 */
-(NSString *)urlWithCateListStr;

-(NSString *)urlWithMerchantStr:(long *)KindID offset:(long *)offset;
/**
 *  获取当前的位置
 */
-(NSString *)urlWithAddress;
/**
 *  获取地图上的数据
 */
-(NSString *)urlWithMapData;
/**
 *  家政服务的网页数据
 */
-(NSString *)urlWithHomeServerWebData:(MMHHomeServiceModel *)homeServiceModel;
/**
 *  支付帮助
 */
-(NSString *)urlWithPayHelp;
/**
 *  我要应聘
 */
-(NSString *)urlWithHelpWorking;
/**
 *  抢购的网页数据
 */
-(NSString *)urlWithRushBuyWebData;
/**
 *  折扣网页数据
 */
-(NSString *)urlWithDiscountWebData:(NSString *)urlString;
/**
 *热门排队网页数据
 */
-(NSString *)urlWithHotQueueWebData;
/**
 *  订单详情
 */
-(NSString *)urlWithShopDetailData:(NSString *)str;
/**
 * 看了本店还看了其他的
 */
-(NSString *)urlWithOtherRecommendShop:(NSString *)shopID;
/**
 *  随时退网页数据
 */
-(NSString *)urlBackAnyTimeWebData;

/**
 *  获取商家详情
 */
-(NSString *)urlWithMerchantDetail:(NSString *)poiid;

/**
 *  获取附近团购
 */
-(NSString *)urlWithMerchantAroundGroupPurchaseData:(NSString *)poiid;

@end
