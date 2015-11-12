//
//  MMHLookThisAllLookOtherCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHLookThisAllLookOtherCell.h"

@implementation MMHLookThisAllLookOtherCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"MMHLookThisAllLookOtherCell";
    MMHLookThisAllLookOtherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MMHLookThisAllLookOtherCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text = @"看了本团购的用户还看了";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

@end
