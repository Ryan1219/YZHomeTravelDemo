//
//  HSUnpayOrderTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUnpayOrderTableViewCell.h"
#import "HSDashLineView.h"

@interface HSUnpayOrderTableViewCell ()
/* 房名 */
@property (nonatomic,strong) UILabel *houseNameLabel;
/* 入住日期 */
@property (nonatomic,strong) UILabel *timeLabel;
/* 入住天数 */
@property (nonatomic,strong) UILabel *countLabel;
/* 总价格 */
@property (nonatomic,strong) UILabel *totalPriceLabel;
/* 房费 */
@property (nonatomic,strong) UILabel *housePriceLabel;
/* 押金 */
@property (nonatomic,strong) UILabel *depositLabel;
/* 线条 */
@property (nonatomic,strong) HSDashLineView *lineView;
/* 付款 */
@property (nonatomic,strong) UIButton *payBtn;
/* 取消订单 */
@property (nonatomic,strong) UIButton *cancelPayBtn;


@end

@implementation HSUnpayOrderTableViewCell


/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *UnpayOrderTableViewCellIndentifer = @"UnpayOrderTableViewCellIndentifer";
    HSUnpayOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UnpayOrderTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSUnpayOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UnpayOrderTableViewCellIndentifer];
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
    self.houseNameLabel = [[UILabel alloc] init];
    self.houseNameLabel.text = @"泸沽湖畔公寓A";
    self.houseNameLabel.font = HSFont(14);
    self.houseNameLabel.textColor = HSColor(0x333333);
    self.houseNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.houseNameLabel];
    //
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"2017-11-12至2017-11-20";
    self.timeLabel.font = HSFont(12);
    self.timeLabel.textColor = HSColor(0x666666);
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    //
    self.countLabel = [[UILabel alloc] init];
    self.countLabel.text = @"8晚";
    self.countLabel.font = HSFont(12);
    self.countLabel.textColor = HSColor(0x999999);
    self.countLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.countLabel];
    //
    self.lineView = [[HSDashLineView alloc] initWithFrame:CGRectZero];
    self.lineView.lineColor = Color_CCCCCC;
    [self.contentView addSubview:self.lineView];
    //
    self.totalPriceLabel = [[UILabel alloc] init];
    self.totalPriceLabel.text = @"¥400";
    self.totalPriceLabel.font = HSFont(14);
    self.totalPriceLabel.textColor = HSColor(0x333333);
    self.totalPriceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.totalPriceLabel];
    //
    self.housePriceLabel = [[UILabel alloc] init];
    self.housePriceLabel.text = @"房费: ¥200";
    self.housePriceLabel.font = HSFont(12);
    self.housePriceLabel.textColor = HSColor(0x999999);
    self.housePriceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.housePriceLabel];
    //
    self.depositLabel = [[UILabel alloc] init];
    self.depositLabel.text = @"押金: ¥200";
    self.depositLabel.font = HSFont(12);
    self.depositLabel.textColor = HSColor(0x999999);
    self.depositLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.depositLabel];
    //
    self.payBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.payBtn setTitle:@"付款" forState:UIControlStateNormal];
    [self.payBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.payBtn.titleLabel.font = HSFont(14);
    self.payBtn.backgroundColor = [UIColor greenColor];
    self.payBtn.layer.cornerRadius = 16;
    self.payBtn.layer.masksToBounds = true;
    [self.contentView addSubview:self.payBtn];
    //
    self.cancelPayBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.cancelPayBtn setTitle:@"取消订单" forState:UIControlStateNormal];
    [self.cancelPayBtn setTitleColor:HSColor(0x999999) forState:UIControlStateNormal];
    self.cancelPayBtn.titleLabel.font = HSFont(14);
    self.cancelPayBtn.backgroundColor = [UIColor whiteColor];
    self.cancelPayBtn.layer.cornerRadius = 16;
    self.cancelPayBtn.layer.masksToBounds = true;
    self.cancelPayBtn.layer.borderWidth = 1;
    self.cancelPayBtn.layer.borderColor = Color_CCCCCC.CGColor;
    [self.contentView addSubview:self.cancelPayBtn];
}

- (void)configConstraints {
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    //
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
    }];
    //
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
    }];
    //
    [self.totalPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(20);
    }];
    //
    [self.housePriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.totalPriceLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
    }];
    //
    [self.depositLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.housePriceLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
    }];
    //
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.countLabel.mas_bottom).offset(20);
        make.height.mas_equalTo(2);
    }];
    //
    [self.payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(32);
    }];
    //
    [self.cancelPayBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.payBtn.mas_left).offset(-20);
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(10);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(32);
    }];
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
