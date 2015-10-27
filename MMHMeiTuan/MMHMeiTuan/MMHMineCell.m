//
//  MMHMineCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMineCell.h"
#import "MMHMineModel.h"

@interface MMHMineCell()

@end

@implementation MMHMineCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView mineModel:(MMHMineModel *)mineModel{

    static NSString *mmhmineCell = @"mmhmineCell";
    MMHMineCell *cell = [tableView dequeueReusableCellWithIdentifier:mmhmineCell];
    if (cell == nil) {
        cell = [[MMHMineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mmhmineCell];
    }
    NSString *imageStr = [NSString stringWithFormat:@"%@",mineModel.imageName];
    cell.imageView.image = [UIImage imageNamed:imageStr];
    cell.textLabel.text = mineModel.title;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

@end
