//
//  HSPhoneLoginViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSPhoneLoginViewController.h"
#import "HSNormalLoginViewController.h"
 #import "HSSettingPasswordController.h"

@interface HSPhoneLoginViewController () <WXApiDelegate,TencentSessionDelegate,UITextFieldDelegate>

@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UIView *phoneView;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UIView *codeView;
@property (nonatomic,strong) UIButton *codeBtn;
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) UIButton *loginBtn;
@property (nonatomic,strong) UIButton *normalLoginBtn;

@end

@implementation HSPhoneLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"手机登录";
    
    [self configLayout];
}

//MARK:--configLayout
- (void)configLayout {
    //
    self.phoneTextField = [[UITextField alloc] init];
    [self.phoneTextField becomeFirstResponder];
    self.phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.phoneTextField.delegate = self;
    self.phoneTextField.placeholder = @"手机号";
    self.phoneTextField.font = HSFont(14);
    self.phoneTextField.textAlignment = NSTextAlignmentLeft;
    [self.phoneTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.phoneTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.phoneTextField];
    //
    self.phoneView = [[UIView alloc] init];
    self.phoneView.backgroundColor = Color_a71a1a;
    [self.view addSubview:self.phoneView];
    //
    self.codeTextField = [[UITextField alloc] init];
    self.codeTextField.delegate = self;
    self.codeTextField.placeholder = @"验证码";
    self.codeTextField.font = HSFont(14);
    self.codeTextField.textAlignment = NSTextAlignmentLeft;
    [self.codeTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.codeTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.codeTextField];
    //
    self.codeView = [[UIView alloc] init];
    self.codeView.backgroundColor = Color_CCCCCC;
    [self.view addSubview:self.codeView];
    //
    self.codeBtn = [[UIButton alloc] init];
    [self.codeBtn setTitle:@"获取验证码" forState: UIControlStateNormal];
    [self.codeBtn setTitleColor:Color_a71a1a  forState:UIControlStateNormal];
    self.codeBtn.titleLabel.font = HSFont(14);
    [self.codeBtn addTarget:self action:@selector(clickGetCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.codeBtn];
    //
    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.numberOfLines = 0;
    self.tipLabel.text = @"验证通过即注册成功";
    self.tipLabel.font = HSFont(12);
    self.tipLabel.textColor = Color_999999;
    self.tipLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:self.tipLabel];
    //
    self.loginBtn = [[UIButton alloc] init];
    [self.loginBtn setTitle:@"登陆" forState: UIControlStateNormal];
    [self.loginBtn setTitleColor:Color_ffffff forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor greenColor];
    self.loginBtn.titleLabel.font = HSFont(14);
    [self.loginBtn addTarget:self action:@selector(clickLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    //
    self.normalLoginBtn = [[UIButton alloc] init];
    [self.normalLoginBtn setTitle:@"账号密码登陆" forState: UIControlStateNormal];
    [self.normalLoginBtn setTitleColor:Color_a71a1a forState:UIControlStateNormal];
    self.normalLoginBtn.titleLabel.font = HSFont(14);
    [self.normalLoginBtn addTarget:self action:@selector(clickNormalLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.normalLoginBtn];
    
    //
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(120);
        make.height.mas_equalTo(32);
    }];
    //
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    CGSize codeSize = [self.codeBtn.titleLabel.text sizeWithFont:HSFont(14) maxWidth:ScreenWidth/2];
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.width.mas_equalTo(codeSize.width + 20);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.codeTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(self.codeBtn.mas_left);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.codeTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.codeView.mas_bottom).offset(5);
        make.height.mas_equalTo(16);
    }];
    //
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.codeTextField.mas_bottom).offset(40);
        make.height.mas_equalTo(36);
    }];
    //
    [self.normalLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.loginBtn.mas_bottom).offset(20);
        make.height.mas_equalTo(36);
    }];
    
}


- (void)weixinLoign {
    
    SendAuthReq *req = [[SendAuthReq alloc] init];
    req.scope = @"";
    req.state = @"";
    [WXApi sendAuthReq:req viewController:self delegate:self];
}

- (void)qqLogin {
    
    TencentOAuth *oauth = [[TencentOAuth alloc] initWithAppId:@""
                                                  andDelegate:self];
    NSArray *permission = @[kOPEN_PERMISSION_GET_INFO,kOPEN_PERMISSION_GET_USER_INFO,kOPEN_PERMISSION_GET_SIMPLE_USER_INFO];
    [oauth authorize:@[] inSafari:false];
}


//MARK:--Action Method
- (void)clickGetCodeAction:(UIButton *)sender {
    
}

- (void)clickLoginAction:(UIButton *)sender {
   //登录没有密码
    HSSettingPasswordController *setPsdCtrl = [[HSSettingPasswordController alloc] init];
    [self.navigationController pushViewController:setPsdCtrl animated:true];
   //登录有密码
    
}

- (void)clickNormalLoginAction:(UIButton *)sender {
    HSNormalLoginViewController *normalLoginCtrl = [[HSNormalLoginViewController alloc] init];
    [self.navigationController pushViewController:normalLoginCtrl animated:true];
}

//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.phoneTextField) {
        [self.phoneTextField becomeFirstResponder];
        [self.codeTextField resignFirstResponder];
        self.phoneView.backgroundColor = Color_a71a1a;
        self.codeView.backgroundColor = Color_CCCCCC;
    }
    else if (textField == self.codeTextField) {
        [self.codeTextField becomeFirstResponder];
        [self.phoneTextField resignFirstResponder];
        self.phoneView.backgroundColor = Color_CCCCCC;
        self.codeView.backgroundColor = Color_a71a1a;
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
    
    if (textField == self.phoneTextField) {
        
    }
    else if (textField == self.codeTextField) {
        
    }
    
    return true;
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
