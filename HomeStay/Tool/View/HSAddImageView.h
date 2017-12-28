//
//  HSAddImageView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/20.
//  Copyright © 2017年 Q房通. All rights reserved.
// 上次图片封装

#import <UIKit/UIKit.h>

@interface HSAddImageView : UIView

/* 数据源 */
@property (nonatomic,strong) NSMutableArray *dataArray;
/* 点击添加图片的回调 */
@property (nonatomic,copy) void (^clickAddActionInAddImageViewBlock)(HSAddImageView *view);
/* <#description#> */
@property (nonatomic,copy) void (^clickCellInAddImageViewBlock)(NSArray *imageArray,NSIndexPath *indexPath);

@end





@interface HSAddImageCollectionViewCell : UICollectionViewCell
/* UIImage */
@property (nonatomic,strong) UIImage *subImage;
/* 回调 */
@property (nonatomic,copy) void (^clickDeleteActionInAddImageCollectionViewCell)(HSAddImageCollectionViewCell *cell);

@end









