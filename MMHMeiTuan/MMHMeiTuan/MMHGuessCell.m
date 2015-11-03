//
//  MMHGuessCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/3.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHGuessCell.h"

@implementation MMHGuessCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"MMHGuessCell";
    MMHGuessCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if ( cell == nil) {
        cell = [[MMHGuessCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        cell.textLabel.text = @"猜你喜欢";
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


@end
