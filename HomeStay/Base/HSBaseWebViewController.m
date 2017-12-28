//
//  HSBaseWebViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/7.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSBaseWebViewController.h"

@interface HSBaseWebViewController () <UIWebViewDelegate>
/* UIWebView */
@property (nonatomic,strong) UIWebView *webView;
/* UIActivityIndicatorView */
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;
/* UIButton */
@property (nonatomic,strong) UIButton *dismissBtn;

@end

@implementation HSBaseWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.dismissBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 19)];
    [self.dismissBtn setImage:HSImage(@"common_dismiss") forState:UIControlStateNormal];
    [self.dismissBtn addTarget:self action:@selector(clickDismissActionBtn) forControlEvents:UIControlEventTouchUpInside];
    self.dismissBtn.hidden = true;
    UIBarButtonItem *dismiss = [[UIBarButtonItem alloc] initWithCustomView:self.dismissBtn];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = 50;
    
    self.navigationItem.leftBarButtonItems = @[space,dismiss];
    //
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.backgroundColor = AppBackgroundColor;
    self.webView.opaque = false;
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    //
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = CGPointMake(self.webView.center.x, self.webView.center.y - 30);
    [self.view addSubview:self.indicatorView];
    
    [self.indicatorView startAnimating];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.reqestUrl]]];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    self.webView.delegate = nil;
    [self.webView stopLoading];
    [self.webView removeFromSuperview];
    self.webView = nil;
    
    [self.indicatorView stopAnimating];
    [self.indicatorView removeFromSuperview];
    self.indicatorView = nil;
}

//MARK:--UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.indicatorView stopAnimating];
    if (!self.navigationItem.title) {
        NSString *title = [self.webView stringByEvaluatingJavaScriptFromString:@"document.title"];
        self.navigationItem.title = title;
    }
    
    if (self.webView.canGoBack) {
        self.dismissBtn.hidden = false;
    }
    else {
        self.dismissBtn.hidden = true;
    }
}

//MARK:--Action
- (void)clickDismissActionBtn {
    [self.navigationController popViewControllerAnimated:true];
}

//MARK:--clickNavigationLeftBackBtn
- (void)clickNavigationLeftBackBtn {
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
    else {
        [self.navigationController popViewControllerAnimated:true];
    }
}

@end




























