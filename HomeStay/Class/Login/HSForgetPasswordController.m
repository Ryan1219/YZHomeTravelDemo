//
//  HSSecondPhoneLoginViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSForgetPasswordController.h"

@interface HSForgetPasswordController () <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UIView *phoneView;
@property (nonatomic,strong) UITextField *codeTextField;
@property (nonatomic,strong) UIView *codeView;
@property (nonatomic,strong) UITextField *passwordTextField;
@property (nonatomic,strong) UIView *psdView;
@property (nonatomic,strong) UIButton *codeBtn;
@property (nonatomic,strong) UIButton *loginBtn;
/* 是否显示密码 */
@property (nonatomic,strong) UIButton *showCode;

@end

@implementation HSForgetPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"忘记密码";
    
     [self configLayout];
    
    
}

//MARK:--configLayout
- (void)configLayout {
    //
    self.phoneTextField = [[UITextField alloc] init];
    [self.phoneTextField becomeFirstResponder];
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
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.delegate = self;
    self.passwordTextField.placeholder = @"新密码(6-12个字母、数字或符号)";
    self.passwordTextField.font = HSFont(14);
    self.passwordTextField.secureTextEntry = true;
    self.passwordTextField.textAlignment = NSTextAlignmentLeft;
    [self.passwordTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.passwordTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.passwordTextField];
    //
    self.psdView = [[UIView alloc] init];
    self.psdView.backgroundColor = Color_CCCCCC;
    [self.view addSubview:self.psdView];
    //
    self.showCode = [[UIButton alloc] init];
    self.showCode.backgroundColor = [UIColor greenColor];
    self.showCode.selected = true;
    [self.showCode setImage:HSImage(@"common_star_red") forState:UIControlStateNormal];
    [self.showCode setImage:HSImage(@"common_star_gray") forState:UIControlStateSelected];
    self.showCode.titleLabel.font = HSFont(14);
    self.showCode.layer.cornerRadius = 4;
    self.showCode.layer.masksToBounds = true;
    [self.showCode addTarget:self action:@selector(clickShowCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.showCode];
    
    //
    self.loginBtn = [[UIButton alloc] init];
    [self.loginBtn setTitle:@"完成并登陆" forState: UIControlStateNormal];
    [self.loginBtn setTitleColor:Color_ffffff forState:UIControlStateNormal];
    self.loginBtn.backgroundColor = [UIColor greenColor];
    self.loginBtn.titleLabel.font = HSFont(14);
    [self.loginBtn addTarget:self action:@selector(clickLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginBtn];
    
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
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom-24);
        make.top.mas_equalTo(self.codeTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.psdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.passwordTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.showCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(24);
        make.centerY.mas_equalTo(self.passwordTextField.centerY);
    }];
    //
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.passwordTextField.mas_bottom).offset(40);
        make.height.mas_equalTo(36);
    }];
    
}

//MARK:--Action
- (void)clickLoginAction:(UIButton *)sender {
    
}

- (void)clickGetCodeAction:(UIButton *)sender {
    
}

- (void)clickShowCodeAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.passwordTextField.secureTextEntry = true;
    }
    else {
        self.passwordTextField.secureTextEntry = false;
    }

}

//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.phoneTextField) {
        [self.phoneTextField becomeFirstResponder];
        [self.codeTextField resignFirstResponder];
        [self.passwordTextField resignFirstResponder];
        self.phoneView.backgroundColor = Color_a71a1a;
        self.codeView.backgroundColor = Color_CCCCCC;
        self.psdView.backgroundColor = Color_CCCCCC;
    }
    else if (textField == self.codeTextField) {
        [self.phoneTextField resignFirstResponder];
        [self.codeTextField becomeFirstResponder];
        [self.passwordTextField resignFirstResponder];
        self.phoneView.backgroundColor = Color_CCCCCC;
        self.codeView.backgroundColor = Color_a71a1a;
        self.psdView.backgroundColor = Color_CCCCCC;
    }
    else if (textField == self.passwordTextField) {
        [self.phoneTextField resignFirstResponder];
        [self.codeTextField resignFirstResponder];
        [self.passwordTextField becomeFirstResponder];
        self.phoneView.backgroundColor = Color_CCCCCC;
        self.codeView.backgroundColor = Color_CCCCCC;
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
    
    if (textField == self.phoneTextField) {
        
    }
    else if (textField == self.codeTextField) {
        
    }
    else if (textField == self.passwordTextField) {
        if ([toBeString length] <= 12) {
            return true;
        }
        else {
            return false;
        }
    }
    return true;
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
