//
//  HSUserCenterTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/15.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUserCenterTableViewCell.h"
#import "HSDashBorderView.h"

@interface HSUserCenterTableViewCell ()

/* borderView */
@property (nonatomic,strong) HSDashBorderView *borderView;
/* houseNameLabel */
@property (nonatomic,strong) UILabel *houseNameLabel;
/* timeLabel */
@property (nonatomic,strong) UILabel *timeLabel;
/* <#description#> */
@property (nonatomic,strong) UILabel *typeLabel;

@end

@implementation HSUserCenterTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *UserCenterTableViewCellIndentifer = @"UserCenterTableViewCellIndentifer";
    HSUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UserCenterTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSUserCenterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:UserCenterTableViewCellIndentifer];
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
    self.borderView = [[HSDashBorderView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.borderView];
    //
    self.houseNameLabel = [[UILabel alloc] init];
    self.houseNameLabel.text = @"泸沽湖畔公寓B";
    self.houseNameLabel.font = HSFont(14);
    self.houseNameLabel.textColor = HSColor(0x333333);
    self.houseNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.houseNameLabel];
    //
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"2017-11-12 8晚";
    self.timeLabel.font = HSFont(12);
    self.timeLabel.textColor = HSColor(0x999999);
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    //
    self.typeLabel = [[UILabel alloc] init];
    self.typeLabel.text = @"待入住";
    self.typeLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];
    self.typeLabel.textColor = [UIColor greenColor];
    self.typeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.typeLabel];
    
    //
    [self.borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0.5);
        make.left.mas_equalTo(20  * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20  * iPhone_6_Width_Zoom);
        make.bottom.mas_equalTo(-15);
    }];
    //
    CGSize typeSize = [self.typeLabel.text sizeWithFont:[UIFont fontWithName:@"Helvetica-Bold" size:16] maxWidth:ScreenWidth/2];
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-10 - 20*iPhone_6_Width_Zoom);
        make.width.mas_equalTo(typeSize.width);
    }];
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10 + 20  * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(20);
        make.right.mas_equalTo(self.typeLabel.mas_left).offset(-50);
    }];
    //
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10 + 20  * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(self.houseNameLabel.mas_bottom).offset(10);
        make.right.mas_equalTo(-10 - 20*iPhone_6_Width_Zoom);
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
