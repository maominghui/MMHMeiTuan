//
//  MMHVisitViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHVisitViewController.h"

@interface MMHVisitViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *_advArray;//广告数据源
    NSMutableArray *_homeServiceArray;//上门服务数据源
    NSMutableArray *_advImageUrlArray;//广告图片数组
}

@property (nonatomic, strong)UITableView *visitTableView;

@end

@implementation MMHVisitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"上门";
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initData{
    _advArray = [NSMutableArray array];
    _advImageUrlArray = [NSMutableArray array];
    _homeServiceArray = [NSMutableArray array];
}


@end
