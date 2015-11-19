//
//  MMHShopDetailBackAnyTimeCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHShopDetailBackAnyTimeCell.h"
#import "MMHShopDatailDataModel.h"
@implementation MMHShopDetailBackAnyTimeCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

/**
 
 顺便提一下
 
 NSBundle *myBundle = [NSBundle mainBundle];
 
 [myBundle loadNibNamed:@"MMHShopDetailBackAnyTimeCell" owner:self options:nil] lastObject];
 
 意思是找MMHShopDetailBackAnyTimeCell这个NIB，因为loadNibNamed返回的是NSArray,所以要调用lastObject方法返回Array中最后一个对象，如果没有符合条件的返回nil
 */

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"MMHShopDetailBackAnyTimeCell";
    MMHShopDetailBackAnyTimeCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JFShopDetailBackAnyTimeCell" owner:nil options:nil]lastObject];
    }
    return cell;
    
}

-(void)setDetailModel:(MMHShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    
    self.backAnyTimeNumberLabel.text = [NSString stringWithFormat:@"已售%@",[detailModel.solds stringValue]];
}

- (IBAction)backAnyTimeButtonClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(shopDetailBackAnyTimeButtonClick:)]) {
        [self.delegate shopDetailBackAnyTimeButtonClick:sender];
    }
    
}
@end
