//
//  HSOrderDetailTableViewCell.h
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//  订单详情cell

#import <UIKit/UIKit.h>
#import "HSOrderDetailModel.h"

// 订单详情cell
@interface HSOrderDetailTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
/* currentIndexPath */
@property (nonatomic,strong) NSIndexPath *currentIndexPath;
/* 模型 */
@property (nonatomic,strong) HSOrderDetailModel *detailModel;

+ (CGFloat)getCellHeight:(HSOrderDetailModel *)detailModel indexPath:(NSIndexPath *)indexPath;

@end

// 订单详情的子cell
@interface HSOrderDetailSubTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;
/* <#description#> */
@property (nonatomic,strong) HSOrderDetailSubModel *subModel;

@end

// 订单详情头部房源详情cell
@interface HSOrderDetailHouseTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@end














