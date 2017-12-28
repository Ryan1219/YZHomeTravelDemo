//
//  HSHouseResourceDetailController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
// http://www.jianshu.com/p/f00dd7955675

#import "HSHouseResourceDetailController.h"
#import "HSBaiduMapView.h"

@interface HSHouseResourceDetailController ()
@property (nonatomic,strong) UITextField *accountTextField;


@end

@implementation HSHouseResourceDetailController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    
    HSBaiduMapView *mapView = [[HSBaiduMapView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth)];
//    HSBaiduMapView *mapView = [[HSBaiduMapView alloc] initWithFrame:CGRectZero];
    mapView.center = CGPointMake(ScreenWidth / 2, ScreenHeight/2 - 64);
    [self.view addSubview:mapView];
//    [mapView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.height.mas_equalTo(ScreenWidth);
//        make.centerY.mas_equalTo(self.view.mas_centerY).offset(-64);
//        make.centerX.mas_equalTo(self.view.mas_centerX);
//    }];
//
    

    
}





@end















