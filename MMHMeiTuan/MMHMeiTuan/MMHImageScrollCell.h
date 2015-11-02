//
//  MMHImageScrollCell.h
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/28.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MMHImageScrollView;


@interface MMHImageScrollCell : UITableViewCell

@property (nonatomic, strong) MMHImageScrollView *imageScrollView;
@property (nonatomic, strong) NSArray *imageArr;

-(void)setImageArray:(NSArray *)imageArray;

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
                       frame:(CGRect)frame;

@end
