//
//  ViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"


@interface ViewController()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *firstTableView;
@property(nonatomic, strong)NSArray *menuArray;
@property(nonatomic, strong)UIButton *leftButton;


@end
@implementation ViewController{
    NSMutableArray *_rushArray;
    NSMutableArray *_discountArray;
    NSMutableArray *_recommentArray;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = [UIColor whiteColor];
    //创建一个tableView
    
}

-(void)initData{
    //注意一定要给数组初始化，养成习惯少走弯路
    
}

@end
