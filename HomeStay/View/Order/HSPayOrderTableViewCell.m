//
//  HSPayOrderTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/18.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSPayOrderTableViewCell.h"

@interface HSPayOrderTableViewCell ()
/* 沟沟图片 */
@property (nonatomic,strong) UIImageView *confirmImageView;
/* 订单号 */
@property (nonatomic,strong) UILabel *orderNumLabel;
/* 房费 */
@property (nonatomic,strong) UILabel *houseMoneyLabel;
/* 入住日期 */
@property (nonatomic,strong) UILabel *dateLabel;
/* 押金 */
@property (nonatomic,strong) UILabel *depositLabel;

@end

@implementation HSPayOrderTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *PayOrderTableViewCellIndentifer = @"PayOrderTableViewCellIndentifer";
    HSPayOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PayOrderTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSPayOrderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PayOrderTableViewCellIndentifer];
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
    self.confirmImageView = [[UIImageView alloc] init];
    self.confirmImageView.backgroundColor = [UIColor redColor];
    self.confirmImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.confirmImageView];
    //
    self.orderNumLabel = [[UILabel alloc] init];
    self.orderNumLabel.text = @"订单号: MM44643641313";
    self.orderNumLabel.font = HSFont(14);
    self.orderNumLabel.textColor = HSColor(0x999999);
    self.orderNumLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.orderNumLabel];
    //
    self.houseMoneyLabel = [[UILabel alloc] init];
    self.houseMoneyLabel.text = @"房费: ¥6000";
    self.houseMoneyLabel.font = HSFont(14);
    self.houseMoneyLabel.textColor = HSColor(0x999999);
    self.houseMoneyLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.houseMoneyLabel];
    //
    self.depositLabel = [[UILabel alloc] init];
    self.depositLabel.text = @"押金: ¥3000";
    self.depositLabel.font = HSFont(14);
    self.depositLabel.textColor = HSColor(0x999999);
    self.depositLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.depositLabel];
    //
    self.dateLabel = [[UILabel alloc] init];
    self.dateLabel.text = @"2017-12-18 2017-12-15";
    self.dateLabel.font = HSFont(14);
    self.dateLabel.textColor = HSColor(0x999999);
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.dateLabel];
    
    
    //
    [self.confirmImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(40);
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
    //
    [self.orderNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.confirmImageView.mas_right).offset(20);
        make.top.mas_equalTo(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(20);
        
    }];
    //
    [self.depositLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.confirmImageView.mas_right).offset(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(20);
    }];
    // 动态计算宽度
    NSString *houseMoneyStr = @"押金: ¥3000";
    CGFloat width = [houseMoneyStr sizeWithFont:HSFont(14) maxWidth:ScreenWidth/2].width;
    [self.depositLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.confirmImageView.mas_right).offset(20);
        make.centerY.mas_equalTo(self.confirmImageView.centerY);
        make.width.mas_equalTo(width);
    }];
    //
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.confirmImageView.centerY);
        make.left.mas_equalTo(self.depositLabel.mas_right);
    }];
}

+ (CGFloat)getCellHeight {
    
    return 100.0;
}

@end





//MARK:--支付方式
@interface HSPayTypeTableViewCell ()
/* payImageView */
@property (nonatomic,strong) UIImageView *payImageView;
/* payNameLabel */
@property (nonatomic,strong) UILabel *payNameLabel;
/* payDescripLabel */
@property (nonatomic,strong) UILabel *payDescripLabel;
/* arrowImageView */
@property (nonatomic,strong) UIImageView *arrowImageView;

@end

@implementation HSPayTypeTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *PayTypeTableViewCellCellIndentifer = @"PayTypeTableViewCellCellIndentifer";
    HSPayTypeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PayTypeTableViewCellCellIndentifer];
    if (!cell) {
        cell = [[HSPayTypeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PayTypeTableViewCellCellIndentifer];
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
    self.payImageView = [[UIImageView alloc] init];
    self.payImageView.backgroundColor = [UIColor redColor];
    self.payImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.payImageView];
    //
    self.payNameLabel = [[UILabel alloc] init];
    self.payNameLabel.text = @"微信支付";
    self.payNameLabel.font = HSFont(14);
    self.payNameLabel.textColor = HSColor(0x333333);
    self.payNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.payNameLabel];
    //
    self.payDescripLabel = [[UILabel alloc] init];
    self.payDescripLabel.text = @"推荐开通微信支付的用户使用";
    self.payDescripLabel.font = HSFont(14);
    self.payDescripLabel.textColor = HSColor(0x999999);
    self.payDescripLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.payDescripLabel];
    //
    self.arrowImageView = [[UIImageView alloc] init];
    self.arrowImageView.image = HSImage(@"usercenter_arrow");
    self.arrowImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.arrowImageView];
    
    //
    [self.payImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.centerY);
        make.width.height.mas_equalTo(32);
    }];
    //
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.centerY);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(24);
    }];
    //
    [self.payNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.payImageView.mas_right).offset(20);
        make.top.mas_equalTo(self.payImageView.mas_top);
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-5);
    }];
    //
    [self.payDescripLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.payImageView.mas_right).offset(20);
        make.bottom.mas_equalTo(self.payImageView.mas_bottom);
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-5);
    }];
}

+ (CGFloat)getCellHeight {
    
    return 44;
}


@end
