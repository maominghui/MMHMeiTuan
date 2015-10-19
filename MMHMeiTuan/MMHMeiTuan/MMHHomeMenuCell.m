//
//  MMHHomeMenuCell.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/19.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHHomeMenuCell.h"
#import "MMHMenuBtnView.h"

@interface MMHHomeMenuCell ()<UIScrollViewDelegate>
@property (nonatomic, strong)UIView *firstBgView;
@property (nonatomic, strong)UIView *secondBgView;
@property (nonatomic, strong)UIPageControl *pageControl;

@end

@implementation MMHHomeMenuCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView menuArray:(NSArray *)menuArray;
{
    static NSString *menuID = @"menu";
    MMHHomeMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:menuID];
    if (cell == self) {
//        cell = [[MMHHomeMenuCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:menuID
//                                           menuArray:menuArray];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style
             reuseIdentifier:(NSString *)reuseIdentifier
                   menuArray:(NSArray *)menuArray{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _firstBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 160)];
        _secondBgView = [[UIView alloc]initWithFrame:CGRectMake(SCREENWIDTH, 0, SCREENWIDTH, 160)];
        UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, 180)];
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;//是否分页
        scrollView.showsHorizontalScrollIndicator = NO;//指示器
        [scrollView addSubview:_firstBgView];
        [scrollView addSubview:_secondBgView];
        [self addSubview:scrollView];
        
        //创建8个
        for (int i = 0; i < 16; i++) {
            if (i < 4) {
                CGRect frame = CGRectMake(i*SCREENWIDTH/4, 0, SCREENWIDTH/4, 80);
                NSString *title = [menuArray [i]objectForKey:@"title"];
                NSString *imageStr = [menuArray[i]objectForKey:@"image"];
                MMHMenuBtnView *btnView = [[MMHMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_firstBgView addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }else if(i < 8){
                CGRect frame = CGRectMake((i-4)*SCREENWIDTH/4, 80, SCREENWIDTH/4, 80);
                NSString *title = [menuArray[i]objectForKey:@"title"];
                NSString *imageStr = [menuArray[i]objectForKey:@"image"];
                
                MMHMenuBtnView *btnView = [[MMHMenuBtnView alloc]initWithFrame:frame title:title imageStr:imageStr];
                
            }else{
                CGRect frame = CGRectMake((i-12)*SCREENWIDTH/4, 80, SCREENWIDTH/4, 80);
                NSString *title = [menuArray[i] objectForKey:@"title"];
                NSString *imageStr = [menuArray[i] objectForKey:@"image"];
                MMHMenuBtnView *btnView = [[MMHMenuBtnView alloc] initWithFrame:frame title:title imageStr:imageStr];
                btnView.tag = 10+i;
                [_secondBgView addSubview:btnView];
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapBtnView:)];
                [btnView addGestureRecognizer:tap];
            }
        }
    }
    return self;
}

#pragma mark - scrollView delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    //算出水平移的距离
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW / 2) / scrollViewW;
    _pageControl.currentPage = page;
}

//在这里做一个代理通知控制器哪个按钮被点了，作出应以的处理
-(void)OnTapBtnView:(UITapGestureRecognizer *)sender{
    JFLog(@"%ld", (long)sender.view.tag);
    if ([self.delegate respondsToSelector:@selector(homeMenuCellClick:)]) {
        [self.delegate homeMenuCellClick:(NSInteger)sender.view.tag];
    }
}
@end
