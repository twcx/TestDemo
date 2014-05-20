//
//  UserGuideViewController.h
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-29.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "ViewController.h"

@interface UserGuideViewController : UIViewController<UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    UIPageControl *_pageControl;
    UIButton *_skipBtn;
}

@end
