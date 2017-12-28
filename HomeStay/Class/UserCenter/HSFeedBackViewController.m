//
//  HSFeedBackViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/25.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSFeedBackViewController.h"

@interface HSFeedBackViewController () <UITextViewDelegate>

@property (nonatomic,strong) UITextView *textView;
@property (nonatomic,strong) UILabel *placeLabel;
@property (nonatomic,strong) UIButton *commitBtn;

@end

@implementation HSFeedBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"意见反馈";
    
    [self configLayout];
    
}

- (void)configLayout {
    
    UIView *backView = [[UIView alloc] init];
    backView.backgroundColor = Color_ffffff;
    [self.view addSubview:backView];
    
    self.textView = [[UITextView alloc] init];
    self.textView.font = HSFont(14);
    self.textView.textColor = HSColor(0x3a3a3a);
    self.textView.delegate = self;
    [backView addSubview:self.textView];
    
    NSString *placeStr = @"对我们有什么意见或者在使用过程中有什么问题都可以反馈给我们，我们会重视你提出的任何意见";
    self.placeLabel = [[UILabel alloc] init];
    self.placeLabel.numberOfLines = 0;
    self.placeLabel.font = HSFont(14);
    self.placeLabel.text = placeStr;
    self.placeLabel.textAlignment = NSTextAlignmentLeft;
    self.placeLabel.textColor = HSColor(0x999999);
    [backView addSubview:self.placeLabel];
    
    
    self.commitBtn = [[UIButton alloc] init];
    self.commitBtn.backgroundColor = Color_5aa572;
    [self.commitBtn setTitle:@"提交评价" forState: UIControlStateNormal];
    [self.commitBtn setTitleColor:Color_ffffff forState:UIControlStateNormal];
    self.commitBtn.titleLabel.font = HSFont(14);
    self.commitBtn.layer.cornerRadius = 4;
    self.commitBtn.layer.masksToBounds = true;
    [self.commitBtn addTarget:self action:@selector(clickCommitAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.commitBtn];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(0);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(180);
    }];
    
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18);
        make.top.mas_equalTo(6);
        make.width.mas_equalTo(ScreenWidth-36);
        make.height.mas_equalTo(180-12);
    }];
    
    CGSize placeSize = [placeStr sizeWithFont:HSFont(14) maxWidth:ScreenWidth-48];
    [self.placeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(24);
        make.top.mas_equalTo(12);
        make.width.mas_equalTo(ScreenWidth-48);
        make.height.mas_equalTo(placeSize.height);
    }];
    
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(32);
        make.top.mas_equalTo(backView.mas_bottom).offset(20);
    }];
}


//MARK:--UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    
    [self.textView becomeFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if ([text isEqualToString:@"\n"]) {
        [self.textView resignFirstResponder];
        return false;
    }
    
    NSString *toBeString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    //字数限制
    if ([toBeString length] <= 200) {
        return true;
    } else {
        return false;
    }
    return true;
}


- (void)textViewDidEndEditing:(UITextView *)textView {
    
    [self.textView resignFirstResponder];
    
}


- (void)textViewDidChange:(UITextView *)textView {
    
    if (!textView.text.length) {
        self.placeLabel.alpha = 1;
    } else {
        self.placeLabel.alpha = 0;
    }
    
}


//MARK:--Action Method
- (void)clickCommitAction:(UIButton *)sender {
    
    
}




@end




















































