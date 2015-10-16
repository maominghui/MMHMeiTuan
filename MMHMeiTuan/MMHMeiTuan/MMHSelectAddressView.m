//
//  MMHSelectAddressView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import "MMHSelectAddressView.h"
#import "MMHAddressScrollView.h"

@implementation MMHSelectAddressView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(void)initView{
    UIView *maskView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
    maskView.tag = 99;
    maskView.backgroundColor = [UIColor blackColor];
    maskView.alpha = 0.6;
    [self addSubview:maskView];
    
    self.addressScrollView = [MMHAddressScrollView scrollView];
    self.addressScrollView.frame = CGRectMake(0, 0, self.frame.size.width, SCREENHEIGHT/2);
    [self addSubview:self.addressScrollView];
    
    //手势处理
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(maskViewClick)];
    tap.numberOfTapsRequired = 1;
    [maskView addGestureRecognizer:tap];
}

-(void)maskViewClick{
    if ([self.delegate respondsToSelector:@selector(removeMaskView)]) {
        [self.delegate removeMaskView];
    }
}

@end
