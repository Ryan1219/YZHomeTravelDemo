//
//  HSPointTableViewCell.h
//  HomeStay
//
//  Created by Ryan on 2017/12/25.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSPointTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;
//是否隐藏头部线条
@property (nonatomic,assign) BOOL isHide;

@end
