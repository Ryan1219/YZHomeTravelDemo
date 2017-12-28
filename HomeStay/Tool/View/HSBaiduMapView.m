//
//  HSBaiduMapView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/19.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSBaiduMapView.h"

@interface HSBaiduMapView () <BMKMapViewDelegate,BMKLocationServiceDelegate,BMKGeoCodeSearchDelegate>

@property (nonatomic,strong) BMKMapView *mapView;
@property (nonatomic,strong) BMKLocationService *locService;
@property (nonatomic,strong) BMKGeoCodeSearch *codeSearch;
@property (nonatomic,strong) UILabel *addressLabel;
@end

@implementation HSBaiduMapView


static id _sharedSessionInstance = nil;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedSessionInstance = [[self alloc] init];
    });
    return _sharedSessionInstance;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = true;
        [self configLayout];
    }
    return self;
}

- (void)configLayout{
    //定位服务
    self.locService = [[BMKLocationService alloc] init];
    self.locService.distanceFilter = 2.0;
    self.locService.delegate = self;
    
    //显示地图
    self.mapView = [[BMKMapView alloc] initWithFrame:self.bounds];
    self.mapView.delegate = self;
    self.mapView.showsUserLocation = true; //开启定位
    self.mapView.userTrackingMode = BMKUserTrackingModeFollow; //定位模式
    self.mapView.zoomLevel = 16;//设置缩放级别
    //    self.mapView.showMapScaleBar = true; //显示比例尺和比例尺位置
    //    self.mapView.rotateEnabled = true; //是否允许旋转地图
//    self.mapView.baseIndoorMapEnabled = true; //显示室内图
                    
    //    [self.mapView setTrafficEnabled:true];//是否显示交通状况
    //    [self.mapView setBaiduHeatMapEnabled:true];//设置百度地图城市热力图
    [self addSubview:self.mapView];
    
    //自定义精度圈的设置
//    BMKLocationViewDisplayParam *params = [[BMKLocationViewDisplayParam alloc] init];
//    params.accuracyCircleFillColor = HSColor(0xcccccc);
//    params.accuracyCircleStrokeColor = Color_a71a1a;
//    [self.mapView updateLocationViewWithParam:params];
    
    //编码和反编码
    self.codeSearch = [[BMKGeoCodeSearch alloc] init];
    self.codeSearch.delegate = self;
    
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.alpha = 0.7;
    self.addressLabel.backgroundColor = Color_CCCCCC;
    self.addressLabel.font = HSFont(16);
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    self.addressLabel.textColor = Color_a71a1a;
    [self addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self.centerY);
    }];
    
}

//MARK:--BMKMapViewDelegate
/**
 *地图初始化完毕时会调用此接口
 *@param mapView 地图View
 */
- (void)mapViewDidFinishLoading:(BMKMapView *)mapView {
    
    [self.locService startUserLocationService];
}

/**
 *地图区域即将改变时会调用此接口
 *@param mapView 地图View
 *@param animated 是否动画
 */
- (void)mapView:(BMKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    
    
}
/**
 *地图状态改变完成后会调用此接口
 *@param mapView 地图View
 */
- (void)mapStatusDidChanged:(BMKMapView *)mapView {
    
    
}


//MARK:--BMKLocationServiceDelegate
/**
 *在将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser {
    
    Log(@"will start locate");
}

/**
 *在停止定位后，会调用此函数
 */
- (void)didStopLocatingUser {
    
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation {
    [self.mapView updateLocationData:userLocation];
    [self reverseGeoCodeOptionWithBMKUserLocation:userLocation];
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
    [self.mapView updateLocationData:userLocation];
    [self reverseGeoCodeOptionWithBMKUserLocation:userLocation];
    
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error {
    
}

- (void)reverseGeoCodeOptionWithBMKUserLocation:(BMKUserLocation *)userLocation {
    BMKReverseGeoCodeOption *reverseGeocodeOption = [[BMKReverseGeoCodeOption alloc]init];
    CLLocationCoordinate2D pt = CLLocationCoordinate2DMake(userLocation.location.coordinate.latitude, userLocation.location.coordinate.longitude);
    reverseGeocodeOption.reverseGeoPoint = pt;
    BOOL flag = [self.codeSearch reverseGeoCode:reverseGeocodeOption];
    if (flag) {
        Log(@"反编码发送成功");
    }
    else {
        Log(@"反编码发送失败");
    }
    
}

//MARK:--BMKGeoCodeSearchDelegate
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {

    NSArray *array = [NSArray arrayWithArray:self.mapView.annotations];
    [self.mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:self.mapView.overlays];
    [self.mapView removeOverlays:array];

    if (error == 0) {
        BMKPointAnnotation *item = [[BMKPointAnnotation alloc] init];
        item.coordinate = result.location;
        item.title = result.address;
        [self.mapView addAnnotation:item];
        self.mapView.centerCoordinate = result.location;

//        NSString* titleStr = @"正向地理编码";
//        NSString* showmeg = [NSString stringWithFormat:@"纬度:%f,经度:%f",item.coordinate.latitude,item.coordinate.longitude];

//        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:titleStr message:showmeg delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定",nil];
//        [myAlertView show];
    }
}

- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    
    NSArray *array = [NSArray arrayWithArray:self.mapView.annotations];
    [self.mapView removeAnnotations:array];
    array = [NSArray arrayWithArray:self.mapView.overlays];
    [self.mapView removeOverlays:array];
    
    if (error == 0) {
        BMKPointAnnotation *item = [[BMKPointAnnotation alloc] init];
        item.coordinate = result.location;
        item.title = result.address;
        [self.mapView addAnnotation:item];
        self.mapView.centerCoordinate = result.location;
        
        self.addressLabel.text = item.title;
    }
}

//MARK:--dealloc
- (void)dealloc {
    Log(@"---self.mapView----");
    if (self.mapView) {
        self.mapView = nil;
    }
    
    if (self.codeSearch) {
        self.codeSearch = nil;
    }
}

@end
























