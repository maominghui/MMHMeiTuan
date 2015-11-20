//
//  MMHShopDetailPriceCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/20.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHShopDetailPriceCell.h"
#import "MMHShopDatailDataModel.h"
@implementation MMHShopDetailPriceCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"MMHShopDetailPriceCell.h";
    MMHShopDetailPriceCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        //从xib中加载cell
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MMHShopDetailPriceCell.h" owner:nil options:nil]lastObject];
        
    }
    return cell;
}

-(void)setDetailModel:(MMHShopDatailDataModel *)detailModel{
    _detailModel = detailModel;
    self.nowPriceLabel.text = [NSString stringWithFormat:@"%@元",[detailModel.price stringValue]];
    self.nowPriceLabel.textColor = navigationBarColor;
    
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};//删除线
    
    NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%.2f元",[detailModel.value doubleValue]] attributes:attribtDic];//颜色
    self.OldPriceLabel.attributedText = attribtStr;
}

- (IBAction)rushBuyButtonClick:(id)sender {
}
@end
