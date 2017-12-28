//
//  HSOrderView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/14.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSOrderCollectionViewCell : UICollectionViewCell
/* 退订说明 */
@property (nonatomic,copy) NSString *content;
/* 是否隐藏最后一个 */
@property (nonatomic,assign) BOOL isHide;
/* <#description#> */
@property (nonatomic,strong) NSIndexPath *currentIndexPath;

@end





@interface HSOrderView : UIView
/* <#description#> */
@property (nonatomic,assign) CGFloat cellHeight;
/* NSArray */
@property (nonatomic,strong) NSArray *dataArray;

@end
