//
//  HSModifyNickNameController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/26.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSModifyNickNameController.h"

@interface HSModifyNickNameController () <UITextFieldDelegate>
/* 昵称 */
@property (nonatomic,strong) UITextField *nicknameField;
@property (nonatomic,strong) UIView *nickView;
/* 保存 */
@property (nonatomic,strong) UIButton *saveBtn;

@end

@implementation HSModifyNickNameController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"昵称";
    
    [self configLayout];
    
    //
    self.saveBtn = [[UIButton alloc] init];
    [self.saveBtn setTitle:@"保存" forState: UIControlStateNormal];
    [self.saveBtn setTitleColor:Color_ffffff forState:UIControlStateNormal];
    self.saveBtn.backgroundColor = Color_a71a1a;
    self.saveBtn.titleLabel.font = HSFont(14);
    [self.saveBtn addTarget:self action:@selector(clickSaveAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.saveBtn];
}

- (void)configLayout {
    //
    self.nicknameField = [[UITextField alloc] init];
    [self.nicknameField becomeFirstResponder];
    self.nicknameField.delegate = self;
    self.nicknameField.secureTextEntry = true;
    self.nicknameField.placeholder = @"请输入昵称";
    self.nicknameField.font = HSFont(14);
    self.nicknameField.textAlignment = NSTextAlignmentLeft;
    [self.nicknameField setValue:Color_999999 forKeyPath:@"_placeholderLabel.textColor"];
    [self.nicknameField setValue:HSFont(12) forKeyPath:@"_placeholderLabel.font"];
    [self.view addSubview:self.nicknameField];
    //
    self.nickView = [[UIView alloc] init];
    self.nickView.backgroundColor = Color_a71a1a;
    [self.view addSubview:self.nickView];
    
    
    //
    [self.nicknameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom-24);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(32);
    }];
    //
    [self.nickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.nicknameField.mas_bottom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
}

//MARK:--Action
- (void)clickSaveAction:(UIButton *)sender {
    
    
}

//MARK:--UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.nicknameField) {
        [self.nicknameField becomeFirstResponder];
        self.nickView.backgroundColor = Color_a71a1a;
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
    
    if (textField == self.nicknameField) {
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






















