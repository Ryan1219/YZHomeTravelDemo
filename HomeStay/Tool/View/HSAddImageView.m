//
//  HSAddImageView.m
//  HomeStay
//
//  Created by Ryan on 2017/12/20.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSAddImageView.h"

@interface HSAddImageView () <UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>
/* UICollectionView */
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation HSAddImageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self configLayout];
    }
    return self;
}

- (void)configLayout {
    
    CGFloat cellW = 100;
    CGFloat cellH = 120;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(cellW, cellW);
    flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 10; //水平滑动的时候有作用
//    flowLayout.minimumInteritemSpacing = 10;//竖直滑动的时候有作用
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.showsVerticalScrollIndicator = false;
    self.collectionView.showsHorizontalScrollIndicator = false;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[HSAddImageCollectionViewCell class] forCellWithReuseIdentifier:@"AddImageCollectionViewCellIndentifer"];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"addImageCellIndentifer"];
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(cellH);
    }];
}

//MARK:--UICollectionViewDelegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (self.dataArray.count <= 4) {
        return self.dataArray.count + 1;
    }
    else {
        return 5;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.dataArray.count <= 4) {
        if (indexPath.row == 0) {
            UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"addImageCellIndentifer" forIndexPath:indexPath];
            CGFloat cellW = 60;
            UIButton *imageView = [[UIButton alloc] initWithFrame:CGRectMake(20, 20, cellW, cellW)];
            imageView.backgroundColor = [UIColor redColor];
            [imageView setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
            [imageView addTarget:self action:@selector(clickAddImageAction:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:imageView];
            
            return cell;
        }
        else {
            HSAddImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddImageCollectionViewCellIndentifer" forIndexPath:indexPath];
            if (self.dataArray.count != 0) {
                cell.subImage = self.dataArray[indexPath.row - 1];
            }
            WeakSelf
            cell.clickDeleteActionInAddImageCollectionViewCell = ^(HSAddImageCollectionViewCell *cell) {
                if (weakSelf.dataArray.count != 0) {
                    NSIndexPath *indexPath = [collectionView indexPathForCell:cell];
                    [weakSelf.dataArray removeObjectAtIndex:indexPath.row - 1];
                    [weakSelf.collectionView reloadData];
                }
            };
            return cell;
        }
    } else {
        HSAddImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AddImageCollectionViewCellIndentifer" forIndexPath:indexPath];
        if (self.dataArray.count != 0) {
            cell.subImage = self.dataArray[indexPath.row];
        }
        WeakSelf
        cell.clickDeleteActionInAddImageCollectionViewCell = ^(HSAddImageCollectionViewCell *cell) {
            if (weakSelf.dataArray.count != 0) {
                NSIndexPath *indexPath = [collectionView indexPathForCell:cell];
                [weakSelf.dataArray removeObjectAtIndex:indexPath.row];
                [weakSelf.collectionView reloadData];
            }
        };
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.clickCellInAddImageViewBlock) {
        self.clickCellInAddImageViewBlock(self.dataArray, indexPath);
    }
}

- (void)clickAddImageAction:(UIButton *)sender {
    if (self.clickAddActionInAddImageViewBlock) {
        self.clickAddActionInAddImageViewBlock(self);
    }
}

- (void)setDataArray:(NSMutableArray *)dataArray {
    _dataArray = dataArray;
    [self.collectionView reloadData];
}


@end






@interface HSAddImageCollectionViewCell ()
/* commentImageView */
@property (nonatomic,strong) UIImageView *commentImageView;
/* 删除 */
@property (nonatomic,strong) UIButton *deleteBtn;

@end


@implementation HSAddImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        //
        self.commentImageView = [[UIImageView alloc] init];
        self.commentImageView.userInteractionEnabled = true;
        self.commentImageView.layer.cornerRadius = 6;
        self.commentImageView.layer.masksToBounds = true;
        self.commentImageView.layer.borderWidth = 1;
        self.commentImageView.layer.borderColor = Color_CCCCCC.CGColor;
        [self.contentView addSubview:self.commentImageView];
        //
        self.deleteBtn = [[UIButton alloc] init];
        [self.deleteBtn setImage:HSImage(@"") forState:UIControlStateNormal];
        self.deleteBtn.backgroundColor = [UIColor redColor];
        [self.deleteBtn addTarget:self action:@selector(clickDeleteAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.deleteBtn];
        
        //
        [self.commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.mas_equalTo(20);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-20);
            make.right.mas_equalTo(-20);
        }];
        //
        [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.right.mas_equalTo(0);
            make.width.height.mas_equalTo(20);
        }];
        
    }
    return self;
}

- (void)clickDeleteAction:(UIButton *)sender {
    if (self.clickDeleteActionInAddImageCollectionViewCell) {
        self.clickDeleteActionInAddImageCollectionViewCell(self);
    }
}

- (void)setSubImage:(UIImage *)subImage {
    _subImage = subImage;
    self.commentImageView.image = subImage;
}

@end
















