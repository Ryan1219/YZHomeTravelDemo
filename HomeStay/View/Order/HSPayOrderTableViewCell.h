//
//  HSPayOrderTableViewCell.h
//  HomeStay
//
//  Created by Ryan on 2017/12/18.
//  Copyright © 2017年 Q房通. All rights reserved.
//  支付订单

#import <UIKit/UIKit.h>

@interface HSPayOrderTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@end



@interface HSPayTypeTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@end
