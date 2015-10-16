//
//  MMHSelectAddressView.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMHAddressScrollView;
@protocol MMHSelectAddressViewTapDelegate <NSObject>
@optional
-(void)removeMaskView;

@end


@interface MMHSelectAddressView : UIView
@property(nonatomic, strong)MMHAddressScrollView *addressScrollView;
@property(nonatomic, weak)id<MMHSelectAddressViewTapDelegate>delegate;

@end
