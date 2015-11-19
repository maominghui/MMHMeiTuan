//
//  AppConfigure.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "AppConfigure.h"

@implementation AppConfigure

// bool
+ (BOOL)boolForKey:(NSString *)key {
    return [UserDefaults boolForKey:key];
}

// bool
+ (void)setBool:(BOOL)value forKey:(NSString *)key {
    [UserDefaults setBool:value forKey:key];
}

@end
