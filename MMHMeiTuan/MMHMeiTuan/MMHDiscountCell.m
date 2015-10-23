//
//  MMHDiscountCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/22.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHDiscountCell.h"
#import "MMHDiscountModel.h"
@implementation MMHDiscountCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *cellIndentifier = @"nomorecell";
    MMHDiscountCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (cell == nil) {
        cell = [[MMHDiscountCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

//reuseIdentifier重用标示符
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        for (int i = 0; i < 4; i++) {
        //背景 进行重构。不要一行一行创建
            UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(i*SCREENWIDTH/2, 0, SCREENWIDTH/2, 80)];
            if (i<2) {
                backView.frame = CGRectMake(i*SCREENWIDTH/2, 0, SCREENWIDTH/2, 80);
            }else{
                backView.frame = CGRectMake((i-2)*SCREENWIDTH/2, 80, SCREENWIDTH/2, 80);
            }
            backView.tag = 100+i;
            backView.layer.borderWidth = 0.25;
            backView.layer.borderColor = [separaterColor CGColor];
            
            //点击事件
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBackView:)];
            
            //标题
            
        }
    }
    return self;
}

-(void)OnTapBackView:(UITapGestureRecognizer *)sender{
    NSInteger index = sender.view.tag - 100;
    NSString *str = @"";
    
    MMHDiscountModel *discountModel = _discountArray[index];
    str = discountModel.tplurl;
    NSRange rang = [str rangeOfString:@"http"];
    str = [str substringFromIndex:rang.location];
    
    if ([self.delegate respondsToSelector:@selector(didSelectAtIndexDiscountCell:)]) {
        [self.delegate didSelectAtIndexDiscountCell:str];
    }
}
@end
