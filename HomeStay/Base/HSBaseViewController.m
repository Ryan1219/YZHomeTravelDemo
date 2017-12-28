//
//  QFBaseViewController.m
//  Fanggs
//
//  Created by Q房通 on 2017/8/31.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSBaseViewController.h"
#import "AppDelegate.h"

@interface HSBaseViewController () <MBProgressHUDDelegate,UIGestureRecognizerDelegate>

@property (nonatomic,strong) MBProgressHUD *hud;

@end

@implementation HSBaseViewController

- (void) dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = AppBackgroundColor;
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:30],NSForegroundColorAttributeName:Color_333333}];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],NSForegroundColorAttributeName:Color_333333}];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self ;
    
    self.currentPage = 1;
    
    [self navigationStyle];
}

// 加大字体
- (void)largeFont {
    
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica-Bold" size:17],NSForegroundColorAttributeName:Color_333333}];
}


//MARK:-添加列表TableView
- (void)configBaseTableView {
    
    self.baseTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.baseTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.baseTableView.backgroundColor = AppBackgroundColor;
    [self.view addSubview:self.baseTableView];
    [self.baseTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(self.view);
    }];
    
    [self hiddleLastCellExtraLine:self.baseTableView];
    
}

//MARK:-configHeaderRefresh
- (void)configHeaderRefresh {
    
    WeakSelf
    //下拉刷新
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf requestWithPage:1];
    }];
//    [header setTitle:@"下拉加载更多" forState:MJRefreshStateIdle];
//    [header setTitle:@"松手立即加载" forState:MJRefreshStatePulling];
//    [header setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    header.stateLabel.hidden = true;
    header.lastUpdatedTimeLabel.hidden = true;
    self.baseTableView.mj_header.automaticallyChangeAlpha = true;
    self.baseTableView.mj_header = header;
}

//MARK:--configFooterRefresh
- (void)configFooterRefresh {
    
    WeakSelf
    //上拉刷新
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.currentPage += 1;
        [weakSelf requestWithPage:weakSelf.currentPage];
    }];
    [footer setTitle:@"点击或上拉加载更多" forState:MJRefreshStateIdle];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    [footer setTitle:@"没有更多数据了" forState:MJRefreshStateNoMoreData];
    self.baseTableView.mj_footer.automaticallyChangeAlpha = true;
    self.baseTableView.mj_footer = footer;
    
}

//MARK:- 网络请求
- (void)requestWithPage:(NSInteger)page {
    
}

//网络请求出错
- (void)requestError:(NSError *)error {
    if (!error) return;
    
    NSString *errorDescription = [error.userInfo objectForKey:@"NSLocalizedDescription"];
    NSString *errorCode = [error.userInfo objectForKey:@"code"];
    if (errorCode) { // 接口返回错误
        if ([errorCode isEqualToString:@"E0401"]) { // E0401
            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:nil
                                                                  message:errorDescription
                                                                 delegate:nil
                                                        cancelButtonTitle:@"知道了"
                                                        otherButtonTitles:nil, nil];
            [errorAlert show];
        } //账号在其它设备上登录 或者 没有登录，请重新登录
        else if ([HSNetworkMsgHander isNeedReLogin:errorCode]) {
            [self performSelector:@selector(gotoLoginPage) withObject:nil afterDelay:3.0];
        } //其他错误
        else {
            [self showToastText:errorDescription];
        }
    } // 网络错误
    else {
        [self showToastText:[HSNetworkMsgHander msgFromCode:error.code]];
    }
}


- (void)gotoLoginPage
{
    AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    if (delegate && [delegate respondsToSelector:@selector(logout)]) {
        [delegate performSelector:@selector(logout) withObject:nil];
    }
}

// 在AppDelegate有个logout方法

//MARK:- 结束刷新
- (void)endRefresh {
    
    [self.baseTableView.mj_header endRefreshing];
    [self.baseTableView.mj_footer endRefreshing];
}

// 结束刷新,最后的数据
- (void)endRefreshWithNoMoreData {
    [self.baseTableView.mj_footer endRefreshingWithNoMoreData];
}

//  头部阴影
- (void)configTopBlurView {
    UIImageView *distanceImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
    distanceImage.image = HSImage(@"quote_detail_shade");
    [self.view addSubview:distanceImage];
}

// 隐藏
- (void)showLine {
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
// 显示
- (void)hideLine {
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}


//MARK:--导航栏设置
- (void)navigationStyle {
    
    //状态栏白字
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.translucent = false;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:HSFont(17),NSForegroundColorAttributeName:HSColor(0x333333)}];
    
    if (self.navigationController.viewControllers.count > 1) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.bounds = CGRectMake(0, 0, 50, 44); //必须设置尺寸大小
        [btn setImage:[UIImage imageNamed:@"common_back_arrow"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        btn.imageEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    }
    
}

- (void)back {
    
    [self clickNavigationLeftBackBtn];
    
}

//MARK:-导航栏左边的返回按钮事件
- (void)clickNavigationLeftBackBtn {
    
     [self.navigationController popViewControllerAnimated:true];
}

//隐藏列表界面不满一瓶最后一个cell的分割线
- (void)hiddleLastCellExtraLine:(UITableView *)tableView {
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    UIView *view         = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

//友盟统计事件
- (void)sendEventId:(NSString *)eventId {
    if (eventId) {
        [MobClick event:eventId];
    }
}

//MARK:--HUD
- (void)showLoading:(UIView *)view text:(NSString *)text {
    
    if(!_hud){
        self.hud = [[MBProgressHUD alloc] initWithView:view];
        self.hud.delegate = self;
        [view addSubview:self.hud];
    }
    
    [view bringSubviewToFront:self.hud];
    self.hud.labelText = text;
    [self.hud show:YES];
}

- (void)hideLoading {
    
    [self.hud hide:true];
}

//MARK:--MBProgressHUDDelegate
- (void)hudWasHidden:(MBProgressHUD *)hud {
    
    self.hud.delegate = nil;
    [self.hud removeFromSuperview];
    self.hud = nil;
}


- (void)showToastText:(NSString *)text {
    if (![text isKindOfClass:[NSString class]] || [text isEqualToString:@""]) return;
    
    UIView *view = ((AppDelegate *)([UIApplication sharedApplication].delegate)).window;
    [MBProgressHUD showMessag:text
                       toView:view
                   afterDelay:2.0];
}


- (void)showToastTextWithImage:(NSString *)text andStatus:(BOOL)status {
    
    UIView *view = ((AppDelegate *)([UIApplication sharedApplication].delegate)).window;
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    
    UIImage *image = nil;
    if (YES == status) {
        image  = [[UIImage imageNamed:@"new_house_info_success"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else
    {
        image  = [[UIImage imageNamed:@"new_house_info_failed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }
    
    hud.customView = [[UIImageView alloc] initWithImage:image];
    hud.square = YES;
    hud.labelText = text;
    [hud hide:YES afterDelay:2.0f];
}


- (void)enabledInteractivePopGesture
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        //开启侧滑需要注意事项
        //在pushViewController的动画过程中激活滑动手势会导致卡死
        //在rootController下滑动的时候, 再push到下一个页面会卡死
        if (self.navigationController.viewControllers.count > 1) {
            self.navigationController.interactivePopGestureRecognizer.enabled = YES;
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
        }
        else
        {
            //modify by zhangliangwang
            //暂时屏蔽侧滑功能，侧滑会导致部分界面卡死，暂未找到问题所在
            //self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
}


- (void)disabledInteractivePopGesture
{
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

@end
















