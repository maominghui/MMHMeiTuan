//
//  MMHTabBarViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHTabBarViewController.h"
#import "MMHNavigationController.h"
#import "MMHTabBar.h"
#import "ViewController.h"
#import "MMHMineViewController.h"
#import "MMHMoreViewController.h"
#import "MMHMerchantViewController.h"
#import "MMHVisitViewController.h"

@interface MMHTabBarViewController ()<tabbarDelegate>

@property (nonatomic, strong)MMHTabBar *costomTabBar;

@end

@implementation MMHTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化tabbar
    [self setUpTabBar];
    //添加子控制器
    [self setUpAllChildViewController];
    
}

//取出系统自带的tabbar并把里面的按钮删除掉
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    for (UIView * child in self.tabBar.subviews ) {
        if ([child isKindOfClass:[UIControl class]]) {
            [child removeFromSuperview];
        }
    }
}

-(void)setUpTabBar{
    MMHTabBar *customTabBar = [[MMHTabBar alloc]init];
    customTabBar.delegate = self;
    customTabBar.frame = self.tabBar.bounds;
    self.costomTabBar = customTabBar;
    [self.tabBar addSubview:customTabBar];
}

-(void)tabBar:(MMHTabBar *)tabBar didselectedButtonFrom:(int)from to:(int)to{
    NSLog(@"%d, %d", from, to);
    self.selectedIndex = to;
    NSLog(@"%lu", (unsigned long)self.selectedIndex);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpAllChildViewController{
    ViewController *homeVC = [[ViewController alloc]init];
    [self setupChildViewController:homeVC title:@"首页" imageName:@"icon_tabbar_homepage" seleceImageName:@"icon_tabbar_homepage_selected"];
    
    MMHVisitViewController *visitVC = [[MMHVisitViewController alloc]init];
    [self setupChildViewController:visitVC title:@"上门" imageName:@"icon_tabbar_onsite" seleceImageName:@"icon_tabbar_onsite_selected"];
    
    MMHMerchantViewController *merchantVC = [[MMHMerchantViewController alloc]init];
    [self setupChildViewController:merchantVC title:@"商家" imageName:@"icon_tabbar_merchant_normal" seleceImageName:@"icon_tabbar_merchant_selected"];
    
    MMHMineViewController *mineVC = [[MMHMineViewController alloc]init];
    [self setupChildViewController:mineVC title:@"我的" imageName:@"icon_tabbar_mine" seleceImageName:@"icon_tabbar_mine_selected"];
    
    MMHMoreViewController *moreVC = [[MMHMoreViewController alloc]init];
    [self setupChildViewController:moreVC title:@"更多" imageName:@"icon_tabbar_misc" seleceImageName:@"icon_tabbar_misc_selected"];
    
}

-(void)setupChildViewController:(UIViewController*)controller title:(NSString *)title imageName:(NSString *)imageName seleceImageName:(NSString *)selectImageName{
    //    controller.title = title;
    controller.tabBarItem.title = title;//跟上面一样效果
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
    
    //包装导航控制器
    MMHNavigationController *nav = [[MMHNavigationController alloc]initWithRootViewController:controller];
    //UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    [self addChildViewController:nav];
    
    [self.costomTabBar addTabBarButtonWithItem:controller.tabBarItem];
    
}


@end
