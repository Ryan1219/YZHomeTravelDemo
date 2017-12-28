//
//  HSFilterView.h
//  HomeStay
//
//  Created by Ryan on 2017/12/26.
//  Copyright © 2017年 Q房通. All rights reserved.
//  筛选封装

#import <UIKit/UIKit.h>


@interface HSFilterModel : NSObject

@property (nonatomic,copy) NSString *text;
@property (nonatomic,assign) BOOL isSelect;

@end






//MARK:--HSFilterCollectionViewCell
@interface HSFilterCollectionViewCell : UICollectionViewCell

@property (nonatomic,strong) HSFilterModel *filterModel;

@end






//MARK:--HSFilterView
typedef NS_ENUM(NSInteger,HSFilterViewStyle){
    HSFilterViewSingleChoice = 0,//单选
    HSFilterViewMultipleChoice //多选
};

@interface HSFilterView : UIView

/* 标题 */
@property (nonatomic,copy) NSString *title;
/* 数据源 */
@property (nonatomic,strong) NSArray<HSFilterModel *> *titleArray;
/* 选择类型 */
@property (nonatomic,assign) HSFilterViewStyle choiceStyle;
/* 数据回调 */
@property (nonatomic,copy) void (^filterViewChoiceBlock)(HSFilterView *filterView,NSArray *choiceArray);


@end











