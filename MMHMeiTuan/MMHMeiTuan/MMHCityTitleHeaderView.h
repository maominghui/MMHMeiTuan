//
//  MMHCityTitleHeaderView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHCityTitleHeaderView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property(nonatomic, copy)NSString *keyStr;
+ (instancetype)headViewWithTableView:(UITableView *)tableView ;
@end
