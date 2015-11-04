//
//  MMHRecommentCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/4.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMHRecommentModel;


@interface MMHRecommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *shopIntroduceLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property(nonatomic, weak)MMHRecommentModel *recommentModel; //给标签添加数据源

+ (instancetype)cellWithTableView:(UITableView *)tableView;//加载xib

@end
