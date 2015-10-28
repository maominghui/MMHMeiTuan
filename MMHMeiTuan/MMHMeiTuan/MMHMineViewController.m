//
//  MMHMineViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMineViewController.h"
#import "MMHMineModel.h"
#import "MMHMineCell.h"
#import "MMHMineHeaderView.h"
#import "MMHMineBigTitleCell.h"
#import "MMHWebViewController.h"


@interface MMHMineViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)UITableView *mineTableView;
@property(nonatomic, strong)NSArray *mineModelArray;

@end

@implementation MMHMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的";
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initView{
    self.mineTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT - 64) withDelegate:self];
    [self.view addSubview:self.mineTableView];
}

/**
 *  @return
 *
 */
-(NSArray *)mineModelArray{
    if (_mineModelArray == nil) {
        NSArray *mineArray = [GetPlistArray arrayWithString:@"MineInformationData.plist"];
        NSMutableArray *dicArray = [NSMutableArray array];
        for (NSDictionary *dict in mineArray) {
            MMHMineModel *model = [MMHMineModel mineModel:dict];
            [dicArray addObject:model];
        }
        _mineModelArray = dicArray;
    }
    
    return  _mineModelArray;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else{
        return self.mineModelArray.count;
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 75;
    }else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 8;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 60;
    }else{
        return 40;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        MMHMineHeaderView *headView = [MMHMineHeaderView headViewWithTableView:tableView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(headerTap:)];
        [headView addGestureRecognizer:tap];
        return headView;
    }else{
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 5)];
        return headerView;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
        MMHMineModel *mineModel = self.mineModelArray [indexPath.row];
        MMHMineCell *cell = [MMHMineCell cellWithTableView:tableView mineModel:mineModel];
        return cell;
    }else{
        MMHMineBigTitleCell *cell = [MMHMineBigTitleCell cellWithTableView:tableView];
        return cell;
    }
}

-(void)headerTap:(UITapGestureRecognizer *)sender{
    MMHWebViewController *webVC = [[MMHWebViewController alloc]init];
    webVC.urlStr = @"http://maominghui.github.io";
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
