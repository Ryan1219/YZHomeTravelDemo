//
//  HSSettingViewController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSSettingViewController.h"
#import "HSHouseResourceDetailController.h"
#import "HSCollectViewController.h"
#import "HSPhoneLoginViewController.h"
#import "HSChangePasswordController.h"
#import "HSUserCenterSetPsdController.h"
#import "HSFeedBackViewController.h"
#import "HSPointViewController.h"

@interface HSSettingViewController () <UITableViewDelegate,UITableViewDataSource>
/* 数据源 */
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HSSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"设置";
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"账户",@"提醒方式",@"清理缓存",@"意见反馈",@"关于民宿好住",@"退出", nil];
    
    [self configBaseTableView];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;

}

//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"settingCellIndentifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"settingCellIndentifier"];
    }
    
    cell.textLabel.text = self.dataArray[indexPath.section];
    cell.textLabel.font = HSFont(14);
    if (indexPath.section == 2) {
        cell.detailTextLabel.text = @"20M";
    }
    if (indexPath.section == 2 || indexPath.section == 5) {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    if (indexPath.section == 1 || indexPath.section == 3) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 43.5, ScreenWidth, 0.5)];
        lineView.backgroundColor = AppBackgroundColor;
        [cell.contentView addSubview:lineView];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    if (indexPath.section == 0) {
        HSHouseResourceDetailController *houseDetailCtrl = [[HSHouseResourceDetailController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    else if (indexPath.section == 1) {
        HSCollectViewController *houseDetailCtrl = [[HSCollectViewController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    else if (indexPath.section == 2) {

//        HSUserCenterSetPsdController *houseDetailCtrl = [[HSUserCenterSetPsdController alloc] init];
//        houseDetailCtrl.hidesBottomBarWhenPushed = true;
//        [self.navigationController pushViewController:houseDetailCtrl animated:true];
        
        HSPointViewController *houseDetailCtrl = [[HSPointViewController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    else if (indexPath.section == 3) {
        HSFeedBackViewController *houseDetailCtrl = [[HSFeedBackViewController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    else if (indexPath.section == 4) {
        HSChangePasswordController *houseDetailCtrl = [[HSChangePasswordController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    else if (indexPath.section == 5) {
        HSPhoneLoginViewController *houseDetailCtrl = [[HSPhoneLoginViewController alloc] init];
        houseDetailCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:houseDetailCtrl animated:true];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1 || section == 3 || section == 5) {
        return 10;
    }
    else {
        return 0.0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 0 || section == 1 || section == 3 || section == 5) {
        CGRect aRect = CGRectMake(0, 0, ScreenWidth, 10);
        UIView *backView = [[UIView alloc] initWithFrame:aRect];
        backView.backgroundColor = AppBackgroundColor;
        return backView;
    }
    else {
        return nil;
    }
}


@end


































