//
//  MMHShopDetailViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/20.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHShopDetailViewController.h"
#import "MMHShopDetailImageCell.h"
#import "MMHShopDatailDataModel.h"
#import "MMHShopDetailPriceCell.h"
#import "MMHShopDetailBackAnyTimeCell.h"
#import "MMHLookThisAllLookOtherCell.h"
#import "MMHOtherRecommentCell.h"
#import "MMHShopRecommentModel.h"
#import "MMHWebViewController.h"
#import "UIBarButtonItem+MMHBarButtonItem.h"
@interface MMHShopDetailViewController ()<UITableViewDataSource, UITableViewDelegate , MMHShopDetailBackAnyTimeCellDelegate>{
    
    MMHShopDatailDataModel *shopDetailModel;
    
    
    NSMutableArray *shopRecommendArray;
    
}


@end

@implementation MMHShopDetailViewController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self loadOtherRecmendShop];
    [self initView];
    [self initNav];
    
}

#pragma mark - 初始化导航栏
-(void)initNav{
    
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}
-(void)initData{
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithShopDetailData:self.shopID];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil success:^(id responseBody) {
        NSLog(@"店铺详情请求成功");
        NSMutableArray *dataDic = [responseBody objectForKey:@"data"];
        shopDetailModel = [MMHShopDatailDataModel objectWithKeyValues:dataDic[0]];
        self.tableView.hidden = NO;
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)loadOtherRecmendShop{
    shopRecommendArray = [NSMutableArray array];
    NSString *urlStr =  [[GetUrlString sharedManager]urlWithOtherRecommendShop:self.shopID];
    [NetWork sendGetByReplacingUrl:urlStr withParams:nil success:^(id responseBody) {
        NSDictionary *dataDic = [responseBody objectForKey:@"data"];
        
        NSMutableArray *dealsArray = [dataDic objectForKey:@"deals"];
        [shopRecommendArray removeAllObjects];
        for (int i = 0; i < dealsArray.count; i++) {
            MMHShopRecommentModel *shopRM = [MMHShopRecommentModel objectWithKeyValues:dealsArray[i]];
            [shopRecommendArray addObject:shopRM];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
}

-(void)initView{
    self.title = @"团购详情";
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 3;
    }else{
        return shopRecommendArray.count +1;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }else{
        return 5;
        
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 && indexPath.row ==0) {
        return 190;
    }else if (indexPath.section == 0&& indexPath.row == 1){
        return 65;
    }else if (indexPath.section == 0&& indexPath.row ==2){
        return 45;
    }else if (indexPath.section == 1 && indexPath.row==0){
        return 30;
    }else{
        return 100;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 &&indexPath.row == 0) {
        MMHShopDetailImageCell *cell = [MMHShopDetailImageCell cellWithTableView:tableView ];
        cell.detailModel = shopDetailModel;
        return cell;
    }else if (indexPath.section ==0 && indexPath.row ==1){
        MMHShopDetailPriceCell *cell = [MMHShopDetailPriceCell cellWithTableView:tableView];
        cell.detailModel = shopDetailModel;
        return  cell;
    }else if (indexPath.section == 0 && indexPath.row ==2){
        
        MMHShopDetailBackAnyTimeCell *cell = [MMHShopDetailBackAnyTimeCell cellWithTableView:tableView];
        cell.delegate =self;
        cell.detailModel = shopDetailModel;
        return cell;
    }else if (indexPath.section ==1 && indexPath.row ==0){
        MMHLookThisAllLookOtherCell *cell = [MMHLookThisAllLookOtherCell cellWithTableView:tableView];
        return cell;
    }else if (indexPath.section == 1 && indexPath.row != 0){
        MMHOtherRecommentCell *cell = [MMHOtherRecommentCell cellWithTableView:tableView];
        cell.shopRecommentModel = shopRecommendArray[indexPath.row-1];
        return cell;
    }
    return nil;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        if (indexPath.row>0) {
            MMHShopRecommentModel *shopRM = shopRecommendArray[indexPath.row-1];
            MMHShopDetailViewController *shopVC = [[MMHShopDetailViewController alloc] init];
            shopVC.shopID = [NSString stringWithFormat:@"%@",shopRM.id];
            [self.navigationController pushViewController:shopVC animated:YES];
            
        }
    }
    
}
#pragma mark - 随时退
-(void)shopDetailBackAnyTimeButtonClick:(UIButton *)button{
    NSString *urlStr =  [[GetUrlString sharedManager]urlBackAnyTimeWebData];
    MMHWebViewController *webVC = [[MMHWebViewController alloc]init];
    webVC.urlStr = urlStr;
    [self.navigationController pushViewController:webVC animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
