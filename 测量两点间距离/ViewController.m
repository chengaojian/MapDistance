//
//  ViewController.m
//  测量两点间距离
//
//  Created by 陈高健 on 15/11/29.
//  Copyright © 2015年 陈高健. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@property (nonatomic,strong)CLLocationManager *locationManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建位置管理器
    CLLocationManager *locationManager=[[CLLocationManager alloc]init];
    self.locationManager=locationManager;
    
    //判断当前设备版本是否大于或等于8.0
    if ([UIDevice currentDevice].systemVersion.floatValue >=8.0) {
        //持续授权
        //[locationManager requestAlwaysAuthorization];
        //使用期间授权
        [locationManager requestWhenInUseAuthorization];
    }
    //iOS 9.0以后苹果提供的新属性
    if ([UIDevice currentDevice].systemVersion.floatValue >9.0) {
        //是否允许后台定位
        locationManager.allowsBackgroundLocationUpdates=YES;
    }
    
    //开始定位
    [locationManager startUpdatingLocation];
    //比较两点距离
    [self compareDistance];
}

//比较两地之间距离(直线距离)
- (void)compareDistance{
    //北京 (116.3,39.9)
    CLLocation *location1=[[CLLocation alloc]initWithLatitude:39.9 longitude:116.3];
    //郑州 (113.42,34.44)
    CLLocation *location2=[[CLLocation alloc]initWithLatitude:34.44 longitude:113.42];
    //比较北京距离周口的距离
    CLLocationDistance locationDistance=[location1 distanceFromLocation:location2];
    //单位是m/s 所以这里需要除以1000
    NSLog(@"北京距离郑州的距离为:%f",locationDistance/1000);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
