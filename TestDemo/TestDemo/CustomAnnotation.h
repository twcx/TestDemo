//
//  CustomAnnotation.h
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-11.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface CustomAnnotation : NSObject<MKAnnotation>
{
    NSDictionary *dataInfo;
}

@property (nonatomic, retain) NSDictionary *dataInfo;

@end
