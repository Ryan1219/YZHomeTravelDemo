//
//  QFBaseViewController.h
//  Fanggs
//
//  Created by Q房通 on 2017/8/31.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HSBaseViewController : UIViewController

@property (nonatomic,strong) UITableView *baseTableView;

@property (nonatomic,assign) NSInteger currentPage; //当前页

// 添加列表TableView
- (void)configBaseTableView;
//隐藏列表界面不满一瓶最后一个cell的分割线
- (void)hiddleLastCellExtraLine:(UITableView *)tableView;
// 添加下拉刷新
- (void)configHeaderRefresh;
// 添加上拉刷新
- (void)configFooterRefresh;

// 网络请求
- (void)requestWithPage:(NSInteger)page;
//网络请求出错
- (void)requestError:(NSError *)error;

// 结束刷新
- (void)endRefresh;
// 结束刷新,最后的数据
- (void)endRefreshWithNoMoreData;

// 头部阴影
- (void)configTopBlurView;

// 隐藏导航栏的底部线条
- (void)showLine;
// 显示导航栏的底部线条
- (void)hideLine;

//导航栏左边的返回按钮事件
- (void)clickNavigationLeftBackBtn;

//友盟统计事件
- (void)sendEventId:(NSString *)eventId;

//显示无数据界面
- (void)showNoDataView;

//HUD
- (void)showLoading:(UIView *)view text:(NSString *)text;
- (void)hideLoading;
/*
 * 显示提醒信息，2S后自动隐藏
 * 所有HUD提示都用此函数，禁止自己定义MBHUD
 */
- (void)showToastText:(NSString *)text;
//显示图文HUD
-(void)showToastTextWithImage:(NSString*)text andStatus:(BOOL)status;

// 加大字体
- (void)largeFont;

//开启关闭侧滑
- (void)enabledInteractivePopGesture;
- (void)disabledInteractivePopGesture;


@end
