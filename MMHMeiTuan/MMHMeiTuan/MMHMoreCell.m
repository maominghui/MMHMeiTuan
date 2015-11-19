//
//  MMHMoreCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/23.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMoreCell.h"

@interface MMHMoreCell ()
{
    UILabel *lbl;
}
@end


@implementation MMHMoreCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath moreArray:(NSArray *)moreArray{
    static NSString *mmhMoreCell = @"mmhMoreCell";
    MMHMoreCell *cell = [tableView dequeueReusableCellWithIdentifier:mmhMoreCell];
    if (cell == nil) {
        cell = [[MMHMoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mmhMoreCell];
    }
    
    cell.textLabel.text = [moreArray[indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)setSubText:(NSString*)str
{
    lbl.text = str;
}

@end
