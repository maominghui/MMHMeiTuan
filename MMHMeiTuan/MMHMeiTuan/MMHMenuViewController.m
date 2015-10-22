//
//  MMHMenuViewController.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMenuViewController.h"

@interface MMHMenuViewController ()

@end

@implementation MMHMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initNav{
    self.title = self.titleStr;
    UIBarButtonItem *leftItem = [UIBarButtonItem initWithNormalImage:@"back" target:self action:@selector(OnBackBtn) width:23 height:23];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)OnBackBtn{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
