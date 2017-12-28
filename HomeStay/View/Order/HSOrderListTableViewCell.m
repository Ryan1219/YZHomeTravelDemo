//
//  HSOrderTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSOrderListTableViewCell.h"

@interface HSOrderListTableViewCell ()
/* houseImage */
@property (nonatomic,strong) UIImageView *houseImageView;
/* houseNameLabel */
@property (nonatomic,strong) UILabel *houseNameLabel;
/* timeLabel */
@property (nonatomic,strong) UILabel *timeLabel;
/* priceLabel */
@property (nonatomic,strong) UILabel *priceLabel;
/* commentBtn */
@property (nonatomic,strong) UIButton *commentBtn;

@end

@implementation HSOrderListTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *OrderTableViewCellIndentifer = @"OrderTableViewCellIndentifer";
    HSOrderListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:OrderTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSOrderListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:OrderTableViewCellIndentifer];
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
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"2017-11-12至2017-11-20 8晚";
    self.timeLabel.font = HSFont(12);
    self.timeLabel.textColor = HSColor(0x999999);
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    //
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.text = @"¥3600";
    self.priceLabel.font = HSFont(12);
    self.priceLabel.textColor = HSColor(0x999999);
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.priceLabel];
    //
    self.commentBtn = [[UIButton alloc] init];
    [self.commentBtn setTitle:@"评价订单" forState: UIControlStateNormal];
    [self.commentBtn setTitleColor:Color_a71a1a forState:UIControlStateNormal];
    self.commentBtn.titleLabel.font = HSFont(14);
    self.commentBtn.layer.cornerRadius = 4;
    self.commentBtn.layer.masksToBounds = true;
    self.commentBtn.layer.borderWidth = 1;
    self.commentBtn.layer.borderColor = Color_a71a1a.CGColor;
    [self.commentBtn addTarget:self action:@selector(clickCommentAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.commentBtn];
    
    //
    [self.houseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(10);
        make.width.mas_equalTo(100);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10);
    }];
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.houseImageView.mas_top);
        make.left.mas_equalTo(self.houseImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    //
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.houseImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    //
    CGSize commentSize = [self.commentBtn.titleLabel.text sizeWithFont:HSFont(14) maxWidth:ScreenWidth/2];
    [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * iPhone_6_Width_Zoom);
        make.bottom.mas_equalTo(self.houseImageView.mas_bottom);
        make.width.mas_equalTo(commentSize.width + 20);
        make.height.mas_equalTo(24);
    }];
    //
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.houseImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.timeLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(self.commentBtn.mas_left);
    }];
    
}


- (void)clickCommentAction:(UIButton *)sender {
    
    NSLog(@"----comment---");
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
