//
//  MapController.m
//  TestDemo
//
//  Created by 沿途の风景 on 14-3-11.
//  Copyright (c) 2014年 Andy. All rights reserved.
//

#import "MapController.h"
#import "CustomAnnotation.h"

@interface MapController ()

@end

@implementation MapController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [NSDictionary dictionaryWithObjectsAndKeys:@"德林家具",@"name",@"39.909543",@"lat",@"116.474445",@"lon",@"大望路",@"addr",@"www.kakatool.com",@"website", nil];
    
    [self prepareMap];
    
    [self createAnnotation];
    
    [self showUserLocation];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(20, 30, 60, 30);
    [btn setTitle:@"back" forState:UIControlStateNormal];
    btn.backgroundColor =[UIColor colorWithWhite:0 alpha:0.5];
    [btn addTarget:self action:@selector(popSec:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton *btnLocation = [UIButton buttonWithType:UIButtonTypeCustom];
    btnLocation.frame = CGRectMake(240, 30, 60, 30);
    [btnLocation setTitle:@"导航" forState:UIControlStateNormal];
    btnLocation.backgroundColor =[UIColor colorWithWhite:0 alpha:0.5];
    [btnLocation addTarget:self action:@selector(callMapShowPathFromCurrentLocationToDes) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnLocation];
    
}

- (void)prepareMap
{
    if (self.mapView == nil) {
        _mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
        _mapView.delegate = self;
        _mapView.showsUserLocation = YES;
        _mapView.zoomEnabled = YES;
        _mapView.scrollEnabled = YES;
        _mapView.mapType = MKMapTypeStandard;
        [self.view addSubview:_mapView];
    }
    
    self.Lat = [[self.data objectForKey:@"lat"] doubleValue];
    self.Lon = [[self.data objectForKey:@"lon"] doubleValue];
    
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(self.Lat, self.Lon);
    float zoomLevel = 0.02;
    
    MKCoordinateRegion region = MKCoordinateRegionMake(coords, MKCoordinateSpanMake(zoomLevel, zoomLevel));
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    
    //反向地理编码
    CLLocation *location = [[CLLocation alloc] initWithLatitude:coords.latitude longitude:coords.longitude];
    NSLog(@"location.lat=%f;location.lon=%f",location.coordinate.latitude,location.coordinate.longitude);
    [self reverseGeocode:location];
}

- (void)createAnnotation
{
    CustomAnnotation *anno = [[CustomAnnotation alloc] init];
    anno.dataInfo = self.data;
    [_mapView addAnnotation:anno];
}

- (void)showUserLocation
{
    if ([CLLocationManager locationServicesEnabled]) {
        _locationManager = [[CLLocationManager alloc] init];//创建位置管理器
        _locationManager.delegate = self;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        _locationManager.distanceFilter = 1000.0f;
    }
    //启动位置更新
    [_locationManager startUpdatingLocation];
}

//返回
- (void)popSec:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

//mapView自动定位
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    self.stationLat = userLocation.coordinate.latitude;
    self.stationLon = userLocation.coordinate.longitude;
    
    NSLog(@"stationLat:%lf,stationLon:%lf",_stationLat,_stationLon);
    
    /*
    MKCoordinateSpan span;
    MKCoordinateRegion region;
    
    span.latitudeDelta=0.02;
    span.longitudeDelta=0.02;
    region.span=span;
    region.center=[userLocation coordinate];
    
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    */
}

//根据经纬度反向解析地址（反向地理编码）
- (void)reverseGeocode:(CLLocation *)location
{
    if (!geocoder) {
        geocoder = [[CLGeocoder alloc] init];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
            if (nil != error) {
                NSLog(@"error1:%@",[error localizedDescription]);
                NSLog(@"error2:%@",[error localizedFailureReason]);
            }
            else if ([placemarks count] > 0) {
                NSLog(@"placemarks=%@",placemarks);
                placemark = [placemarks objectAtIndex:0];
                NSLog(@"placemark = %@",placemark.thoroughfare);
            }
            
            
        }];
    }
}

#pragma mark - CLLocationManager自动定位

//iOS6.0以下
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"locations=%@",locations);
    
    //此处locations存储了持续更新的位置坐标值，取最后一个值为最新位置，如果不想让其持续更新位置，则在此方法中获取到一个值之后让locationManager stopUpdatingLocation
    CLLocation *currentLocation = [locations lastObject];
    CLLocationCoordinate2D coor = currentLocation.coordinate;
    self.stationLat = coor.latitude;
    self.stationLon = coor.longitude;
    NSLog(@"_stationLat:%lf,_stationLon:%lf",_stationLat,_stationLon);
    
    if (locations.count > 0) {
        [_locationManager stopUpdatingLocation];
    }
    
}

//iOS6.0以上
-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //latitude和lontitude均为NSString型变量
    //纬度
    self.stationLat = [[NSString  stringWithFormat:@"%.4f", newLocation.coordinate.latitude] doubleValue];
    //经度
    self.stationLon = [[NSString stringWithFormat:@"%.4f", newLocation.coordinate.longitude] doubleValue];
    NSLog(@"self.stationLat:%lf,self.stationLon:%lf",_stationLat,_stationLon);
}

//定位失败
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied) {
        NSLog(@"error1=%@",[error localizedDescription]);
        NSLog(@"error2=%@",[error localizedFailureReason]);
    }
}

#pragma mark - 判断地图版本导航

-(void)callMapShowPathFromCurrentLocationToDes{
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 6.0f) {
        //ios_version为4.0～5.1时 调用谷歌地图客户端
        
        //生成url字符串
        NSString *urlString = [NSString stringWithFormat:@"http://maps.google.com/maps?saddr=%f,%f&daddr=%f,%f",
                     self.stationLat,self.stationLon,self.Lat,self.Lon];
        
        //转换为utf8编码
        urlString =  [urlString stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
        
        UIApplication *app =[UIApplication sharedApplication];
        NSURL *url = [NSURL URLWithString:urlString];
        
        //验证url是否可用
        if ([app canOpenURL:url]) {
            [app openURL:url];
        }else{
            
            NSLog(@"error");
        }
        
    }
    else{
        // 直接调用ios自己带的apple map
        CLLocationCoordinate2D to;
        
        to.latitude = self.Lat;
        to.longitude = self.Lon;
        MKMapItem *currentLocation = [MKMapItem mapItemForCurrentLocation];
        MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate:to addressDictionary:nil]];
        
        toLocation.name = [self.data objectForKey:@"name"];
        
        [MKMapItem openMapsWithItems:[NSArray arrayWithObjects:currentLocation, toLocation, nil]launchOptions:[NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeDriving,[NSNumber numberWithBool:YES], nil] forKeys:[NSArray arrayWithObjects:MKLaunchOptionsDirectionsModeKey,MKLaunchOptionsShowsTrafficKey, nil]]];
        
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
