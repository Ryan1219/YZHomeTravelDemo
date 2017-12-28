//
//  HSPointTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/25.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSPointTableViewCell.h"

@interface HSPointTableViewCell ()

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) UILabel *pointLabel;
@property (nonatomic,strong) UIView *bottomLineView;
@property (nonatomic,strong) UIView *headLineView;

@end

@implementation HSPointTableViewCell



/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *PointTableViewCellIndentifer = @"PointTableViewCellIndentifer";
    HSPointTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PointTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSPointTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:PointTableViewCellIndentifer];
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
    self.headLineView = [[UIView alloc] init];
    self.headLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.headLineView];
    //
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"评价订单";
    self.titleLabel.font = HSFont(14);
    self.titleLabel.textColor = HSColor(0x333333);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    //
    self.subTitleLabel = [[UILabel alloc] init];
    self.subTitleLabel.text = @"好评得积分";
    self.subTitleLabel.font = HSFont(14);
    self.subTitleLabel.textColor = HSColor(0x999999);
    self.subTitleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.subTitleLabel];
    //
    self.pointLabel = [[UILabel alloc] init];
    self.pointLabel.text = @"+5";
    self.pointLabel.font = HSFont(14);
    self.pointLabel.textColor = [UIColor redColor];
    self.pointLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.pointLabel];
    //
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.bottomLineView];
    
    //
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    //
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    //
    [self.pointLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
    //
    [self.headLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(1 * HSLineWidth);
        make.top.mas_equalTo(self.contentView.mas_top);
    }];
    //
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(1 * HSLineWidth);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
}

+ (CGFloat)getCellHeight {
    return 20 + 20 + 10  + 20 + 20;
}

- (void)setIsHide:(BOOL)isHide {
    _isHide = isHide;
    if (isHide) {
        self.headLineView.hidden = true;
    }
    else {
        self.headLineView.hidden = false;
    }
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
