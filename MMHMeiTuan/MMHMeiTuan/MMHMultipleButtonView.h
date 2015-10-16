//
//  MMHMultipleButtonView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMHMultipleButtonViewDelegate <NSObject>
@optional
-(void)multipleButtonViewClickAtIndex:(long)index;

@end

@interface MMHMultipleButtonView : UIView{
    UIButton *btn_type;
}

/*
 *快速创建多个按钮
 */
-(instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray *)titleArray;
    
@property(nonatomic, weak)id<MMHMultipleButtonViewDelegate>delegate;

@end
