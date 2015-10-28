//
//  MMHMineHeaderView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/27.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMineHeaderView.h"



@implementation MMHMineHeaderView

+(instancetype)headViewWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"MMHMineHeaderView";
    
    MMHMineHeaderView *headView = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (headView == nil) {
        // 从xib中加载cell
        headView = [[[NSBundle mainBundle] loadNibNamed:@"MMHMineHeaderView" owner:nil options:nil] lastObject];
        
        headView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_login"]];
    }
    
    return headView;
}

@end
