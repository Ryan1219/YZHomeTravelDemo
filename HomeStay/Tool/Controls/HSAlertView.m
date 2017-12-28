//
//  HSAlertView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/20.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSAlertView.h"

@interface HSAlertView ()

@end

@implementation HSAlertView

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message alertStyle:(UIAlertControllerStyle)alertStyle titleArray:(NSArray *)titleArray hasCancel:(BOOL)hasCancel controller:(UIViewController *)controller {
    self = [super init];
    if (self) {
        [self configWithTitle:title message:message alertStyle:alertStyle titleArray:titleArray hasCancel:hasCancel controller:controller];
    }
    return self;
}


- (void)configWithTitle:(NSString *)title message:(NSString *)message alertStyle:(UIAlertControllerStyle)alertStyle titleArray:(NSArray *)titleArray hasCancel:(BOOL)hasCancel controller:(UIViewController *)controller {
    
    UIAlertController *alterCtrl = [UIAlertController alertControllerWithTitle:NONULLSTRING(title) message:NONULLSTRING(message) preferredStyle:alertStyle];
    if (hasCancel) {
        [alterCtrl addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel  handler:^(UIAlertAction * _Nonnull action) {
        }]];
    }
    if (titleArray.count != 0) {
        WeakSelf
        for (NSInteger i= 0; i < titleArray.count; i++) {
            [alterCtrl addAction:[UIAlertAction actionWithTitle:titleArray[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (weakSelf.clickActionWithAlertViewBlock) {
                    weakSelf.clickActionWithAlertViewBlock(i);
                }
            }]];
        }
    }
    [controller presentViewController:alterCtrl animated:true completion:nil];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
