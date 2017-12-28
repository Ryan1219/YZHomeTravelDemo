//
//  HSNewsViewController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSNewsViewController.h"
#import "HSOrderView.h"
#import "HSDashBorderView.h"

@interface HSNewsViewController ()

@end

@implementation HSNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"News";
    
    NSArray *dataArray = [[NSArray alloc] initWithObjects:@"如取消订单，全额退款",@"如取消订单，扣除首晚房费以及生育房费的20%",@"如取消订单，扣除首晚房费以及生育房费的20%，如取消订单，扣除首晚房费以及生育房费的20%", nil];
    CGFloat textHeight = 60;
    for (NSString *content in dataArray) {
        CGFloat contentH = [content sizeWithFont:HSFont(14) maxWidth:ScreenWidth/2 - 60].height + 30;
        NSLog(@"----%f",contentH);
        if (contentH > textHeight) {
            textHeight = contentH;
        }
    }
    
    HSOrderView *orderView = [[HSOrderView alloc] initWithFrame:CGRectZero];
    orderView.dataArray = dataArray;
    orderView.cellHeight = textHeight;
    [self.view addSubview:orderView];
    [orderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(115 + textHeight);
    }];
    
    
    HSDashBorderView *borderView = [[HSDashBorderView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:borderView];
    [borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(orderView.mas_bottom).offset(20);
        make.left.mas_equalTo(20);
        make.width.mas_equalTo(ScreenWidth - 40);
        make.height.mas_equalTo(200);
    }];
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
