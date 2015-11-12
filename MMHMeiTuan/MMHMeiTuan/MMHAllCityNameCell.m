//
//  MMHAllCityNameCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHAllCityNameCell.h"

@implementation MMHAllCityNameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView
           cellForRowAtIndexPath:(NSIndexPath *)indexPath
                            keys:(NSMutableArray *)keys
                          cities:(NSMutableDictionary *)cities{
    static NSString *cellIndentifier = @"MMHAllCityNameCell";
    MMHAllCityNameCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MMHAllCityNameCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier cellForRowAtIndexPath:indexPath keys:keys cities:cities];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
       cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        keys:(NSMutableArray *)keys
                      cities:(NSMutableDictionary *)cities{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSString *key = [keys objectAtIndex:indexPath.section];
        self.textLabel.text = [[cities objectForKey:key]objectAtIndex:indexPath.row];
    }
    return self;
}

@end
