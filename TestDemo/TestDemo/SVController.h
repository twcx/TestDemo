//
//  SVController.h
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-21.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SVController : UIViewController<UITextFieldDelegate>

@property (nonatomic, retain) UIScrollView *sv;
@property (nonatomic, retain) UITextField *txtF1;
@property (nonatomic, retain) UITextField *txtF2;

@end
