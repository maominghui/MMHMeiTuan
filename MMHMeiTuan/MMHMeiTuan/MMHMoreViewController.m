//
//  MMHMoreViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMoreViewController.h"
#import "MMHMoreCell.h"
@interface MMHMoreViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, strong)UITableView *moreTableView;
@property(nonatomic, strong)NSArray *moreModelArray;
@end

@implementation MMHMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"更多";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //初始化
    [self initView];
    [self loadMoreMenuData];
    // Do any additional setup after loading the view.
}

#pragma mark - 加载数据
-(void)loadMoreMenuData{
        self.moreModelArray = [GetPlistArray arrayWithString:@"MoreData.plist"];
}

#pragma mark - 初始化TableView
-(void)initView{
    self.moreTableView = [UITableView initWithTableView:CGRectMake(0, 0, SCREENWIDTH, SCREENWIDTH-64) withDelegate:self];
    [self.view addSubview:self.moreTableView];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 5;
    }else if (section == 2){
        return 5;
    }else{
        return 1;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MMHMoreCell *cell = [MMHMoreCell cellWithTableView:tableView indexPath:indexPath moreArray:self.moreModelArray];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 2) {
        if (indexPath.row == 1) {
            //支付帮助
//            NSString *urlStr =  [[GetUrlString sharedManager]urlWithPayHelp];
//            JFWebViewController *webVC = [[JFWebViewController alloc] init];
//            webVC.urlStr = urlStr;
//            [self.navigationController pushViewController:webVC animated:YES];
        }else if (indexPath.row == 4){
//            //我要应聘
//            NSString *urlStr =  [[GetUrlString sharedManager]urlWithHelpWorking];
//            JFWebViewController *webVC = [[JFWebViewController alloc] init];
//            webVC.urlStr = urlStr;
//            [self.navigationController pushViewController:webVC animated:YES];
        }
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
