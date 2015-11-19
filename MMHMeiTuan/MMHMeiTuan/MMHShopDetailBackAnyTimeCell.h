//
//  MMHShopDetailBackAnyTimeCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHShopDatailDataModel;
@protocol MMHShopDetailBackAnyTimeCellDelegate<NSObject>
@optional
-(void)shopDetailBackAnyTimeButtonClick:(UIButton *)button;

@end
@interface MMHShopDetailBackAnyTimeCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *backAnyTimeNumberLabel;
- (IBAction)backAnyTimeButtonClick:(id)sender;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(strong, nonatomic)MMHShopDatailDataModel *detailModel;
@property(weak,   nonatomic)id<MMHShopDetailBackAnyTimeCellDelegate>delegate;

@end
