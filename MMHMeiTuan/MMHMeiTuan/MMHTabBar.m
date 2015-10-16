//
//  MMHTabBar.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHTabBar.h"
#import "MMHTabBarButton.h"

@implementation MMHTabBar

-(void)addTabBarButtonWithItem:(UITabBarItem *)item{
    //1.创建按钮
    MMHTabBarButton *button = [[MMHTabBarButton alloc]init];
    [self addSubview:button];
    //设置数据把buttonitem模型传给Button
    button.item = item;
    
    //监听点击button
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    
    //默认选中
    if (self.subviews.count == 1) {
        [self buttonClick:button];
    }
}

/**
 * button监听事件
 *
 */
-(void)buttonClick:(MMHTabBarButton*)button{
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didselectedButtonFrom:to:)]
        )
    {
        [self.delegate tabBar:self didselectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    }
    self.selectedButton.selected = NO;
    button.selected = YES;
    self.selectedButton = button;
    
}




@end
