//
//  MMHVisitViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHVisitViewController.h"
#import "MMHImageScrollCell.h"
#import "MMHServiceAdModel.h"
#import "MMHHomeServiceCell.h"
#import "MMHHomeServiceModel.h"
#import "MMHWebViewController.h"


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
    self.title = @"上门服务";
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //初始化数组
    [self initData];
    
    //初始化TableView
    [self initVisitTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 加载广告的数据
-(void)loadAdData{
    NSString *urlString = [[GetUrlString sharedManager]urlWithVisitAd];
    [NetWork sendGetUrl:urlString withParams:nil success:^(id responseBody) {
        JFLog(@"%@", responseBody);
        [_advImageUrlArray removeAllObjects];
        [_advArray removeAllObjects];
        
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dataArray.count;  ++i) {
            MMHServiceAdModel *serviceAdvM = [MMHServiceAdModel objectWithKeyValues:dataArray[i]];
            [_advArray addObject:serviceAdvM];
            [_advImageUrlArray addObject:serviceAdvM.imgUrl];
        }
        
        [self.visitTableView reloadData];
    } failure:^(NSError *error) {
        JFLog(@"%@",error);
    }];
}

#pragma mark - 加载家政服务的数据
-(void)laodServiewData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithVisitService];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        JFLog(@"%@",responseBody);
        
        [_homeServiceArray removeAllObjects];
        NSMutableArray *dataArray = [responseBody objectForKey:@"data"];
        for (int i = 0; i < dataArray.count; ++i) {
            MMHHomeServiceModel *homeM = [MMHHomeServiceModel objectWithKeyValues:dataArray[i]];
            [_homeServiceArray addObject:homeM];
        }
        
        [self.visitTableView.header endRefreshing];
        [self.visitTableView reloadData];
        
    } failure:^(NSError *error) {
        JFLog(@"%@", error);
        [self.visitTableView.header endRefreshing];
    }];
}

-(void)initData{
    _advArray = [NSMutableArray array];
    _advImageUrlArray = [NSMutableArray array];
    _homeServiceArray = [NSMutableArray array];
}

-(void)initVisitTableView{
    self.visitTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    [self.view addSubview:self.visitTableView];
}

#pragma mark - 设置下拉刷新
-(void)setRefreshInVisitTableView{
    //添加下拉的动画图片
    //设置下拉刷新回调

}

@end
