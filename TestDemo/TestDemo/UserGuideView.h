//
//  UserGuideView.h
//  TestDemo
//
//  Created by 沿途の风景 on 13-12-2.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserGuideView : UIView<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
}

@property (retain, nonatomic) UIButton *skipBtn;

@end
