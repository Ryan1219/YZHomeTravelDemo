//
//  HSHouseDetailTableViewCell.m
//  HomeStay
//
//  Created by Ryan on 2017/12/18.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSHouseDetailTableViewCell.h"

@interface HSHouseDetailTableViewCell ()

@end

@implementation HSHouseDetailTableViewCell



@end




//MARK:--你可能喜欢
@interface HSYouMayLikeTableViewCell ()

@property (nonatomic,strong) UIImageView *houseImageView;
@property (nonatomic,strong) UILabel *houseNameLabel;
@property (nonatomic,strong) UILabel *priceLabel;
@property (nonatomic,strong) UILabel *descriptLabel;

@end

@implementation  HSYouMayLikeTableViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
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
    self.priceLabel = [[UILabel alloc] init];
    self.priceLabel.text = @"¥999";
    self.priceLabel.font = HSFont(14);
    self.priceLabel.textColor = HSColor(0x333333);
    self.priceLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.priceLabel];
    //
    self.descriptLabel = [[UILabel alloc] init];
    self.descriptLabel.text = @"官渡区 | 1居 30平 | 2人";
    self.descriptLabel.font = HSFont(13);
    self.descriptLabel.textColor = HSColor(0x999999);
    self.descriptLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.descriptLabel];
    
    //
    [self.houseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.contentView);
        make.height.mas_equalTo(100);
    }];
    //
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(self.houseImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(60);
    }];
    //
    [self.houseNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(self.priceLabel.mas_left);
        make.top.mas_equalTo(self.houseImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    
}


@end





//MARK:--入住需知cell
@interface  HSCheckInTableViewCell () <UITableViewDelegate,UITableViewDataSource>
/* 入住须知 */
@property (nonatomic,strong) UILabel *titleLabel;
/* 内容 */
@property (nonatomic,strong) UITableView *tableView;

@end


@implementation HSCheckInTableViewCell

/* <#description#> */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *CheckInTableViewCellIndentifer = @"CheckInTableViewCellIndentifer";
    HSCheckInTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CheckInTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSCheckInTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CheckInTableViewCellIndentifer];
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
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.text = @"泸沽湖畔公寓A";
    self.titleLabel.font = HSFont(14);
    self.titleLabel.textColor = HSColor(0x333333);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.titleLabel];
    //
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.contentView addSubview:self.tableView];
    
    //
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    //
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.contentView);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
    }];
}

//MARK:--UITableView Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HSCheckInSubTableViewCell *cell = [HSCheckInSubTableViewCell cellWithTableView:tableView];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [HSCheckInSubTableViewCell getCellHeight];
}

@end


//MARK:--入住需知的子cell
@interface HSCheckInSubTableViewCell ()
@property (nonatomic,strong) UILabel *leftLabel;
@property (nonatomic,strong) UILabel *rightLabel;

@end

@implementation HSCheckInSubTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *CheckInSubTableViewCellIndentifer = @"CheckInSubTableViewCellIndentifer";
    HSCheckInSubTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CheckInSubTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSCheckInSubTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CheckInSubTableViewCellIndentifer];
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
    self.leftLabel.text = @"入住时间:  ";
    self.leftLabel.font = HSFont(14);
    self.leftLabel.textColor = HSColor(0x666666);
    self.leftLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.leftLabel];
    //
    self.rightLabel = [[UILabel alloc] init];
    self.rightLabel.text = @"12:00";
    self.rightLabel.font = HSFont(14);
    self.rightLabel.textColor = HSColor(0x666666);
    self.rightLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.rightLabel];
    
    //
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.contentView.centerY);
        make.width.mas_equalTo(100);
    }];
    //
    [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftLabel.mas_right);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.centerY.mas_equalTo(self.contentView.centerY);
    }];
}

+ (CGFloat)getCellHeight {
    return 30;
}

@end






//MARK:--详情评论cell
@interface HSCommentTableViewCell  ()
/* 头像 */
@property (nonatomic,strong) UIImageView *headImageView;
/* 用户名 */
@property (nonatomic,strong) UILabel *nameLabel;
/* 评论时间 */
@property (nonatomic,strong) UILabel *timeLabel;
/* 评分 */
@property (nonatomic,strong) UILabel *scoreLabel;
/* 评论内容 */
@property (nonatomic,strong) UILabel *commentLabel;
/* 全文按钮 */
@property (nonatomic,strong) UIButton *showAllBtn;
/* <#description#> */
@property (nonatomic,strong) UIView *seperateLineView;

@end

@implementation HSCommentTableViewCell

/* cellWithTableView */
+ (instancetype)cellWithTableView:(UITableView *)tableView {
    
    static NSString *CommentTableViewCellIndentifer = @"CommentTableViewCellIndentifer";
    HSCommentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CommentTableViewCellIndentifer];
    if (!cell) {
        cell = [[HSCommentTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CommentTableViewCellIndentifer];
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
    self.headImageView = [[UIImageView alloc] init];
    self.headImageView.backgroundColor = [UIColor redColor];
    self.headImageView.userInteractionEnabled = true;
    self.headImageView.layer.cornerRadius = 30;
    self.headImageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.headImageView];
    //
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"机器猫";
    self.nameLabel.font = HSFont(14);
    self.nameLabel.textColor = HSColor(0x666666);
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.nameLabel];
    //
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"2018-01-25";
    self.timeLabel.font = HSFont(14);
    self.timeLabel.textColor = HSColor(0x666666);
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    //
    self.commentLabel = [[UILabel alloc] init];
    self.commentLabel.numberOfLines = 0;
    self.commentLabel.text = @"2018-01-25";
    self.commentLabel.font = HSFont(14);
    self.commentLabel.textColor = HSColor(0x666666);
    self.commentLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.commentLabel];
    //
    self.showAllBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.showAllBtn setTitle:@"全文" forState:UIControlStateNormal];
    [self.showAllBtn setTitleColor:HSColor(0x666666) forState:UIControlStateNormal];
    self.showAllBtn.titleLabel.font = HSFont(12);
    [self.showAllBtn addTarget:self action:@selector(clickShowAllBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.showAllBtn];
    //
    self.seperateLineView = [[UIView alloc] init];
    self.seperateLineView.backgroundColor = Color_CCCCCC;
    [self.contentView addSubview:self.seperateLineView];
    //动态回复部分
    
    //
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(20);
        make.width.height.mas_equalTo(60);
    }];
    //
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.headImageView.mas_top).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-60);
    }];
    //
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.bottom.mas_equalTo(self.headImageView.mas_bottom).offset(-10);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-60);
    }];
    //
    [self.scoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-20 * iPhone_6_Width_Zoom);
        make.centerY.mas_equalTo(self.headImageView.mas_centerY);
    }];
    //
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(10);
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
    }];
    //
    [self.showAllBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.top.mas_equalTo(self.commentLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
    //
    [self.seperateLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.headImageView.mas_right).offset(10);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(0.5 * HSLineWidth);
        make.top.mas_equalTo(self.showAllBtn.mas_bottom);
    }];
    //动态回复部分 用tableView
    
}
// 根据模型计算高度
+ (CGFloat)getCellHeight {
    return 100;
}

- (void)clickShowAllBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (self.clickShowAllCommentTableViewCellBlock) {
        self.clickShowAllCommentTableViewCellBlock(sender.selected);
    }
}

@end

































