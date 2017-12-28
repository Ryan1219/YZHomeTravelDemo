//
//  HSLoginViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSNormalLoginViewController.h"
#import "HSForgetPasswordController.h"

@interface HSNormalLoginViewController () <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *accountTextField;
@property (nonatomic,strong) UIView *accountView;
@property (nonatomic,strong) UITextField *psdTextField;
@property (nonatomic,strong) UIView *psdView;
@property (nonatomic,strong) UIButton *loginBtn;
/* 手机登录 */
@property (nonatomic,strong) UIButton *phoneLoginBtn;
/* 忘记密码 */
@property (nonatomic,strong) UIButton *forgetPsdBtn;

@end

@implementation HSNormalLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"登陆";
    
    [self configLayout];
    
}
//MARK:--configLayout
- (void)configLayout {
    //
    self.accountTextField = [[UITextField alloc] init];
    [self.accountTextField becomeFirstResponder];
    self.accountTextField.delegate = self;
    self.accountTextField.placeholder = @"手机号";
    self.accountTextField.font = HSFont(14);
    self.accountTextField.textAlignment = NSTextAlignmentLeft;
    [self.accountTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.accountTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.accountTextField];
    //
    self.accountView = [[UIView alloc] init];
    self.accountView.backgroundColor = Color_a71a1a;
    [self.view addSubview:self.accountView];
    //
    self.psdTextField = [[UITextField alloc] init];
    self.psdTextField.delegate = self;
    self.psdTextField.placeholder = @"密码";
    self.psdTextField.font = HSFont(14);
    self.psdTextField.textAlignment = NSTextAlignmentLeft;
    [self.psdTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.psdTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.psdTextField];
    //
    self.psdView = [[UIView alloc] init];
    self.psdView.backgroundColor = Color_CCCCCC;
    [self.view addSubview:self.psdView];
    //
    self.loginBtn = [[UIButton alloc] init];
    [self.loginBtn setTitle:@"登陆" forState: UIControlStateNormal];
    [self.loginBtn setTitleColor:Color_ffffff forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor greenColor];
    self.loginBtn.titleLabel.font = HSFont(14);
    [self.loginBtn addTarget:self action:@selector(clickLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    //
    self.phoneLoginBtn = [[UIButton alloc] init];
    [self.phoneLoginBtn setTitle:@"手机验证码登陆" forState: UIControlStateNormal];
    [self.phoneLoginBtn setTitleColor:Color_a71a1a forState:UIControlStateNormal];
    self.phoneLoginBtn.titleLabel.font = HSFont(14);
    [self.phoneLoginBtn addTarget:self action:@selector(clickPhoneLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.phoneLoginBtn];
    //
    self.forgetPsdBtn = [[UIButton alloc] init];
    [self.forgetPsdBtn setTitle:@"忘记密码" forState: UIControlStateNormal];
    [self.forgetPsdBtn setTitleColor:Color_999999 forState:UIControlStateNormal];
    self.forgetPsdBtn.titleLabel.font = HSFont(14);
    [self.forgetPsdBtn addTarget:self action:@selector(clickForgetPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.forgetPsdBtn];
    //
    UIView *midLineView = [[UIView alloc] init];
    midLineView.backgroundColor = Color_CCCCCC;
    [self.view addSubview:midLineView];
    
    
    //
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(120);
        make.height.mas_equalTo(32);
    }];
    //
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.accountTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.psdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.accountTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.psdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.psdTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.psdTextField.mas_bottom).offset(40);
        make.height.mas_equalTo(36);
    }];
    //
    CGSize titleSize = [self.phoneLoginBtn.titleLabel.text sizeWithFont:HSFont(14) maxWidth:ScreenWidth/2];
    [self.phoneLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ScreenWidth/2 - titleSize.width - 20 - 0.5);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(titleSize.width + 20);
    }];
    //
    [self.forgetPsdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(ScreenWidth/2 + 0.5);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(titleSize.width + 20);
    }];
    //
    [midLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(1 * HSLineWidth);
        make.height.mas_equalTo(30);
        make.centerY.mas_equalTo(self.forgetPsdBtn.mas_centerY);
    }];
    
    
}


//MARK:--Action
- (void)clickLoginAction:(UIButton *)sender {
    
    
}

- (void)clickPhoneLoginAction:(UIButton *)sender {
    
    [self.navigationController popViewControllerAnimated:true];
}

- (void)clickForgetPasswordAction:(UIButton *)sender {
    HSForgetPasswordController *forgetPsdCtrl = [[HSForgetPasswordController alloc] init];
    [self.navigationController pushViewController:forgetPsdCtrl animated:true];
}

//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.accountTextField) {
        [self.accountTextField becomeFirstResponder];
        [self.psdTextField resignFirstResponder];
        self.accountView.backgroundColor = Color_a71a1a;
        self.psdView.backgroundColor = Color_CCCCCC;
    }
    else if (textField == self.psdTextField) {
        [self.psdTextField becomeFirstResponder];
        [self.accountTextField resignFirstResponder];
        self.accountView.backgroundColor = Color_CCCCCC;
        self.psdView.backgroundColor = Color_a71a1a;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return false;
    }
    
    NSString *toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField == self.accountTextField) {
        
    }
    else if (textField == self.psdTextField) {
        
    }
//
//    NSInteger totolCount = (_currentIndex == 4) ? 30 : 20;
//    if ([toBeString length] <= totolCount) {
//        return true;
//    } else {
//        return false;
//    }
    return true;
}

@end

















