//
//  MMHMineBigTitleCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMineBigTitleCell.h"

@implementation MMHMineBigTitleCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
//    static NSString *mmhMineBigTitleCell = @"mmhmineCell";
//    MMHMineBigTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:mmhMineBigTitleCell];
//    if (cell == nil) {
//        cell = [[MMHMineBigTitleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mmhMineBigTitleCell];
//    }
//    
//    cell.textLabel.text = @"Amo";
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    
//    return cell;
    
    static NSString *ID = @"MMHMineBigTitleCell";
    
    MMHMineBigTitleCell *title = [tableView dequeueReusableCellWithIdentifier:ID];
    if (title == nil) {
        //从xib中加载cell
        title = [[[NSBundle mainBundle]loadNibNamed:@"MMHMineBigTitleCell" owner:nil options:nil]lastObject];
        
        title.backgroundColor = [UIColor whiteColor];
    }
    
    return title;
    
}

@end
