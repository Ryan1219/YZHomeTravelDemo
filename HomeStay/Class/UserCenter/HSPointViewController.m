//
//  HSPointViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/25.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSPointViewController.h"
#import "HSPointTableViewCell.h"

@interface HSPointViewController () <UITableViewDelegate,UITableViewDataSource>

/* \ */
@property (nonatomic,strong) UILabel *totalScoreLabel;

@end

@implementation HSPointViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"积分";
    
    [self hideLine];
    
    [self configBaseTableView];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    
    [self configHeadView];
    
//    [self requestWithPage:1];
    
}

//MARK:--configHeadView
- (void)configHeadView {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 90 + 90 + 12)];
    headView.backgroundColor = AppBackgroundColor;
    self.baseTableView.tableHeaderView = headView;
    
    UIView *greenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 150)];
    greenView.backgroundColor = HSColor(0x0B643B);
    [headView addSubview:greenView];
    //
    self.totalScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(18 * iPhone_6_Width_Zoom, 32, ScreenWidth - 36 * iPhone_6_Width_Zoom, 30)];
    self.totalScoreLabel.text = @"700";
    self.totalScoreLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    self.totalScoreLabel.textColor = Color_ffffff;
    self.totalScoreLabel.textAlignment = NSTextAlignmentLeft;
    [greenView addSubview:self.totalScoreLabel];
    
    UILabel *totalLabel = [[UILabel alloc] initWithFrame:CGRectMake(18 * iPhone_6_Width_Zoom, CGRectGetMaxY(self.totalScoreLabel.frame)+6, ScreenWidth - 36 * iPhone_6_Width_Zoom, 12)];
    totalLabel.text = @"总积分";
    totalLabel.font = HSFont(12);
    totalLabel.textColor = Color_ffffff;
    totalLabel.textAlignment = NSTextAlignmentLeft;
    [greenView addSubview:totalLabel];
    
    //
    UIView *whiteView = [[UIView alloc] initWithFrame:CGRectMake(18*iPhone_6_Width_Zoom, 90, ScreenWidth - 36*iPhone_6_Width_Zoom, 90)];
    whiteView.backgroundColor = Color_ffffff;
    whiteView.layer.cornerRadius = 4;
    whiteView.layer.masksToBounds = true;
    [headView addSubview:whiteView];
    
    UILabel *pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 16, ScreenWidth - 40, 12)];
    pointLabel.text = @"积分说明";
    pointLabel.font = HSFont(12);
    pointLabel.numberOfLines = 0;
    pointLabel.textColor = HSColor(0x333333);
    pointLabel.textAlignment = NSTextAlignmentLeft;
    [whiteView addSubview:pointLabel];
    
    UILabel *pointIntroLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(pointLabel.frame)+12, ScreenWidth - 40-36*iPhone_6_Width_Zoom, 14 * 2 + 6)];
    pointIntroLabel.text = @"积分是民宿好住用户在民宿好住网站及客户端预\n订、评价、参与活动给予的奖励。";
    pointIntroLabel.font = HSFont(11);
    pointIntroLabel.numberOfLines = 0;
    pointIntroLabel.textColor = HSColor(0x999999);
    pointIntroLabel.textAlignment = NSTextAlignmentLeft;
    pointIntroLabel.attributedText = [NSMutableAttributedString changeFontAndColor:HSFont(11) color:HSColor(0x999999) lineSpace:6 totalString:pointIntroLabel.text subStringArray:nil];
    [whiteView addSubview:pointIntroLabel];
    
}

//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSPointTableViewCell *cell = [HSPointTableViewCell cellWithTableView:tableView];
    if (indexPath.row == 0) {
        cell.isHide = false;
    }
    else {
        cell.isHide = true;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return [HSPointTableViewCell getCellHeight];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 60;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UILabel *pointLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, ScreenWidth, 20)];
    pointLabel.text = @"积分纪录(最近半年)";
    pointLabel.font = HSFont(14);
    pointLabel.textColor = HSColor(0x333333);
    pointLabel.textAlignment = NSTextAlignmentCenter;
    pointLabel.backgroundColor = Color_ffffff;
    
    return pointLabel;
}


//MARK:--Network
- (void)requestWithPage:(NSInteger)page {
    
    [self showLoading:self.view text:nil];
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
