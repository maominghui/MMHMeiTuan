//
//  MMHHotQueueCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/11/3.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHHotQueueCell.h"
#import "MMHHotQueueModel.h"


@implementation MMHHotQueueCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"hotqueue";
    MMHHotQueueCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"MMHHotQueueCell" owner:nil options:nil]lastObject];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)setHotQueueModel:(MMHHotQueueModel *)hotQueueModel{
    
    _hotQueueModel = hotQueueModel;
    NSURL *urlStr = [NSURL URLWithString:hotQueueModel.imageUrl];
    [self.hotQueueImageView sd_setImageWithURL:urlStr placeholderImage:nil];
    self.mainLabel.text = hotQueueModel.title;
    self.subtitleLabel.text = hotQueueModel.comment;
    
}

@end
