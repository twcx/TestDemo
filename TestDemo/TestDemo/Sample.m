//
//  Sample.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-20.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "Sample.h"

//static int a = 100;

@implementation Sample

+(void)addCount
{
    //static int a = 100;
    __block int a = 100;
    a ++;
    NSLog(@"a=%d",a);
}

@end
