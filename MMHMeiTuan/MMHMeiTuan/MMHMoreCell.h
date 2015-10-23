//
//  MMHMoreCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/23.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHMoreCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
                       indexPath:(NSIndexPath *)indexPath
                       moreArray:(NSArray *)moreArray;


@end
