//
//  UserGuideView.m
//  TestDemo
//
//  Created by 沿途の风景 on 13-12-2.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import "UserGuideView.h"
#import "ViewController.h"

@implementation UserGuideView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self initGuide];
    }
    return self;
}

- (void)initGuide
{
    CGRect rect = self.frame;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    _scrollView = [[UIScrollView alloc] initWithFrame:rect];
    [_scrollView setContentSize:CGSizeMake(width*3, 0)];
    [_scrollView setDelegate:self];
    [_scrollView setShowsHorizontalScrollIndicator:NO];
    [_scrollView setShowsVerticalScrollIndicator:NO];//隐藏水平滚动条
    [_scrollView setPagingEnabled:YES];  //视图整页显示
    [_scrollView setBounces:NO]; //避免弹跳效果,避免把根视图露出来
    
    for (int i=0; i<3; i++) {
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(i*width, 0, width, height)];
        [imageview setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i+1]]];
        [_scrollView addSubview:imageview];
    }
    
    [self addSubview:_scrollView];
    //[scrollView release];
    
    //页面控制小工具
    //它会在底部绘制小圆点标志当前显示页面
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, height-30,width, 20)];
    //设置页面的数量
    [_pageControl setNumberOfPages:3];
    [self addSubview:_pageControl];
    
    _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];//在imageview3上加载一个透明的button
    [_skipBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [_skipBtn setFrame:CGRectMake(240, height-40, 80, 40)];
    [_skipBtn setBackgroundColor:[UIColor clearColor]];
    [_skipBtn setHidden:YES];
    [self addSubview:_skipBtn];
    //NSLog(@"%@",NSStringFromCGRect(button.frame));
    
    
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    //int page = fabs(scrollView.contentOffset.x/pageWidth);
    _pageControl.currentPage = page;
    //NSLog(@"page = %d",page+1);
    
    if (page==2) {
        scrollView.bounces = YES;
        _skipBtn.hidden = NO;
        
    }
    else {
        scrollView.bounces = NO;
        _skipBtn.hidden = YES;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
