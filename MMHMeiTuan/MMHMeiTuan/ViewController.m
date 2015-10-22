//
//  ViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "MMHHomeMenuCell.h"


#import "MMHSelectAddressView.h"
#import "MMHAddressScrollView.h"
#import "MMHRushDataModel.h"

@interface ViewController()<UITableViewDelegate,UITableViewDataSource,MMHHomeMenuCellDelegate>

@property(nonatomic, strong)UITableView *firstTableView;
@property(nonatomic, strong)NSArray *menuArray;
@property(nonatomic, strong)UIButton *leftButton;
@property(nonatomic, strong)MMHSelectAddressView *selectAddressView;

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
    [self setupNav];
    //初始化数组
    [self initData];
    //加载城市数据
    [self laodCityData];
}

-(void)initData{
    //注意一定要给数组初始化，养成习惯少走弯路
    self.menuArray = [GetPlistArray arrayWithString:@"menuData.plist"];
    _rushArray  = [NSMutableArray array];
    _discountArray = [NSMutableArray array];
    _recommentArray = [NSMutableArray array];
}

-(void)laodCityData{
    NSArray *array =  [GetPlistArray arrayWithString:@"citydata.plist"];
    //    JFLog(@"%@", array);
}

#pragma mark - 设置导航条
-(void)setupNav{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftButton = leftBtn;
    leftBtn.frame = CGRectMake(0, 0, 40, 35);
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_upArrow"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"icon_homepage_downArrow"] forState:UIControlStateSelected];
    //先设置按钮里面的内容居中
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    //设置文字居左 －>向左移35
    [leftBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
    //设置文字居左 －>向右移30
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);
    [leftBtn setTitle:@"上海" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = kFONT12;
    [leftBtn addTarget:self action:@selector(btn_leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    UIButton *MapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    MapBtn.frame = CGRectMake(0, 0, 50, 35);
    [MapBtn setImage:[UIImage imageNamed:@"icon_homepage_map_old"] forState:UIControlStateNormal];
    [MapBtn addTarget:self action:@selector(mapBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:MapBtn];
    
    
    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    searchBar.backgroundImage = [UIImage imageNamed:@"icon_homepage_search"];
    searchBar.placeholder = @"优衣库";
    self.navigationItem.titleView = searchBar;
    
    self.selectAddressView =   [[MMHSelectAddressView alloc]initWithFrame:CGRectMake(0, 0 ,SCREENWIDTH, SCREENHEIGHT )];
    self.selectAddressView.delegate = self;
    self.selectAddressView.addressScrollView.delegate = self;
    self.selectAddressView.addressScrollView.changeCityDelegate = self;
    
    [self.view addSubview:self.selectAddressView];
    self.selectAddressView.hidden = YES;
    
    //    JFAddressScrollView *scrollerView = [JFAddressScrollView scrollView];
    //    scrollerView.delegate  = self;
    
}

#pragma mark - 设置tableView
-(void)setUpTableView{
    self.firstTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) withDelegate:self];
    self.firstTableView.backgroundColor = [UIColor clearColor]
    ;
    [self.view addSubview:self.firstTableView];
}

#pragma mark - 左边按钮
-(void)btn_leftBtnClick:(UIButton *)button{
    button.selected = !button.selected;
    self.selectAddressView.hidden = !self.selectAddressView.hidden;
}
#pragma mark - MMHSelectAddressViewTapDelegate
-(void)removeMaskView{
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    
}
#pragma mark -MMHAddressScrollViewButtonDelegate
-(void)areaButtonClick:(UIButton *)button{
    JFLog(@"%@", button.currentTitle);
    [self.leftButton setTitle:button.currentTitle forState:UIControlStateNormal];
    self.selectAddressView.hidden =  !self.selectAddressView.hidden ;
    
}
#pragma mark - MMHChangeCityButtonDelegate
-(void)changeCityButtonClick:(UIButton *)button{
    self.selectAddressView.hidden = !self.selectAddressView.hidden;
    
}
/*
 * 在刷新数据里面请求 并用GCD开辟另一个线程
 */
#pragma mark - 这个请求数据在 刷新的适合请求
-(void)refreshData{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //1.加载抢购数据
        [self laodRushBuyData];
    });
}

//1.加载抢购数据
#pragma mark - 加载抢购数据
-(void)laodRushBuyData{
    NSString *urlStr = [[GetUrlString sharedManager]urlWithRushBuy];
    [NetWork sendGetUrl:urlStr withParams:nil success:^(id responseBody) {
        NSDictionary *dataDic = [responseBody objectForKey:@"data"];
        //这个地方用MJ字典转换模型的框架
        
    } failure:^(NSError *error) {
        JFLog(@"%@", error);
        [self.firstTableView.header endRefreshing];
    }];
}

#pragma mark - tableView的数据源方法，和代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 4) {
        return _recommentArray.count +1;
    }
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0) {
//        MMHHomeMenuCell *cell = [MMHHomeMenuCell cellWithTableView:tableView menuArray:self.menuArray];
//        cell.delegate = self;
//        return cell;
//        
//    }
//    
//}
@end
