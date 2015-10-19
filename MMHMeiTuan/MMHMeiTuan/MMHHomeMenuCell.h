//
//  MMHHomeMenuCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMHHomeMenuCellDelegate <NSObject>
@optional
-(void)homeMenuCellClick:(long)sender;

@end

@interface MMHHomeMenuCell : UITableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView
                       menuArray:(NSArray *)menuArray;
@property(nonatomic,weak)id<MMHHomeMenuCellDelegate>delegate;

@end
