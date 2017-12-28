//
//  HSUserCenterSetPsdController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/25.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUserCenterSetPsdController.h"

@interface HSUserCenterSetPsdController () <UITextFieldDelegate>

/* 是否显示密码 */
@property (nonatomic,strong) UIButton *showCode;
@property (nonatomic,strong) UITextField *psdTextField;
@property (nonatomic,strong) UIView *psdView;
@property (nonatomic,strong) UIButton *finishBtn;

@end

@implementation HSUserCenterSetPsdController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置密码";
    
    [self configLayout];
}

//MARK:--configLayout
- (void)configLayout {
    //
    self.psdTextField = [[UITextField alloc] init];
    [self.psdTextField becomeFirstResponder];
    self.psdTextField.delegate = self;
    self.psdTextField.secureTextEntry = true;
    self.psdTextField.placeholder = @"6-12个字母、数字或者符号的组合";
    self.psdTextField.font = HSFont(14);
    self.psdTextField.textAlignment = NSTextAlignmentLeft;
    [self.psdTextField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.psdTextField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.psdTextField];
    //
    self.psdView = [[UIView alloc] init];
    self.psdView.backgroundColor = Color_a71a1a;
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
    self.finishBtn = [[UIButton alloc] init];
    self.finishBtn.backgroundColor = [UIColor greenColor];
    [self.finishBtn setTitle:@"完成" forState: UIControlStateNormal];
    [self.finishBtn setTitleColor:Color_a71a1a forState:UIControlStateNormal];
    self.finishBtn.titleLabel.font = HSFont(14);
    self.finishBtn.layer.cornerRadius = 4;
    self.finishBtn.layer.masksToBounds = true;
    [self.finishBtn addTarget:self action:@selector(clickFinishAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.finishBtn];

    //
    [self.psdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom-24);
        make.top.mas_equalTo(120);
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
    [self.showCode mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(24);
        make.centerY.mas_equalTo(self.psdTextField.centerY);
    }];
    //
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
         make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.psdTextField.mas_bottom).offset(20);
        make.height.mas_equalTo(32);
    }];
}


//MARK:--Action
- (void)clickShowCodeAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.psdTextField.secureTextEntry = true;
    }
    else {
        self.psdTextField.secureTextEntry = false;
    }
}

- (void)clickFinishAction:(UIButton *)sender {
    
    
}


//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.psdTextField) {
        [self.psdTextField becomeFirstResponder];
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
    
    if (textField == self.psdTextField) {
        if ([toBeString length] <= 12) {
            return true;
        }
        else {
            return false;
        }
    }
    return true;
}















@end