//
//  MMHAllCityNameViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHAllCityNameViewController.h"
#import "MMHAllCityNameCell.h"
#import "MMHHotCityNameCell.h"
#import "MMHCityTitleHeaderView.h"

@interface MMHAllCityNameViewController ()

@end

@implementation MMHAllCityNameViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

-(id)init
{
    //调用父类的初始化方法
    self = [super init];
    if (self) {
        self.arrayHotCity = [NSMutableArray arrayWithObjects:@"广州市",@"北京市",@"天津市",@"西安市",@"重庆市",@"沈阳市",@"青岛市",@"济南市",@"深圳市",@"长沙市",@"无锡市", nil];
        self.keys = [NSMutableArray array];
        self.arrayCitys = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initNav];
    [self getCityData];
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);//属性的意思就是自动调整子控件与父控件中间的位置，宽高。
    _tableView.delegate = self;//设置数据源
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}

-(void)initNav
{
    self.title = @"城市列表";
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
}

-(void)OnBackBtn
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark - 获取城市数据
-(void)getCityData
{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"citydict"
                                                    ofType:@"plist"];
    self.cities = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    [self.keys addObjectsFromArray:[[self.cities allKeys]sortedArrayUsingSelector:@selector(compare:)]];
    
    //添加热门城市
    NSString *strHot = @"热";
    [self.keys insertObject:strHot atIndex:0];
    [self.cities setObject:_arrayHotCity forKey:strHot];
    
}

#pragma mark - tableView
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
} 

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSString *key = [_keys objectAtIndex:section];
    MMHCityTitleHeaderView *headerView = [MMHCityTitleHeaderView headViewWithTableView:tableView];
    headerView.keyStr = key;
    return headerView;
}

-(NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return _keys;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _keys.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
    {
        NSString *key = [_keys objectAtIndex:section];
        NSArray *citySection = [_cities objectForKey:key];
        return citySection.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 250;
    }
    else
    {
        return 44;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        MMHHotCityNameCell *cell = [MMHHotCityNameCell cellWithTableView:tableView hotCityArray:self.arrayHotCity];
        return cell;
        
    }
    else
    {
        MMHAllCityNameCell *cell = [MMHAllCityNameCell cellWithTableView:tableView cellForRowAtIndexPath:indexPath keys:_keys cities:_cities];
        return cell;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
