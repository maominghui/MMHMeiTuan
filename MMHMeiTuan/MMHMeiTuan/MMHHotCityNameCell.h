//
//  MMHHotCityNameCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHHotCityNameCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
                    hotCityArray:(NSArray *)hotCityArray;

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
                hotCityArray:(NSArray *)hotCityArray;
@end