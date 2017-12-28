//
//  HSChangePasswordController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSChangePasswordController.h"

@interface HSChangePasswordController () <UITextFieldDelegate>

@property (nonatomic,strong) UITextField *currentPsdTextField;
@property (nonatomic,strong) UIView *accountView;
@property (nonatomic,strong) UITextField *xinPsdTextField;
@property (nonatomic,strong) UIView *psdView;
@property (nonatomic,strong) UIButton *loginBtn;
/* 是否显示密码 */
@property (nonatomic,strong) UIButton *showCode;

@end

@implementation HSChangePasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.navigationItem.title = @"修改密码";
    
    [self configLayout];
}
//MARK:--configLayout
- (void)configLayout {
    //
    self.currentPsdTextField = [[UITextField alloc] init];
    [self.currentPsdTextField becomeFirstResponder];
    self.currentPsdTextField.delegate = self;
    self.currentPsdTextField.placeholder = @"当前密码";
    self.currentPsdTextField.font = HSFont(14);
    self.currentPsdTextField.textAlignment = NSTextAlignmentLeft;
    [self.currentPsdTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.currentPsdTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.currentPsdTextField];
    //
    self.accountView = [[UIView alloc] init];
    self.accountView.backgroundColor = Color_a71a1a;
    [self.view addSubview:self.accountView];
    //
    self.xinPsdTextField = [[UITextField alloc] init];
    self.xinPsdTextField.delegate = self;
    self.xinPsdTextField.secureTextEntry = true;
    self.xinPsdTextField.placeholder = @"新密码(6-12个字母、数字或者符号)";
    self.xinPsdTextField.font = HSFont(14);
    self.xinPsdTextField.textAlignment = NSTextAlignmentLeft;
    [self.xinPsdTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.xinPsdTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.xinPsdTextField];
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
    [self.currentPsdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(120);
        make.height.mas_equalTo(32);
    }];
    //
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.currentPsdTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.xinPsdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom-24);
        make.top.mas_equalTo(self.currentPsdTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.psdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.xinPsdTextField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.showCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(24);
        make.centerY.mas_equalTo(self.xinPsdTextField.centerY);
    }];
    //
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.xinPsdTextField.mas_bottom).offset(40);
        make.height.mas_equalTo(36);
    }];
    
}

//MARK:--Action
- (void)clickLoginAction:(UIButton *)sender {
    
    
}

- (void)clickShowCodeAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.xinPsdTextField.secureTextEntry = true;
    }
    else {
        self.xinPsdTextField.secureTextEntry = false;
    }
}

//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.currentPsdTextField) {
        [self.currentPsdTextField becomeFirstResponder];
        [self.xinPsdTextField resignFirstResponder];
        self.accountView.backgroundColor = Color_a71a1a;
        self.psdView.backgroundColor = Color_CCCCCC;
    }
    else if (textField == self.xinPsdTextField) {
        [self.xinPsdTextField becomeFirstResponder];
        [self.currentPsdTextField resignFirstResponder];
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
    
    if (textField == self.currentPsdTextField) {
        
    }
    else if (textField == self.xinPsdTextField) {
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
