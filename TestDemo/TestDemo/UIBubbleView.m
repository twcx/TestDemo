//
//  UIBubbleView.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-1-21.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "UIBubbleView.h"


@implementation UIBubbleView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        //self.backgroundColor = [UIColor orangeColor];
        //[self drawRect:self.frame];
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    NSLog(@"bubble draw");
    
    //第一种方式绘制蓝色圆
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 10, 100, 100)];
    [[UIColor blueColor] setFill];
    [p fill];
    
    
    /*第二种方式绘制绿色圆
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(120, 10, 100, 100));
    CGContextSetFillColorWithColor(con, [UIColor greenColor].CGColor);
    CGContextFillPath(con);
    */
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*画一条线
     CGContextSetRGBStrokeColor(context, 0.5, 0.5, 0.5, 0.5);//线条颜色
     CGContextMoveToPoint(context, 20, 20);
     CGContextAddLineToPoint(context, 200,20);
     CGContextStrokePath(context);
     */
    
    CGContextSetRGBFillColor(context, 0, 0.25, 0, 0.5);
    CGContextFillRect(context, CGRectMake(2, 2, 100, 100));
    CGContextStrokePath(context);
    
    
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    /*
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor grayColor].CGColor);
    CGContextFillPath(ctx);
     */
    
    /*
    UIGraphicsPushContext(ctx);
    UIBezierPath *p = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(120, 10, 100, 100)];
    [[UIColor blueColor] setFill];
    [p fill];
    UIGraphicsPopContext();
    */
    
    
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
//    //画一条线
//     CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 1);//线条颜色
//     CGContextMoveToPoint(ctx, 20, 20);
//     CGContextAddLineToPoint(ctx, 200,20);
//     CGContextStrokePath(ctx);
//    
//    //正方形
//    CGContextSetRGBFillColor(ctx, 0, 0.25, 0, 1);
//    CGContextFillRect(ctx, CGRectMake(10, 10, 100, 100));
//    CGContextStrokePath(ctx);
//    
//    //正方形边框
//    CGContextSetRGBStrokeColor(ctx, 0.5, 0.5, 0.5, 0.5);//线条颜色
//    CGContextSetLineWidth(ctx, 2.0);
//    CGContextAddRect(ctx, CGRectMake(110, 10, 100, 100));
//    CGContextStrokePath(ctx);
    
    CGRect aRect= CGRectMake(100, 10, 10, 10);
    CGContextSetRGBStrokeColor(ctx, 0.6, 0.9, 0, 1.0);
    CGContextSetLineWidth(ctx, 3.0);
    CGContextAddEllipseInRect(ctx, aRect); //空心圆
    CGContextDrawPath(ctx, kCGPathStroke);
    
}



@end
