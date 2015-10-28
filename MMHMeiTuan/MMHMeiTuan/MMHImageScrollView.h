//
//  MMHImageScrollView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/28.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHImageScrollView : UIView

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSArray *imageArray;

-(void)setImageArray:(NSArray *)imageArray;

/**
 *
 *  创建一个ScrollView
 *  @param frame    供外界提供一个frame
 *  @param imageArrya   供外界提供一个图片数组
 *
 *  @return 返回一个自定义的ScrollView
 */
-(MMHImageScrollView *)initWithFrame:(CGRect)frame
                          imageArray:(NSArray *)imageArray;

@end
