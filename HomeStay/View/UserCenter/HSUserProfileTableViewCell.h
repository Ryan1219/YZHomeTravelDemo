//
//  HSUserCenterTableViewCell.h
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSUserProfileTableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

/* currentIndexPath */
@property (nonatomic,strong) NSIndexPath *currentIndexPath;
/* NSString */
@property (nonatomic,copy) NSString *leftTitle;
@property (nonatomic,strong) NSArray *rightTextArr;

@end
