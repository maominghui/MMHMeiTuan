//
//  MMHShopDetailPriceCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/20.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHShopDatailDataModel;
@interface MMHShopDetailPriceCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nowPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *OldPriceLabel;

- (IBAction)rushBuyButtonClick:(id)sender;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(strong, nonatomic)MMHShopDatailDataModel * detailModel;

@end
