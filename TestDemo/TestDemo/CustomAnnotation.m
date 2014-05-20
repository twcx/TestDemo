//
//  CustomAnnotation.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-11.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

@synthesize dataInfo;

-(NSString *)title
{
    return [NSString stringWithFormat:@"%@", [dataInfo objectForKey:@"name"]];
}

-(NSString *)subtitle
{
    return [NSString stringWithFormat:@"%@", [dataInfo objectForKey:@"addr"]];
}

-(CLLocationCoordinate2D)coordinate
{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [[dataInfo objectForKey:@"lat"] floatValue];
    theCoordinate.longitude = [[dataInfo objectForKey:@"lon"] floatValue];
    return theCoordinate;
}

@end
