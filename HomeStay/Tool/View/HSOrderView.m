//
//  HSOrderView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/14.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSOrderView.h"
#import "HSDashLineView.h"

@interface HSOrderCollectionViewCell ()
/* textBtn */
@property (nonatomic,strong) UIButton *textBtn;
/* timeImageView */
@property (nonatomic,strong) UIImageView *timeImageView;
/* <#description#> */
@property (nonatomic,strong) UIImageView *endTimeImageView;
/* <#description#> */
@property (nonatomic,strong) HSDashLineView *firstLineView;
/* dashLineView */
@property (nonatomic,strong) HSDashLineView *dashLineView;
/* tipLabel */
@property (nonatomic,strong) UILabel *tipLabel;
/* timeLabel */
@property (nonatomic,strong) UILabel *timeLabel;
/* <#description#> */
@property (nonatomic,strong) UILabel *endTipLabel;
/* <#description#> */
@property (nonatomic,strong) UILabel *endTimeLabel;

@end

@implementation HSOrderCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    // 布局
    self.textBtn = [[UIButton alloc] init];
    [self.textBtn setTitle:@"如取消订单，定金全部退还" forState:UIControlStateNormal];
    self.textBtn.titleLabel.numberOfLines = 0;
    self.textBtn.titleLabel.font = HSFont(14);
    [self.textBtn setBackgroundImage:HSImage(@"order_cancel_msg") forState:UIControlStateNormal];
    [self.contentView addSubview:self.textBtn];
    //
    self.firstLineView = [[HSDashLineView alloc] initWithFrame:CGRectZero];
//    self.firstLineView.lineLength = 6;
//    self.firstLineView.lineSpace = 1;
//    self.firstLineView.lineColor = [UIColor greenColor];
    [self.contentView addSubview:self.firstLineView];
    //
    self.timeImageView = [[UIImageView alloc] init];
    self.timeImageView.image = HSImage(@"order_time_green");
    self.timeImageView.layer.cornerRadius = 10;
    self.timeImageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.timeImageView];
    //
    self.dashLineView = [[HSDashLineView alloc] initWithFrame:CGRectZero];
//    self.dashLineView.lineLength = 6;
//    self.dashLineView.lineSpace = 1;
//    self.dashLineView.lineColor = [UIColor greenColor];
    [self.contentView addSubview:self.dashLineView];
    //
    self.endTimeImageView = [[UIImageView alloc] init];
    self.endTimeImageView.image = HSImage(@"order_time_green");
    self.endTimeImageView.layer.cornerRadius = 10;
    self.endTimeImageView.layer.masksToBounds = true;
    [self.contentView addSubview:self.endTimeImageView];
    //
    self.tipLabel = [[UILabel alloc] init];
    self.tipLabel.text = @"预定成功";
    self.tipLabel.font = HSFont(14);
    self.tipLabel.textColor = HSColor(0x666666);
    self.tipLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.tipLabel];
    //
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.text = @"2017-12-16 14:20";
    self.timeLabel.font = HSFont(14);
    self.timeLabel.textColor = HSColor(0x666666);
    self.timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:self.timeLabel];
    //
    self.endTipLabel = [[UILabel alloc] init];
    self.endTipLabel.text = @"离店日";
    self.endTipLabel.font = HSFont(14);
    self.endTipLabel.textColor = HSColor(0x666666);
    self.endTipLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.endTipLabel];
    //
    self.endTimeLabel = [[UILabel alloc] init];
    self.endTimeLabel.text = @"12:00前";
    self.endTimeLabel.font = HSFont(14);
    self.endTimeLabel.textColor = HSColor(0x666666);
    self.endTimeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.endTimeLabel];
    
    // 约束
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
    }];
    //
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.timeLabel.mas_top);
    }];
    //
    [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(30);
        make.width.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.tipLabel.mas_top).offset(-5);
    }];
    //
    [self.firstLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.centerY.mas_equalTo(self.timeImageView.centerY);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(2);
    }];
    //
    [self.dashLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.timeImageView.mas_right);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(2);
        make.centerY.mas_equalTo(self.timeImageView.centerY);
    }];
    //
    [self.textBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(60);
        make.bottom.mas_equalTo(self.timeImageView.mas_top).offset(-10);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(60);
    }];
  
    //最后一个时钟
    [self.endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
    }];
    //
    [self.endTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.endTimeLabel.mas_top);
    }];
    //
    [self.endTimeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right);
        make.width.height.mas_equalTo(20);
        make.bottom.mas_equalTo(self.endTipLabel.mas_top).offset(-5);
    }];
}

- (void)setIsHide:(BOOL)isHide {
    _isHide = isHide;
    if (isHide) {
        self.endTimeImageView.hidden = true;
        self.endTipLabel.hidden = true;
        self.endTimeLabel.hidden = true;
        [self.dashLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right);
        }];
    }
    else {
        self.endTimeImageView.hidden = false;
        self.endTipLabel.hidden = false;
        self.endTimeLabel.hidden = false;
        [self.dashLineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView.mas_right).offset(-20);
        }];
    }
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    _currentIndexPath = currentIndexPath;
    if (currentIndexPath.row == 0) {
        self.firstLineView.hidden = true;
    }
    else {
        self.firstLineView.hidden = false;
    }
}

- (void)setContent:(NSString *)content {
    _content = content;
    [self.textBtn setTitle:content forState:UIControlStateNormal];
    CGFloat textHeight = [content sizeWithFont:HSFont(14) maxWidth:self.frame.size.width - 60].height + 30;
    CGFloat btnHeight = (textHeight > 60) ? textHeight : 60;
    [self.textBtn mas_updateConstraints:^(MASConstraintMaker *make) {
         make.height.mas_equalTo(btnHeight);
    }];
}


@end






@interface HSOrderView () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/* UICollectionView */
@property (nonatomic,strong) UICollectionView *collectionView;
/* UICollectionViewFlowLayout */
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;
/* bottomLineView */
@property (nonatomic,strong) UIView *bottomLineView;

@end

@implementation HSOrderView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    CGFloat itemW = ScreenWidth / 2;
    CGFloat itemH = 115 + 60;
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.flowLayout.itemSize = CGSizeMake(itemW, itemH);
    self.flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.flowLayout.minimumLineSpacing = 0; //水平滑动的时候有作用
    self.flowLayout.footerReferenceSize = CGSizeMake(30, itemH);
//     flowLayout.minimumInteritemSpacing = 10; //竖直滑动的时候有作用
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[HSOrderCollectionViewCell class] forCellWithReuseIdentifier:@"orderCollectionViewCellIdentifer"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerIdentifer"];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(itemH);
    }];
    
    self.bottomLineView = [[UIView alloc] init];
    self.bottomLineView.backgroundColor = HSColor(0xcccccc);
    [self addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-20 * iPhone_6_Width_Zoom);
        make.height.mas_equalTo(1 * HSLineWidth);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    
}

//MARK:--UICollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataArray.count;
//    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HSOrderCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"orderCollectionViewCellIdentifer" forIndexPath:indexPath];
    cell.content = self.dataArray[indexPath.row];
    cell.currentIndexPath = indexPath;
    if (indexPath.row == self.dataArray.count - 1) {
        cell.isHide = false;
    } else {
        cell.isHide = true;
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerIdentifer" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor whiteColor];
        
        return reusableView;
    }
    return nil;
    
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    [self.collectionView reloadData];
}

- (void)setCellHeight:(CGFloat)cellHeight {
    _cellHeight = cellHeight;
    CGFloat itemW = ScreenWidth / 2;
    self.flowLayout.footerReferenceSize = CGSizeMake(30, 115 + cellHeight);
    self.flowLayout.itemSize = CGSizeMake(itemW, 115 + cellHeight);
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(115 + cellHeight);
    }];
    [self.collectionView reloadData];
}
































/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
