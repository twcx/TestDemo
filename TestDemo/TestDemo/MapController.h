//
//  MapController.h
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-11.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@property (nonatomic, retain) MKMapView *mapView;
@property (nonatomic, retain) CLLocationManager *locationManager;

@property(nonatomic,retain) NSDictionary *data;
@property(nonatomic,assign) double Lon;
@property(nonatomic,assign) double Lat;

@property(nonatomic,assign) double stationLat;
@property(nonatomic,assign) double stationLon;

@end
