//
//  MMHRushBuyCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/5.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol MMHRushBuyCellDelegate <NSObject>
@optional
-(void)didSelectAtIndexRushBuyCell:(long)index;
@end


@interface MMHRushBuyCell : UITableViewCell
/**
 *  快速创建一个cell
 *  返回值用instancetype    代替苹果的规范
 */
+(instancetype)cellWithTableView:(UITableView *)tableView;
/**
 *  提供一个构造实例方法方法用来给在控制器里面创建cell, 传递模型
 *
 */
-(void)setRushData:(NSMutableArray *)rushData;

@property(nonatomic, weak)id<MMHRushBuyCellDelegate>delegate;

@end
