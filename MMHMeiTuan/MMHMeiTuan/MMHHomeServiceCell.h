//
//  MMHHomeServiceCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/26.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMHHomeServiceCellDelegate <NSObject>
@optional

-(void)homeServiceCellTapClick:(long)index;

@end

@interface MMHHomeServiceCell : UITableViewCell
@property(nonatomic, weak)id<MMHHomeServiceCellDelegate>delegate;
@property(nonatomic, strong) NSMutableArray *homeServiceArray;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
