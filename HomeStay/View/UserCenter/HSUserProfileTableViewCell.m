//
//  HSUserCenterTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUserProfileTableViewCell.h"

@interface HSUserProfileTableViewCell ()

/* leftLabel */
@property (nonatomic,strong) UILabel *leftLabel;
/* rightLabel */
@property (nonatomic,strong) UILabel *rightLabel;
/* headImageView */
@property (nonatomic,strong) UIImageView *headImageView;
/* arrowImageView */
@property (nonatomic,strong) UIImageView *arrowImageView;
/* sexImageView */
@property (nonatomic,strong) UIImageView *sexImageView;


@end

@implementation HSUserProfileTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *UserProfileTableViewCellIndentifer = @"UserProfileTableViewCellIndentifer";
    HSUserProfileTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserProfileTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSUserProfileTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserProfileTableViewCellIndentifer];
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
    self.arrowImageView = [[UIImageView alloc] init];
    self.arrowImageView.image = HSImage(@"usercenter_arrow");
    [self.contentView addSubview:self.arrowImageView];
    //
    self.headImageView = [[UIImageView alloc] init];
    self.headImageView.backgroundColor = [UIColor redColor];
    self.headImageView.userInteractionEnabled = true;
    self.headImageView.layer.cornerRadius = 30;
    self.headImageView.layer.masksToBounds = true;
    self.headImageView.hidden = true;
    [self.contentView addSubview:self.headImageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeadImageAction:)];
    [self.headImageView addGestureRecognizer:tap];
    //
    self.sexImageView = [[UIImageView alloc] init];
    self.sexImageView.image = HSImage(@"usercenter_sex_man");
    self.sexImageView.hidden = true;
    [self.contentView addSubview:self.sexImageView];
    //
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.font = HSFont(14);
    self.rightLabel.textColor = HSColor(0x999999);
    self.rightLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.rightLabel];
    //
    self.leftLabel = [[UILabel alloc] init];
    self.leftLabel.font = HSFont(14);
    self.leftLabel.textColor = HSColor(0x333333);
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.leftLabel];
    //
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = HSColor(0xcccccc);
    [self.contentView addSubview:lineView];
    
    //
    [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(24);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    //
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-24 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(60);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    //
    [self.sexImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-24 * iPhone_6_Width_Zoom);
        make.width.height.mas_equalTo(30);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    //
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    //
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.arrowImageView.mas_left).offset(-24 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.left.mas_equalTo(self.leftLabel.mas_right).offset(5);
    }];
    //
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(1 * HSLineWidth);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
    }];
    
}

//MARK:--Set property
- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    _currentIndexPath = currentIndexPath;
    if (currentIndexPath.row == 0) {
        self.headImageView.hidden = false;
        self.rightLabel.hidden = true;
    }
    else if (currentIndexPath.row == 3) {
        self.sexImageView.hidden = false;
        self.rightLabel.hidden = true;
    }
}

- (void)setLeftTitle:(NSString *)leftTitle {
    _leftTitle = leftTitle;
    self.leftLabel.text = leftTitle;
}

- (void)setRightTextArr:(NSArray *)rightTextArr {
    _rightTextArr = rightTextArr;
    if (rightTextArr.count != 0) {
        if (_currentIndexPath.row == 1) {
            self.rightLabel.text = NONULLSTRING([rightTextArr objectAtIndex:0]);
        }
        else if (_currentIndexPath.row == 2) {
             self.rightLabel.text = NONULLSTRING([rightTextArr objectAtIndex:1]);
        }
        else if (_currentIndexPath.row == 4) {
            self.rightLabel.text = NONULLSTRING([rightTextArr objectAtIndex:2]);
        }
        else if (_currentIndexPath.row == 5) {
            self.rightLabel.text = NONULLSTRING([rightTextArr objectAtIndex:3]);
        }
    }
    
}



- (void)clickHeadImageAction:(UITapGestureRecognizer *)tap {
    
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
