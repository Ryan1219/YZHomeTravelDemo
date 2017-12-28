//
//  HSHomeViewController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSHomeViewController.h"
#import "HSDebugViewController.h"
#import "HSBaseListTableViewCell.h"
#import "HSFilterViewController.h"

@interface HSHomeViewController () <UITableViewDelegate,UITableViewDataSource>

/* <#description#> */
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HSHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Home";
    
    self.dataArray = [NSMutableArray array];
    
    [self navigationRight];
    
    [self configBaseTableView];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
}


//MARK:--Config navigationRight
- (void)navigationRight {
    
    UIButton *searchBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [searchBtn setTitle:@"S" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(clickSearchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
#if DEBUG_BUILD
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [searchBtn addGestureRecognizer:longPress];
#endif
    
//    UIButton *selectBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
//    [selectBtn setTitle:@"E" forState:UIControlStateNormal];
//    [selectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [selectBtn addTarget:self action:@selector(clickSelectBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *search = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
//    UIBarButtonItem *select = [[UIBarButtonItem alloc] initWithCustomView:selectBtn];
    
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = -10;
    self.navigationItem.rightBarButtonItems = @[space,search];
}


//MARK:--Action Method
- (void)clickSearchBtn:(UIButton *)sender {
    
}

//- (void)clickSelectBtn:(UIButton *)sender {
//
//}

- (void)longPress:(UILongPressGestureRecognizer *)gesture {
    HSDebugViewController *debugCtrl = [[HSDebugViewController alloc] init];
    [self.navigationController pushViewController:debugCtrl animated:true];
}


//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSBaseListTableViewCell *cell = [HSBaseListTableViewCell cellWithTableView:tableView];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    HSFilterViewController *filterCtrl = [[HSFilterViewController alloc] init];
    [self.navigationController pushViewController:filterCtrl animated:true];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [HSBaseListTableViewCell getCellHeight];
}



@end






























