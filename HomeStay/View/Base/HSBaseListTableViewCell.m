//
//  HSBaseListTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/13.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSBaseListTableViewCell.h"
#import "HSStarView.h"

@interface HSBaseListTableViewCell ()
/* 房图 */
@property (nonatomic,strong) UIImageView *houseImage;
/* 房名 */
@property (nonatomic,strong) UILabel *houseNameLabel;
/* 价格 */
@property (nonatomic,strong) UILabel *priceLable;
//
@property (nonatomic,strong) UIView *fLineView;
@property (nonatomic,strong) UIView *sLineView;
@property (nonatomic,strong) UIView *tLineView;
@property (nonatomic,strong) UIView *bottomLineView;
/* 地图图片 */
@property (nonatomic,strong) UIImageView *addressImageView;
/* 地名 */
@property (nonatomic,strong) UILabel *addressLabel;
/* 房屋类型 */
@property (nonatomic,strong) UILabel *houseTypeLabel;
/* 可以入住人数 */
@property (nonatomic,strong) UILabel *personLabel;
/* 评论星星 */
@property (nonatomic,strong) HSStarView *starView;
/* 分数 */
@property (nonatomic,strong) UILabel *scoreLabel;
/* 住过的总人数 */
@property (nonatomic,strong) UILabel *historyLabel;
/* 评论总数 */
@property (nonatomic,strong) UILabel *commentCountLabel;

@end

@implementation HSBaseListTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *BaseListTableViewCellIndentifer = @"BaseListTableViewCellIndentifer";
    HSBaseListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BaseListTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSBaseListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:BaseListTableViewCellIndentifer];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configLayout];
        [self configConstraint];
    }
    return self;
}

- (void)configLayout {
    //
    self.houseImage = [[UIImageView alloc] init];
    self.houseImage.backgroundColor = [UIColor redColor];
    self.houseImage.userInteractionEnabled = true;
    self.houseImage.layer.cornerRadius = 6;
    self.houseImage.layer.masksToBounds = true;
    [self.contentView addSubview:self.houseImage];
    //
    self.houseNameLabel = [[UILabel alloc] init];
    self.houseNameLabel.text = @"泸沽湖畔——居民宿舍";
    self.houseNameLabel.font = HSFont(16);
    self.houseNameLabel.textColor = HSColor(0x333333);
    self.houseNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.houseNameLabel];
    //
    self.priceLable = [[UILabel alloc] init];
    self.priceLable.text = @"¥328";
    self.priceLable.font = HSFont(16);
    self.priceLable.textColor = HSColor(0xa71a1a);
    self.priceLable.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.priceLable];
    //
    self.addressImageView = [[UIImageView alloc] init];
    self.addressImageView.backgroundColor = [UIColor redColor];
    self.addressImageView.image = HSImage(@"");
    self.addressImageView.userInteractionEnabled = true;
    [self.contentView addSubview:self.addressImageView];
    //
    self.addressLabel = [[UILabel alloc] init];
    self.addressLabel.text = @"大理";
    self.addressLabel.font = HSFont(12);
    self.addressLabel.textColor = HSColor(0x999999);
    self.addressLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.addressLabel];
    //
    self.fLineView = [[UIView alloc] init];
    self.fLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.fLineView];
    //
    self.houseTypeLabel = [[UILabel alloc] init];
    self.houseTypeLabel.text = @"2居30平";
    self.houseTypeLabel.font = HSFont(12);
    self.houseTypeLabel.textColor = HSColor(0x999999);
    self.houseTypeLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.houseTypeLabel];
    //
    self.sLineView = [[UIView alloc] init];
    self.sLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.sLineView];
    //
    self.personLabel = [[UILabel alloc] init];
    self.personLabel.text = @"2人";
    self.personLabel.font = HSFont(12);
    self.personLabel.textColor = HSColor(0x999999);
    self.personLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.personLabel];
    //
    self.starView = [[HSStarView alloc] initWithFrame:CGRectZero];
//    self.starView.backgroundColor = [UIColor redColor];
    self.starView.score = 0.5;
    self.starView.allowIncompleteStar = true;
    [self.contentView addSubview:self.starView];
//    self.starView.scoreDidChangeBlock = ^(HSStarView *starView, CGFloat score) {
//        NSLog(@"----%.2f-",score);
//    };
    //
    self.scoreLabel = [[UILabel alloc] init];
    self.scoreLabel.text = @"4.7分";
    self.scoreLabel.font = HSFont(12);
    self.scoreLabel.textColor = HSColor(0xa71a1a);
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.scoreLabel];
    //
    self.historyLabel = [[UILabel alloc] init];
    self.historyLabel.text = @"300人住过";
    self.historyLabel.font = HSFont(12);
    self.historyLabel.textColor = HSColor(0x999999);
    self.historyLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.historyLabel];
    //
    self.tLineView = [[UIView alloc] init];
    self.tLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.tLineView];
    //
    self.commentCountLabel = [[UILabel alloc] init];
    self.commentCountLabel.text = @"120条评价";
    self.commentCountLabel.font = HSFont(12);
    self.commentCountLabel.textColor = HSColor(0x999999);
    self.commentCountLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.commentCountLabel];
    //
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:self.bottomLineView];
}

- (void)configConstraint {
    //
    [self.houseImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(18);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(192);
    }];
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.houseImage.mas_bottom).offset(12);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom - 80);
        make.height.mas_equalTo(20);
    }];
    //
    [self.priceLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.houseImage.mas_bottom).offset(12);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(80);
    }];
    //
    [self.addressImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(12);
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.width.mas_equalTo(9);
        make.height.mas_equalTo(12);
    }];
    //
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressImageView.mas_right).offset(6);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(12);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(60);
    }];
    //
    [self.fLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.addressLabel.mas_right).offset(11);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(12);
        make.width.mas_equalTo(1 * HSLineWidth);
        make.height.mas_equalTo(12);
    }];
    //
    [self.houseTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.fLineView.mas_right).offset(11);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(12);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(80);
    }];
    //
    [self.sLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.houseTypeLabel.mas_right).offset(11);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(12);
        make.width.mas_equalTo(1 * HSLineWidth);
        make.height.mas_equalTo(12);
    }];
    //
    [self.personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sLineView.mas_right).offset(10);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(120);
    }];
    //
    [self.starView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.width.mas_equalTo(5 * 16);
        make.height.mas_equalTo(12);
        make.top.mas_equalTo(self.addressImageView.mas_bottom).offset(12);
    }];
    //
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.starView.mas_right).offset(11);
        make.top.mas_equalTo(self.addressImageView.mas_bottom).offset(12);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(40);
    }];
    //
    [self.historyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.scoreLabel.mas_right).offset(11);
        make.top.mas_equalTo(self.addressImageView.mas_bottom).offset(12);
        make.height.mas_equalTo(12);
        make.width.mas_equalTo(80);
    }];
    //
    [self.tLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.historyLabel.mas_right).offset(11);
        make.top.mas_equalTo(self.addressImageView.mas_bottom).offset(12);
        make.width.mas_equalTo(1 * HSLineWidth);
        make.height.mas_equalTo(12);
    }];
    //
    [self.commentCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.tLineView.mas_right).offset(10);
        make.top.mas_equalTo(self.addressImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(16);
        make.width.mas_equalTo(120);
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
    
    return 18 + 192 + 12 + 20 + 12*4 + 18;
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
