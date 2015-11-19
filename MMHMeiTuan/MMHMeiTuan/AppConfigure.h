//
//  AppConfigure.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <Foundation/Foundation.h>

// 当前 APP 版本
#define CURRENT_APP_VERSION 1.0
// 用户第一次安装 APP 展示引导页的版本
#define LAST_SHOW_GUIDE_APP_VERSION @"Last_Show_Guide_App_Version"
// 用户是否已经登录
#define IS_LOGINED @"User_Login_Status"
// App 主题模式是否开启夜间模式
#define APP_THEME_NIGHT_MODE @"Night_Mode_Is_On"

@interface AppConfigure : NSObject

+ (BOOL)boolForKey:(NSString *)key;
+ (void)setBool:(BOOL)value forKey:(NSString *)key;

@end
