//
//  UserGuideViewController.m
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-29.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import "UserGuideViewController.h"
#import "ViewController.h"

#define SEL_FRAME       self.view.frame
#define WIDTH           self.view.frame.size.width
#define HEIGHT          self.view.frame.size.height

@interface UserGuideViewController ()

@end

@implementation UserGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor clearColor];
    
    [self initGuide];//加载新用户指导页
    
    
}

- (void)initGuide
{
    CGRect rect = SEL_FRAME;
    CGFloat width = WIDTH;
    CGFloat height = HEIGHT;
    
     _scrollView = [[UIScrollView alloc] initWithFrame:rect];
    [_scrollView setContentSize:CGSizeMake(WIDTH*3, 0)];
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
    
    [self.view addSubview:_scrollView];
    //[scrollView release];

    //页面控制小工具
    //它会在底部绘制小圆点标志当前显示页面
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, height-30,width, 20)];
    //设置页面的数量
    [_pageControl setNumberOfPages:3];
    [self.view addSubview:_pageControl];
    
    _skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];//在imageview3上加载一个透明的button
    [_skipBtn setTitle:@"立即体验" forState:UIControlStateNormal];
    [_skipBtn setFrame:CGRectMake(240, height-40, 80, 40)];
    [_skipBtn setBackgroundColor:[UIColor clearColor]];
    [_skipBtn setHidden:YES];
    [_skipBtn addTarget:self action:@selector(removeUserIntro) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_skipBtn];
    //NSLog(@"%@",NSStringFromCGRect(button.frame));
    
    
}

#pragma mark - UIScrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    //int page = fabs(scrollView.contentOffset.x/pageWidth);
    _pageControl.currentPage = page;
    //NSLog(@"page = %d",page);
    
    if (page==2) {
        _skipBtn.hidden = NO;
        
    }
    else {
        _skipBtn.hidden = YES;
    }
}

- (void)removeUserIntro
{
    [self presentViewController:[[ViewController alloc] init] animated:YES completion:nil];  //点击button跳转到根视图
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
