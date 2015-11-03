//
//  MMHHotQueueCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/3.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHHotQueueModel;

@interface MMHHotQueueCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *hotQueueImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;

@property (strong, nonatomic) MMHHotQueueModel *hotQueueModel;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
