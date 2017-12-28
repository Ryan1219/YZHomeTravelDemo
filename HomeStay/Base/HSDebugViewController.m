//
//  HSDebugViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSDebugViewController.h"

@interface HSDebugViewController ()

@property (weak, nonatomic) IBOutlet UITextField *rnAddressTextField;
@property (weak, nonatomic) IBOutlet UITextField *hostTextField;

@end

@implementation HSDebugViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"测试环境配置";
    
    NSString *rnAddressStr = [HSCommonMethod getObjectFromUserDefaultWithKey:@"keyHost"];
    NSString *baseUrlStr = [HSCommonMethod getObjectFromUserDefaultWithKey:@"keyBaseURL"];
    
    self.rnAddressTextField.text = rnAddressStr;
    
    if (!baseUrlStr || baseUrlStr.length <= 0) {
        self.hostTextField.text = kBaseURL;
    }
    else {
        self.hostTextField.text = baseUrlStr;
    }
    
#if (PACKAGE_ONLINE)
    self.rnAddressTextField.enabled = true;
#else
    self.rnAddressTextField.enabled = false;
#endif
    
    
    UIButton *saveBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    saveBtn.titleLabel.font = HSFont(12);
    [saveBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn addTarget:self action:@selector(saveClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveBtn];
    
}

- (void)saveClick:(UIButton *)sender {
    
    [HSCommonMethod saveObjectToUserDefaultWithKey:@"keyHost" value:self.rnAddressTextField.text];
    [HSCommonMethod saveObjectToUserDefaultWithKey:@"keyBaseURL" value:self.hostTextField.text];
    [self showToastText:@"保存成功"];
}



@end
































