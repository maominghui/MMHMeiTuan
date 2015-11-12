//
//  MMHAllCityNameCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHAllCityNameCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
           cellForRowAtIndexPath:(NSIndexPath *)indexPath
                            keys:(NSMutableArray *)keys
                          cities:(NSMutableDictionary *)cities;

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
       cellForRowAtIndexPath:(NSIndexPath *)indexPath
                        keys:(NSMutableArray *)keys
                      cities:(NSMutableDictionary *)cities;

@end
