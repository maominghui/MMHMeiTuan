//
//  MMHHomeMenuCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHHomeMenuCell.h"
#import "MMHMenuBtnView.h"

@implementation MMHHomeMenuCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;
{
    static NSString *menuID = @"menu";
    MMHHomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    if (cell == self) {
//        cell = [[MMHHomeMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID
//                                           menuArray:menuArray];
    }
    return cell;
}




@end
