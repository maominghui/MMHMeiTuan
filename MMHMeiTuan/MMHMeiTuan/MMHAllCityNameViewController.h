//
//  MMHAllCityNameViewController.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHAllCityNameViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSMutableDictionary *cities;
@property (nonatomic, strong) NSMutableArray *keys;//城市首字母
@property (nonatomic, strong) NSMutableArray *arrayCitys;//城市数据
@property (nonatomic, strong) NSMutableArray *arrayHotCity;

@property (nonatomic, strong) UITableView *tableView;


@end
