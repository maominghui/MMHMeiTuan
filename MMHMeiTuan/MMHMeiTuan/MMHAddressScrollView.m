//
//  MMHAddressScrollView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/14.
//  Copyright (c) 2015年 com.nyist. All rights reserved.
//

#import "MMHAddressScrollView.h"


@implementation MMHAddressScrollView

+(instancetype)scrollView
{
    return [[[NSBundle mainBundle]loadNibNamed:@"MMHAddressScrollView" owner:nil options:nil] lastObject];
}

-(void)layoutSubviews{
    NSArray *array =  [GetPlistArray arrayWithString:@"citydata.plist"];
    NSArray *cityArray = [array objectAtIndex:8][@"citylist"];
    NSArray *areaArray = [cityArray objectAtIndex:0][@"arealist"];
}

- (IBAction)changeCityButtonClick:(id)sender {
}
@end
