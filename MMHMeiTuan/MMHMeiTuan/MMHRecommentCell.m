//
//  MMHRecommentCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/4.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHRecommentCell.h"
#import "MMHRecommentModel.h"


@implementation MMHRecommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"MMHRecommentCell";
    MMHRecommentCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        //从xib中加载cell
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MMHRecommentCell" owner:nil options:nil]lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return  cell;
}

-(void)setRecommentModel:(MMHRecommentModel *)recommentModel
{
    _recommentModel = recommentModel;
    NSString *imageUrl = [recommentModel.squareimgurl stringByReplacingOccurrencesOfString:@"w.h" withString:@"160.0"];
    [self.shopImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]placeholderImage:nil];
    self.shopNameLabel.text = recommentModel.mname;
    self.shopIntroduceLabel.text = [NSString stringWithFormat:@"[%@]%@",recommentModel.range,recommentModel.title];
    
    self.priceLabel.text = [NSString stringWithFormat:@"%ld元",(long)recommentModel.price.integerValue ];
    
    self.priceLabel.textColor = navigationBarColor;
}

@end
