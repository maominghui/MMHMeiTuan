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
    
    //设置刷新
    [self setRefreshInVisitTableView];
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
    [self.visitTableView addGifHeaderWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    
    //设置普通状态的动画图片
    NSMutableArray *idleImages = [NSMutableArray array];
    
    UIImage *image = [UIImage imageNamed:@"icon_listheader_animation_1"];
    [idleImages addObject:image];
    
    [self.visitTableView.gifHeader setImages:idleImages forState:MJRefreshHeaderStateIdle];
    
    //设置即将刷新的动画图片
    NSMutableArray *refreshingImages = [NSMutableArray array];
    UIImage *image1 = [UIImage imageNamed:@"icon_listheader_animation_1"];
    [refreshingImages addObject:image1];
    UIImage *image2 = [UIImage imageNamed:@"icon_listheader_animation_2"];
    [refreshingImages addObject:image2];
    
    /** 松开就可以进行刷新的状态 */
    [self.visitTableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStatePulling];
    
    //设置正在刷新的动画图片
    [self.visitTableView.gifHeader setImages:refreshingImages forState:MJRefreshHeaderStateRefreshing];
    
    //马上进入刷新状态
    [self.visitTableView.gifHeader beginRefreshing];
    
}

-(void)refreshData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //1.加载广告的数据
        [self loadAdData];
        
        //2.加载服务的数据
        [self laodServiewData];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 155.0;
    }else{
        if (_homeServiceArray.count != 0) {
            NSInteger y = (_homeServiceArray.count + 2 - 1) / 2;
            return 125 * y + 5;
        }else{
            return 125 * 5 + 5;
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        static NSString *advCell = @"advCell";
        MMHImageScrollCell *cell = [tableView dequeueReusableCellWithIdentifier:advCell];
        if (cell == nil) {
            cell = [[MMHImageScrollCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:advCell frame:CGRectMake(0, 0, SCREENWIDTH, 155)];
        }
        
        if (_advImageUrlArray.count != 0) {
            [cell setImageArr:_advImageUrlArray];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row == 1){
        MMHHomeServiceCell *cell = [MMHHomeServiceCell cellWithTableView:tableView];
        cell.delegate = self;
        [cell setHomeServiceArray:_homeServiceArray];
        return cell;
        
    }else{
        return nil;
    }
}


#pragma mark - JFHomeServiceCellDelegate
-(void)homeServiceCellTapClick:(long )index{
    JFLog(@"%ld", index-10);
    MMHHomeServiceModel *homeServiceModel = _homeServiceArray[index-10];
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithHomeServerWebData:homeServiceModel];
    
    MMHWebViewController *webView = [[MMHWebViewController alloc] init];
    webView.urlStr = urlStr;
    [self.navigationController pushViewController:webView animated:YES];
    
    
}


@end
