//
//  HSShowBigImageController.h
//  HomeStay
//
//  Created by Ryan on 2017/12/21.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "MWPhotoBrowser.h"

@interface HSShowBigImageController : MWPhotoBrowser
/* 当前选择的index */
@property (nonatomic,assign) NSInteger selectCurrentIndex;
/* 标题 */
@property (nonatomic,copy) NSString *navTitle;


@end
