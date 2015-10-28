//
//  MMHImageScrollView.m
//  MMHMeiTuan
//
//  Created by 茆明辉 on 15/10/28.
//  Copyright © 2015年 com.nyist. All rights reserved.
//

#import "MMHImageScrollView.h"

@interface MMHImageScrollView() <UIScrollViewDelegate>
{
    NSTimer *_timer;
    int _pageNumber;
}

@end

@implementation MMHImageScrollView

-(MMHImageScrollView *) initWithFrame:(CGRect)frame imageArray:(NSArray *)imageArray{
    self = [super initWithFrame:frame];
    
    //code..
    if (self) {
        self.scrollView = [[UIScrollView alloc]initWithFrame:frame];
        self.scrollView.contentSize = CGSizeMake(4 * SCREENWIDTH, frame.size.height);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.delegate = self;
        self.scrollView.showsHorizontalScrollIndicator = NO;   //控制是否显示水平方向的滚动条
        //添加图片
        for(int i = 0 ; i < 10; i++){
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.frame = CGRectMake(i*SCREENWIDTH, 0, SCREENWIDTH, frame.size.height);
            imageView.tag = i+10;
            // UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(OnTapImage:)];
            //[imageView addGestureRecognizer:tap];
            imageView.userInteractionEnabled = YES;
            [self.scrollView addSubview:imageView];
        }
        [self addSubview:self.scrollView];
        
        //
        self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(SCREENWIDTH/2-40, frame.size.height-40, 80, 30)];
        self.pageControl.currentPage = 0;
        self.pageControl.numberOfPages = 6;
        [self addSubview:self.pageControl];
        
        [self addTimer];
    }
    
    return  self;
}

-(void)setImageArray:(NSArray *)imageArray{
    _pageNumber = (int)imageArray.count;
    self.scrollView.contentSize = CGSizeMake(imageArray.count * SCREENWIDTH, self.frame.size.width);
    self.pageControl.numberOfPages = imageArray.count;
    //添加图片
    for (int i = 0; i < imageArray.count; i++) {
        UIImageView *imageView = (UIImageView *)[self.scrollView viewWithTag:i+10];
        
        imageView.backgroundColor = [UIColor redColor];
        
        NSString *imageName =[NSString stringWithFormat:@"%@",imageArray[i]];
        
        NSLog(@"%@",imageName);
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageName] placeholderImage:[UIImage imageNamed:@"bg_customReview_image_default"]];  
    }
}

-(void)addTimer{
    _timer = [NSTimer scheduledTimerWithTimeInterval:3
                                              target:self
                                            selector:@selector(nextPage) userInfo:nil
                                             repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:_timer
                                forMode:NSRunLoopCommonModes];
}

-(void)removeTimer{
    [_timer invalidate];
    _timer = nil;
}

-(void)nextPage{
    int page = (int)self.pageControl.currentPage;//从第一页开始
    if (page == _pageNumber - 1) {
        page = 0;
    }else{
        page++;
    }
    //滚动scrollView
    CGFloat x = page * self.scrollView.frame.size.width;
    self.scrollView.contentOffset = CGPointMake(x, 0);
}

#pragma mark - UIScrollViewDelegate
//滑动时
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW / 2) / scrollViewW;
    self.pageControl.currentPage = page;
}

//开始拖动时
-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self removeTimer];
}


//结束拖动
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self addTimer];
}

/**
 *  移除定时器
 */

-(void)dealloc{
    [self removeTimer];
}



@end
