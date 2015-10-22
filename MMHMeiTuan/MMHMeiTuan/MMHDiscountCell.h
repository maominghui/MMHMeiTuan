//
//  MMHDiscountCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/22.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMHDiscountCellDelegate <NSObject>

-(void)didSelectAtIndexDiscountCell:(NSString *)urlStr;


@end

@interface MMHDiscountCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;
@property(nonatomic, strong)NSMutableArray *discountArray;
@property(nonatomic, weak)id<MMHDiscountCellDelegate>delegate;
@end
