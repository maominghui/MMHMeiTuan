//
//  MMHHomeServiceCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/26.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHHomeServiceCell.h"
#import "MMHHomeServiceModel.h"
#import "NSString+MMHColorString.h"

@implementation MMHHomeServiceCell

-(void)awakeFromNib{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    MMHHomeServiceCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MMHHomeServiceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

@end
