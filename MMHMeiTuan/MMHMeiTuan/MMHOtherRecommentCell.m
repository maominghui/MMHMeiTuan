//
//  MMHOtherRecommentCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/11.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHOtherRecommentCell.h"
#import "MMHShopRecommentModel.h"
@implementation MMHOtherRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"JFOtherRecommentCell";
    MMHOtherRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"JFOtherRecommentCell" owner:nil options:nil] lastObject];
    }
    return cell;
}
-(void)setShopRecommentModel:(MMHShopRecommentModel *)shopRecommentModel{
    _shopRecommentModel = shopRecommentModel;
    
    NSString *imgUrl = [shopRecommentModel.imgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imgUrl] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];
    
    self.productNameLabel.text = shopRecommentModel.brandname;
    self.introduceLabel.text = [NSString stringWithFormat:@"[%@]%@",shopRecommentModel.range,shopRecommentModel.title];
    self.priceLabel.text = [NSString stringWithFormat:@"%.2f元",[shopRecommentModel.price doubleValue]];
    self.priceLabel.textColor = navigationBarColor;
    
}

@end
