//
//  ViewController.h
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-27.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate,UIScrollViewDelegate>
{
    float lastScale;
    float pinchScale;
    
    float lastX;
    float lastY;
}


@property (nonatomic,retain) UIScrollView *scr;
@property (nonatomic,retain) UIImageView *img;




@end
