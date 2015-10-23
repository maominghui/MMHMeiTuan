//
//  MMHTabBar.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMHTabBarButton.h"

@class MMHTabBar;

//给每个按钮定义协议 与 方法
@protocol tabbarDelegate <NSObject>
@optional
-(void)tabBar:(MMHTabBar * )tabBar didselectedButtonFrom:(int)from to:(int)to;
@end

@interface MMHTabBar : UIView
@property (weak ,nonatomic)MMHTabBarButton *selectedButton;
/**
 *  给自定义的tabbar添加按钮
 */
-(void)addTabBarButtonWithItem:(UITabBarItem *)itme;
@property(nonatomic , weak) id <tabbarDelegate> delegate;



@end
