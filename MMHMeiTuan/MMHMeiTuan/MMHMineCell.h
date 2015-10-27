//
//  MMHMineCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHMineModel;
@interface MMHMineCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView
                       mineModel:(MMHMineModel *)mineModel;
@end
