//
//  HSOrderDetailTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSOrderDetailTableViewCell.h"
//MARK:- 订单详情cell
@class HSOrderDetailSubTableViewCell;
@interface HSOrderDetailTableViewCell () <UITableViewDelegate,UITableViewDataSource>

/* 标题 */
@property (nonatomic,strong) UILabel *titleLabel;
/* UITableView */
@property (nonatomic,strong) UITableView *tableView;
/* 底部View */
@property (nonatomic,strong) UIView *bottomView;
/* lineView */
@property (nonatomic,strong) UIView *lineView;
/* 总费用 */
@property (nonatomic,strong) UILabel *totalPriceLabel;
/* 高度 */
@property (nonatomic,assign) CGFloat subCellHeight;


@end

@implementation HSOrderDetailTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *OrderDetailTableViewCellIndentifer = @"OrderDetailTableViewCellIndentifer";
    HSOrderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderDetailTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSOrderDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderDetailTableViewCellIndentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configLayout];
        [self configConstraints];
    }
    return self;
}

- (void)configLayout {
    //
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"费用信息";
    self.titleLabel.font = HSFont(14);
    self.titleLabel.textColor = HSColor(0x999999);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    //
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.tableView];
    //
    self.bottomView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.bottomView];
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = Color_CCCCCC;
    [self.bottomView addSubview:self.lineView];
    
    self.totalPriceLabel = [[UILabel alloc] init];
    self.totalPriceLabel.text = @"总额  ¥3600";
    self.totalPriceLabel.font = HSFont(14);
    self.totalPriceLabel.textColor = HSColor(0x999999);
    self.totalPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.bottomView addSubview:self.totalPriceLabel];
}

- (void)configConstraints {
    //
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    //
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(50);
    }];
    //
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.contentView);
        make.height.mas_equalTo(40);
    }];
    //
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.bottomView.mas_top);
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(1 * HSLineWidth);
    }];
    //
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.bottomView.mas_centerY);
        make.height.mas_equalTo(20);
    }];
}

//MARK:--UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  _detailModel.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSOrderDetailSubTableViewCell *cell = [HSOrderDetailSubTableViewCell cellWithTableView: tableView];
    cell.subModel = _detailModel.listArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}
//MARK:--Set Property
- (void)setDetailModel:(HSOrderDetailModel *)detailModel {
    _detailModel = detailModel;
    self.titleLabel.text = detailModel.title;
    [self.tableView reloadData];
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    _currentIndexPath = currentIndexPath;
    if (currentIndexPath.section == 0) {
        self.bottomView.hidden = false;
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-50);
        }];
    }
    else {
        self.bottomView.hidden = true;
        [self.tableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        }];
    }
}

+ (CGFloat)getCellHeight:(HSOrderDetailModel *)detailModel indexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 50 + detailModel.listArray.count * 30 + 10 + 40;
    }
    else {
        return 50 + detailModel.listArray.count * 30 + 10;
    }
}

@end




//MARK:- 订单详情的子cell
@interface HSOrderDetailSubTableViewCell ()
/* UILabel */
@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *rightLabel;

@end

@implementation HSOrderDetailSubTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *OrderDetailSubTableViewCellIndentifer = @"OrderDetailSubTableViewCellIndentifer";
    HSOrderDetailSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderDetailSubTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSOrderDetailSubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderDetailSubTableViewCellIndentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    //
    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.text = @"总额  ¥3600";
    self.leftLabel.font = HSFont(14);
    self.leftLabel.textColor = HSColor(0x333333);
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.leftLabel];
    //
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.text = @"总额  ¥3600";
    self.rightLabel.font = HSFont(14);
    self.rightLabel.textColor = HSColor(0x333333);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.rightLabel];
    
    //
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    //
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
}

- (void)setSubModel:(HSOrderDetailSubModel *)subModel {
    _subModel = subModel;
    self.leftLabel.text = subModel.leftTitle;
    self.rightLabel.text = subModel.rightTitle;
}
@end




//MARK:-订单详情头部房源详情cell
@interface HSOrderDetailHouseTableViewCell ()
/* 房源图片 */
@property (nonatomic,strong) UIImageView *houseImageView;
/* 房名 */
@property (nonatomic,strong) UILabel *houseNameLabel;
/* 描述 */
@property (nonatomic,strong) UILabel *descripLabel;
/* 时间 */
@property (nonatomic,strong) UIImageView *timeImageView;
/* 日期 */
@property (nonatomic,strong) UILabel *dateLabel;
/* 房源详情 */
@property (nonatomic,strong) UIImageView *addressImageView;
/* 地址 */
@property (nonatomic,strong) UILabel *addressLabel;

@end

@implementation HSOrderDetailHouseTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *OrderDetailHouseTableViewCellIndentifer = @"OrderDetailHouseTableViewCellIndentifer";
    HSOrderDetailHouseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderDetailHouseTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSOrderDetailHouseTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderDetailHouseTableViewCellIndentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    //
    self.houseImageView = [[UIImageView alloc] init];
    self.houseImageView.backgroundColor = [UIColor redColor];
    self.houseImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.houseImageView];
    //
    self.houseNameLabel = [[UILabel alloc] init];
    self.houseNameLabel.text = @"泸沽湖畔公寓A";
    self.houseNameLabel.font = HSFont(14);
    self.houseNameLabel.textColor = HSColor(0x333333);
    self.houseNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.houseNameLabel];
    //
    self.descripLabel = [[UILabel alloc] init];
    self.descripLabel.text = @"泸沽湖畔公寓A";
    self.descripLabel.font = HSFont(14);
    self.descripLabel.textColor = HSColor(0x999999);
    self.descripLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.descripLabel];
    //
    self.timeImageView = [[UIImageView alloc] init];
    self.timeImageView.backgroundColor = [UIColor redColor];
    self.timeImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.timeImageView];
    //
    self.addressImageView = [[UIImageView alloc] init];
    self.addressImageView.backgroundColor = [UIColor redColor];
    self.addressImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.addressImageView];
    //
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.text = @"2017-12-18 2017-12-15";
    self.dateLabel.font = HSFont(14);
    self.dateLabel.textColor = HSColor(0x333333);
    self.dateLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.dateLabel];
    //
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.text = @"泸沽湖畔公寓A";
    self.addressLabel.font = HSFont(14);
    self.addressLabel.textColor = HSColor(0x999999);
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.addressLabel];
    
    //
    [self.houseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(80);
        make.width.mas_equalTo(100);
    }];
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.houseImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.houseImageView.mas_top).offset(10);
        make.height.mas_equalTo(20);
    }];
    //
    [self.descripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.houseImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    //
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.houseImageView.mas_bottom).offset(10);
        make.height.width.mas_equalTo(24);
    }];
    //
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.timeImageView.centerY);
    }];
    //
    [self.addressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.timeImageView.mas_bottom).offset(10);
        make.height.width.mas_equalTo(24);
    }];
    //
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.addressImageView.centerY);
    }];
}

+ (CGFloat)getCellHeight {
    // 10 + 80 + 10 + 24 + 10 + 24 + 10;
    return 10 + 80 + 10 + 24 + 10 + 24 + 10;
}

@end





