//
//  MMHImageScrollCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/28.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHImageScrollCell.h"
#import "MMHImageScrollView.h"

@implementation MMHImageScrollCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier frame:(CGRect)frame{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.imageScrollView = [[MMHImageScrollView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) imageArray:self.imageArr];
        [self.contentView addSubview:self.imageScrollView];
    }
    
    
    return self;
}

-(void)setImageArray:(NSArray *)imageArray{
    [self.imageScrollView setImageArray:imageArray];
}

@end
