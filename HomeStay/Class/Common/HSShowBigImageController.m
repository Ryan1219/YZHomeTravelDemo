//
//  HSShowBigImageController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSShowBigImageController.h"

@interface HSShowBigImageController ()

@end

@implementation HSShowBigImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveSliderPhotoNotification:) name:@"sliderPhotoNotification" object:nil];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
































