//
//  HSFilterViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/26.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSFilterViewController.h"
#import "HSFilterView.h"

@interface HSFilterViewController ()

@end

@implementation HSFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *titleArr = [[NSArray alloc] initWithObjects:@"一居",@"二居",@"三居",@"四居及以上",@"一居",@"二居",@"三居", nil];
    NSMutableArray *tempArr = [NSMutableArray array];
    for (NSInteger i = 0; i < titleArr.count; i++) {
        HSFilterModel *filterModel = [[HSFilterModel alloc] init];
        filterModel.text = titleArr[i];
        filterModel.isSelect = false;
        [tempArr addObject:filterModel];
    }
    
    HSFilterView *filterView = [[HSFilterView alloc] initWithFrame:CGRectZero];
    filterView.choiceStyle = HSFilterViewSingleChoice;
    filterView.title = @"居室";
    filterView.titleArray = tempArr;
    [self.view addSubview:filterView];
    [filterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(60 + 32*2 + 20 + 20);
    }];
    filterView.filterViewChoiceBlock = ^(HSFilterView *filterView, NSArray *choiceArray) {
        for (HSFilterModel *filterModel in choiceArray) {
            NSLog(@"---%@",filterModel.text);
        }
        NSLog(@"----%zd",choiceArray.count);
    };
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
