//
//  HSHouseDetailTableViewCell.h
//  HomeStay
//
//  Created by Ryan on 2017/12/18.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSHouseDetailTableViewCell : UITableViewCell

@end





//MARK:--你可能喜欢
@interface HSYouMayLikeTableViewCell : UICollectionViewCell

@end





//MARK:--入住需知cell
@interface HSCheckInTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@end


//MARK:--入住需知的子cell
@interface HSCheckInSubTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@end





//MARK:--详情评论cell
@interface HSCommentTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

+ (CGFloat)getCellHeight;

@property (nonatomic,copy) void (^clickShowAllCommentTableViewCellBlock)(BOOL isClick);

@end




























