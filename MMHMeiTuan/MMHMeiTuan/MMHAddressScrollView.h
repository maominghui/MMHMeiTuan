//
//  MMHAddressScrollView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MMHAddressScrollViewButtonDelegate <NSObject>
@optional
-(void)areaButtonClick:(UIButton *)button;
@end

@protocol MMHChangeCityButtonDelegate <NSObject>
@optional
-(void)changeCityButtonClick:(UIButton *)button;
@end

@interface MMHAddressScrollView : UIView

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

+(instancetype)scrollView;

@property(weak, nonatomic)id<MMHAddressScrollViewButtonDelegate>delegate;

@property(nonatomic, weak)id<MMHChangeCityButtonDelegate>changeCityDelegate;

- (IBAction)changeCityButtonClick:(id)sender;

@end

