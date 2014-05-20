//
//  AppDelegate.h
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-26.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIScrollViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) ViewController *viewController;

@end
