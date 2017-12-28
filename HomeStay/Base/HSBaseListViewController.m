//
//  HSBaseListViewController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSBaseListViewController.h"

@interface HSBaseListViewController () 

@end

@implementation HSBaseListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.baseListArray = [NSMutableArray array];
    self.currentPage = 1; //默认给1
    
//    [self hideLine];
//    [self configBaseTableView];
//    self.baseTableView.delegate = self;
//    self.baseTableView.dataSource = self;
//
//    [self configHeaderRefresh];
//    [self configFooterRefresh];
//    self.baseTableView.mj_footer.hidden = true;
    
}

//MARK:--Network
- (void)requestWithPage:(NSInteger)page {
    
}

@end























































