//
//  MMHMenuBtnView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHMenuBtnView.h"

@implementation MMHMenuBtnView

-(id)initWithFrame:(CGRect)frame
             title:(NSString *)title
          imageStr:(NSString *)imageStr
{
    if (self) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width/2-22,15 , 44, 44)];
        imageView.image = [UIImage imageNamed:imageStr];
        [self addSubview:imageView];
        
        UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 15+44,frame.size.width,20)];
        titleLable.text = title;
        titleLable.textAlignment = NSTextAlignmentCenter;
        titleLable.font = [UIFont systemFontOfSize:13];
        [self addSubview:titleLable];
    }
    return self;
}

@end
