//
//  HSProfileViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/7.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSProfileViewController.h"
#import "HSUserProfileTableViewCell.h"
#import "HSModifyNickNameController.h"

@interface HSProfileViewController () <UITableViewDelegate,UITableViewDataSource>
/* NSMutableArray */
@property (nonatomic,strong) NSMutableArray *leftArray;
@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HSProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人资料";
    
    self.leftArray = [NSMutableArray arrayWithObjects:@"头像",@"昵称",@"注册手机号",@"性别",@"真实姓名",@"身份证号", nil];
    self.dataArray = [NSMutableArray arrayWithObjects:@"张三",@"1314520",@"李四",@"4355555555555", nil];
    
    [self configBaseTableView];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
}

//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.leftArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSUserProfileTableViewCell *cell = [HSUserProfileTableViewCell cellWithTableView:tableView];
    cell.currentIndexPath = indexPath;
    cell.leftTitle = self.leftArray[indexPath.row];
    cell.rightTextArr = self.dataArray;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.row == 1) {
        HSModifyNickNameController *nickCtrl = [[HSModifyNickNameController alloc] init];
        nickCtrl.hidesBottomBarWhenPushed = true;
        [self.navigationController pushViewController:nickCtrl animated:true];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
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
