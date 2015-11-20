//
//  MMHShopDetailImageCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHShopDatailDataModel;
@interface MMHShopDetailImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *introduceLabel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong)MMHShopDatailDataModel *detailModel;


@end
