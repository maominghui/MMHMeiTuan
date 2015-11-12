//
//  MMHCityTitleHeaderView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHCityTitleHeaderView.h"

@implementation MMHCityTitleHeaderView

+(instancetype)headViewWithTableView:(UITableView *)tableView{
    static NSString *ID = @"MMHCityTitleHeaderView";
    MMHCityTitleHeaderView *headView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (headView == nil) {
        //从xib中加载cell
        headView = [[[NSBundle mainBundle]loadNibNamed:@"MMHCityTitleHeaderView" owner:nil options:nil]lastObject];
    }
    
    headView.backgroundColor = separaterColor;
    
    return headView;
}

-(void)setKeyStr:(NSString *)keyStr{
    _keyStr = keyStr;
    self.titleLabel.text = keyStr;
}

@end
