//
//  MMHDiscountCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/22.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHDiscountCell.h"
#import "MMHDiscountModel.h"
@implementation MMHDiscountCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    MMHDiscountCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MMHDiscountCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//reuseIdentifier重用标示符
@end
