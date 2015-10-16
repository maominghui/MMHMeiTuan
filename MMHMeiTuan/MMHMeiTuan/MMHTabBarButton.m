//
//  MMHTabBarButton.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/15.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#define MMHTabBarButtonImageRatio 0.6
#import "MMHTabBarButton.h"

@implementation MMHTabBarButton

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self)
    {
        //图片居中
        self.imageView.contentMode = UIViewContentModeCenter;
        //文字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //字体居中
        self.titleLabel.font = [UIFont systemFontOfSize:11];
        //文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:navigationBarColor forState:UIControlStateSelected];
        
        //添加一个提醒数字按钮
        UIButton *badgeButton = [[UIButton alloc]init];
        [self addSubview:badgeButton];
    }
    return  self;
}


-(void)setHighlighted:(BOOL)highlighted{
    
}
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = contentRect.size.width;
    CGFloat imageH = contentRect.size.height * MMHTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat  titleY = contentRect.size.height * MMHTabBarButtonImageRatio;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height -titleY ;
    return  CGRectMake(0, titleY, titleW, titleH);
}

-(void)setItem:(UITabBarItem *)item{
    _item = item;
    [self setTitle:item.title forState:UIControlStateNormal];
    [self setImage:item.image forState:UIControlStateNormal];
    [self setImage:item.selectedImage forState:UIControlStateSelected];
}

@end
