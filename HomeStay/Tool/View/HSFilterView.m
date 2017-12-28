//
//  HSFilterView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/26.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSFilterView.h"

//MARK:--HSFilterModel
@implementation HSFilterModel

@end




//MARK:--HSFilterCollectionViewCell
@interface HSFilterCollectionViewCell ()

@property (nonatomic,strong) UILabel *titleLabel;

@end

@implementation HSFilterCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = true;
        self.backgroundColor = HSColor(0xf7f7f7);
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = HSFont(12);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = Color_333333;
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.mas_equalTo(0);
    }];
}

- (void)setFilterModel:(HSFilterModel *)filterModel {
    _filterModel = filterModel;
    self.titleLabel.text = filterModel.text;
    if (filterModel.isSelect) {
        self.layer.borderWidth = 1;
        self.layer.borderColor = Color_5aa572.CGColor;
        self.backgroundColor = Color_ffffff;
    }
    else {
        self.layer.borderWidth = 0;
        self.backgroundColor = HSColor(0xf7f7f7);
    }
    
}

@end








//MARK:--HSFilterView
@interface HSFilterView () <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation HSFilterView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = Color_ffffff;
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = HSFont(15);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.textColor = Color_333333;
    [self addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18 * iPhone_6_Width_Zoom);
        make.right.mas_equalTo(-18 * iPhone_6_Width_Zoom);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    CGFloat btnH = 32;
    CGFloat btnW = (ScreenWidth - 36 - 6*3) / 4;
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(btnW, btnH);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 18, 0, 18);//设置所有item的范围
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    flowLayout.minimumLineSpacing = 20; //设置竖直方向的间距
    flowLayout.minimumInteritemSpacing = 6; //设置水平方向的间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[HSFilterCollectionViewCell class] forCellWithReuseIdentifier:@"filterCollectionViewCellIndentifier"];
    [self addSubview:self.collectionView];
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(20);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
    }];
    
}

//MARK:--UICollectionView Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _titleArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath  {
    
    HSFilterCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"filterCollectionViewCellIndentifier" forIndexPath:indexPath];
    cell.filterModel = _titleArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    HSFilterModel *filterModel = _titleArray[indexPath.row];
    
    if (_choiceStyle == HSFilterViewSingleChoice) {
        for (HSFilterModel *subFilterModel in _titleArray) {
            if (filterModel == subFilterModel) {
                filterModel.isSelect = !filterModel.isSelect;
                if (filterModel.isSelect) {
                    subFilterModel.isSelect = true;
                }
                else {
                    subFilterModel.isSelect = false;
                }
            }
            else {
                subFilterModel.isSelect = false;
            }
        }
    }
    else if (_choiceStyle == HSFilterViewMultipleChoice) {
        filterModel.isSelect = !filterModel.isSelect;
    }
    
    [self.collectionView reloadData];
    
    [self handleLogic];
}

- (void)setTitle:(NSString *)title {
    _title = title;
    self.titleLabel.text = title;
}

- (void)setTitleArray:(NSArray<HSFilterModel *> *)titleArray {
    _titleArray = titleArray;
    
    [self.collectionView reloadData];
}

- (void)setChoiceStyle:(HSFilterViewStyle)choiceStyle {
    
    _choiceStyle = choiceStyle;
}

//处理回调
- (void)handleLogic {
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (HSFilterModel *subFilterModel in _titleArray) {
        if (subFilterModel.isSelect) {
            [tempArray addObject:subFilterModel];
        }
        else {
            [tempArray removeObject:subFilterModel];
        }
    }
    
    if (self.filterViewChoiceBlock) {
        self.filterViewChoiceBlock(self, tempArray);
    }
}






































@end





































