//
//  UITableView+MMHTableView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/16.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView(MMHTableView)
/*
 快速创建tableView
 
 @param frame tableView的frame
 @param delegate 代理
 
 @return 返回一个自定义的tableView
 
 
 */

+(UITableView *)initWithTableView:(CGRect)frame withDelegate:(id)delegate;

@end
