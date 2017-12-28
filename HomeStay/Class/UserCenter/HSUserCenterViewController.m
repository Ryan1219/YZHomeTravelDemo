//
//  HSUserCenterViewController.m
//  HomeStay
//
//  Created by Q房通 on 2017/11/29.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUserCenterViewController.h"
#import "HSSettingViewController.h"
#import "HSUserCenterTableViewCell.h"
#import "HSUnpayOrderTableViewCell.h"
#import "HSOrderDetailModel.h"
#import "HSOrderDetailTableViewCell.h"
#import "HSProfileViewController.h"

@interface HSUserCenterViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIButton *headImageBtn;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@end

@implementation HSUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"个人中心";
    
    [self hideLine];
    
    self.dataArray = [NSMutableArray array];
    
    [self navigationRight];
    
//    [self configFakeData];

    [self configBaseTableView];
    self.baseTableView.delegate = self;
    self.baseTableView.dataSource = self;
    
    [self configHeadView];

}
//MARK:--navigationRight
- (void)navigationRight {
    
    UIButton *searchBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
    searchBtn.backgroundColor = [UIColor redColor];
    [searchBtn setTitle:@"title" forState:UIControlStateNormal];
    [searchBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(clickSettingAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
}

- (void)configHeadView {
    
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 95 + 60 + 10)];
    headView.backgroundColor = Color_ffffff;
    self.baseTableView.tableHeaderView = headView;
    
    // greenView
    UIView *greenView = [[UIView alloc] init];
    greenView.backgroundColor = HSColor(0x0B643B);
    [headView addSubview:greenView];
    //头像
    self.headImageBtn =[[UIButton alloc] initWithFrame:CGRectMake(0, 6, 70, 70)];
    self.headImageBtn.backgroundColor = [UIColor redColor];
    self.headImageBtn.layer.cornerRadius = 35;
    self.headImageBtn.layer.masksToBounds = true;
    [self.headImageBtn addTarget:self action:@selector(clickHeadImageAction:) forControlEvents:UIControlEventTouchUpInside];
    [greenView addSubview:self.headImageBtn];
    //名字
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"Keep Move";
    self.nameLabel.font = HSFont(14);
    self.nameLabel.textColor = [UIColor redColor];
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    [greenView addSubview:self.nameLabel];
    //号码
    self.phoneLabel = [[UILabel alloc] init];
    self.phoneLabel.text = @"137****5555";
    self.phoneLabel.font = HSFont(14);
    self.phoneLabel.textColor = [UIColor redColor];
    self.phoneLabel.textAlignment = NSTextAlignmentLeft;
    [greenView addSubview:self.phoneLabel];
    //箭头
    UIButton *arrowBtn = [[UIButton alloc] init];
    arrowBtn.backgroundColor = [UIColor redColor];
    [arrowBtn setImage:HSImage(@"") forState:UIControlStateNormal];
    [arrowBtn addTarget:self action:@selector(clickArrowAction:) forControlEvents:UIControlEventTouchUpInside];
    [greenView addSubview:arrowBtn];
    
    //
    [greenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(95);
    }];
    //
    [self.headImageBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(70);
        make.centerY.mas_equalTo(greenView.centerY);
    }];
    //
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageBtn.mas_right).offset(10);
        make.centerY.mas_equalTo(self.headImageBtn.centerY).offset(-6-10);
        make.right.mas_equalTo(-18*iPhone_6_Width_Zoom - 14);
        make.height.mas_equalTo(20);
    }];
    //
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageBtn.mas_right).offset(10);
        make.centerY.mas_equalTo(self.headImageBtn.centerY).offset(16);
        make.right.mas_equalTo(-18*iPhone_6_Width_Zoom - 14);
        make.height.mas_equalTo(20);
    }];
    //
    [arrowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-18*iPhone_6_Width_Zoom);
        make.width.mas_equalTo(7);
        make.height.mas_equalTo(14);
        make.centerY.mas_equalTo(self.headImageBtn.centerY);
    }];
    
    // 收藏房源 我的积分 我的评价
    CGFloat btnW = ScreenWidth/3;
    CGFloat btnH = 60;
    NSArray *upArray = @[@"20",@"100",@"20"];
    NSArray *downArray = @[@"收藏房源",@"我的积分",@"我的评价"];
    for (NSInteger i = 0; i < downArray.count; i++) {
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectZero];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(clickTagAction:) forControlEvents:UIControlEventTouchUpInside];
        [headView addSubview:btn];
        
        UILabel *upLabel = [[UILabel alloc] init];
        upLabel.tag = 2000;
        upLabel.text = [NSString stringWithFormat:@"%@",upArray[i]];
        upLabel.font = HSFont(12);
        upLabel.textColor = Color_333333;
        upLabel.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:upLabel];
        
        UILabel *downLabel = [[UILabel alloc] init];
        downLabel.tag = 3000;
        downLabel.text = [NSString stringWithFormat:@"%@",downArray[i]];
        downLabel.font = HSFont(12);
        downLabel.textColor = Color_999999;
        downLabel.textAlignment = NSTextAlignmentCenter;
        [btn addSubview:downLabel];
       
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(i * btnW);
            make.top.mas_equalTo(greenView.mas_bottom);
            make.width.mas_equalTo(btnW);
            make.height.mas_equalTo(btnH);
        }];
        
        [upLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(btnW);
            make.centerY.mas_equalTo(btn.centerY).offset(-6-8);
        }];
        
        [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.width.mas_equalTo(btnW);
            make.centerY.mas_equalTo(btn.centerY).offset(6+7);
        }];
        
    }
    
    // grayView
    UIView *grayView = [[UIView alloc] init];
    grayView.backgroundColor = AppBackgroundColor;
    [headView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(10);
        make.top.mas_equalTo(greenView.mas_bottom).offset(60);
    }];
    
}

//- (void)configFakeData {
//
//    HSOrderDetailModel *model1 = [[HSOrderDetailModel alloc] init];
//    model1.title = @"费用信息";
//    NSMutableArray *temp1 = [NSMutableArray array];
//    for (NSInteger i = 0; i < 2; i++) {
//        HSOrderDetailSubModel *subModel = [[HSOrderDetailSubModel alloc] init];
//        if (i == 0) {
//            subModel.leftTitle = @"房费";
//            subModel.rightTitle = @"¥2400";
//        } else {
//            subModel.leftTitle = @"押金";
//            subModel.rightTitle = @"¥1200";
//        }
//        [temp1 addObject:subModel];
//    }
//    model1.listArray = temp1;
//
//    HSOrderDetailModel *model2 = [[HSOrderDetailModel alloc] init];
//    model2.title = @"入住人信息";
//    NSMutableArray *temp2 = [NSMutableArray array];
//    for (NSInteger i = 0; i < 2; i++) {
//        HSOrderDetailSubModel *subModel = [[HSOrderDetailSubModel alloc] init];
//        if (i == 0) {
//            subModel.leftTitle = @"张三";
//            subModel.rightTitle = @"42112564613131611";
//        } else {
//            subModel.leftTitle = @"李四";
//            subModel.rightTitle = @"43112556746134613";
//        }
//        [temp2 addObject:subModel];
//    }
//    model2.listArray = temp2;
//
//    HSOrderDetailModel *model3 = [[HSOrderDetailModel alloc] init];
//    model3.title = @"预定人信息";
//    NSMutableArray *temp3 = [NSMutableArray array];
//    for (NSInteger i = 0; i < 2; i++) {
//        HSOrderDetailSubModel *subModel = [[HSOrderDetailSubModel alloc] init];
//        if (i == 0) {
//            subModel.leftTitle = @"张三";
//            subModel.rightTitle = @"137145632135";
//        } else {
//            subModel.leftTitle = @"李四";
//            subModel.rightTitle = @"152463546562";
//        }
//        [temp3 addObject:subModel];
//    }
//    model3.listArray = temp3;
//
//    [self.dataArray addObject:model1];
//    [self.dataArray addObject:model2];
//    [self.dataArray addObject:model3];
//
//
//}

//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return self.dataArray.count;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
//    HSUnpayOrderTableViewCell *cell = [HSUnpayOrderTableViewCell cellWithTableView:tableView];
    //
    HSUserCenterTableViewCell *cell = [HSUserCenterTableViewCell cellWithTableView:tableView];
    
//    HSOrderDetailTableViewCell *cell = [HSOrderDetailTableViewCell cellWithTableView:tableView];
//    cell.currentIndexPath = indexPath;
//    cell.detailModel = self.dataArray[indexPath.section];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];

//    HSProfileViewController *profileCtrl = [[HSProfileViewController alloc] init];
//    profileCtrl.hidesBottomBarWhenPushed = true;
//    [self.navigationController pushViewController:profileCtrl animated:true];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    return 10 + 20 + 10 + 16 + 10 + 16 + 20 + 2 + 52;
        return 100;
//    HSOrderDetailModel *detailModel = self.dataArray[indexPath.section];
//    return [HSOrderDetailTableViewCell getCellHeight:detailModel indexPath:indexPath];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//
//    return 10;
//}
//
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//
//    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 10)];
//    backView.backgroundColor = AppBackgroundColor;
//    return backView;
//}


//MARK:--Action
- (void)clickSettingAction {
    
    HSSettingViewController *settingCtrl = [[HSSettingViewController alloc] init];
    [self.navigationController pushViewController:settingCtrl animated:true];
}


- (void)clickHeadImageAction:(UIButton *)sender {
    
    HSProfileViewController *profileCtrl = [[HSProfileViewController alloc] init];
    [self.navigationController pushViewController:profileCtrl animated:true];
}

- (void)clickTagAction:(UIButton *)sender {
    
     NSLog(@"----%zd",sender.tag);
}


- (void)clickArrowAction:(UIButton *)sender {
    
    HSProfileViewController *profileCtrl = [[HSProfileViewController alloc] init];
    [self.navigationController pushViewController:profileCtrl animated:true];
}

@end


























