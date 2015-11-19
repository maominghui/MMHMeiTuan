//
//  MMHMacro.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#ifndef MMHMeiTuan_MMHMacro_h
#define MMHMeiTuan_MMHMacro_h

//设备的宽高
#define SCREENHEIGHT      [UIScreen mainScreen].bounds.size.height
#define SCREENWIDTH       [UIScreen mainScreen].bounds.size.width
//获取颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)
#define navigationBarColor RGB(33, 192, 174)
#define separaterColor RGB(200, 199, 204)


//夜间模式背景色
#define NightBGViewColor [UIColor colorWithRed:38 / 255.0 green:38 / 255.0 blue:38 / 255.0 alpha:1] // #262626
#define NightNavigationBarColor [UIColor colorWithRed:32 / 255.0 green:32 / 255.0 blue:32 / 255.0 alpha:1] // #202020
#define DawnNavigationBarColor [UIColor colorWithRed:236 / 255.0 green:236 / 255.0 blue:236 / 255.0 alpha:1] // #ECECEC
#define DawnViewBGColor [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:1] // #EBEBEB


//字体
#define kFONT16                  [UIFont systemFontOfSize:16.0f]
#define kFONT15                  [UIFont systemFontOfSize:15.0f]
#define kFONT12                  [UIFont systemFontOfSize:12.0f]
#define kFONT10                  [UIFont systemFontOfSize:10.0f]


// common
#define UserDefaults          [NSUserDefaults standardUserDefaults]


//经纬度   这里经纬度写死的，真是开发中应该根据定位出来获取到的
#define LATITUDE_DEFAULT 39.983497
#define LONGITUDE_DEFAULT 116.318042

//系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//搜索文件
#define JFSearchHistoryPath [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"hisDatas.data"]



#import "NetWork.h"
#import "GetUrlString.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "GetPlistArray.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "AFNetworking.h"
//#import "BMapKit.h"
#import "UIBarButtonItem+MMHBarButtonItem.h"
#import "UITableView+MMHTableView.h"
#import "IQKeyboardManager.h"
#import "AppConfigure.h"
#import "DKNightVersion.h"

#endif
