//
//  HSOrderDetailModel.h
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSResultsBase.h"

@interface HSOrderDetailModel : HSResultsBase
/* title */
@property (nonatomic,copy) NSString *title;
/* dataArray */
@property (nonatomic,strong) NSArray *listArray;

@end

@interface HSOrderDetailSubModel : NSObject
/* NSString */
@property (nonatomic,copy) NSString *leftTitle;
@property (nonatomic,copy) NSString *rightTitle;

@end
