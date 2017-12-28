//
//  HSOrderDetailViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/18.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSOrderDetailViewController.h"

@interface HSOrderDetailViewController ()
/* 定时器源 */
@property (nonatomic,strong) dispatch_source_t timer;

@end

@implementation HSOrderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}

//MARK:--底部支付按钮
- (void)configBottomView {
    
    CGFloat btnW = ScreenWidth / 3;
    CGFloat btnH = 44;
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW * 2, btnH)];
    cancelBtn.backgroundColor = [UIColor whiteColor];
    [cancelBtn setTitle:@"" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:HSColor(0x666666) forState:UIControlStateNormal];
    cancelBtn.titleLabel.font = HSFont(14);
    [cancelBtn addTarget:self action:@selector(clickCancelOrderAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBtn];
    
    UIButton *payBtn = [[UIButton alloc] initWithFrame:CGRectMake(btnW * 2, 0, btnW, btnH)];
    payBtn.backgroundColor = [UIColor greenColor];
    [payBtn setTitle:@"" forState:UIControlStateNormal];
    [payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    payBtn.titleLabel.font = HSFont(14);
    [payBtn addTarget:self action:@selector(clickPayAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:payBtn];
 
}

//MARK:--Private Method
// 倒计时
- (void)countDown {
    
    dispatch_queue_t queue = dispatch_queue_create("com.mshz.queue", DISPATCH_QUEUE_CONCURRENT);
    
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)1.0 * NSEC_PER_SEC);
    
    uint64_t interval = (uint64_t)1.0 * NSEC_PER_SEC;
    
    dispatch_source_set_timer(self.timer, start, interval, 0);
    
    __block NSInteger countTime = 60;
    WeakSelf
    dispatch_source_set_event_handler(weakSelf.timer, ^{
        
        if (countTime <= 0) {
            dispatch_source_cancel(weakSelf.timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }
        else {
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }
        countTime--;
    });
    dispatch_resume(self.timer);
}
//MARK:--Action Method
- (void)clickCancelOrderAction:(UIButton *)sender {
    
}

- (void)clickPayAction:(UIButton *)sender {
    
}


@end



























