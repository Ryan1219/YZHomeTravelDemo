//
//  HSCollectViewController.m
//  HomeStay
//
//  Created by Ryan on 2017/12/7.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSCollectViewController.h"
#import "HSAddImageView.h"

@interface HSCollectViewController () <UIImagePickerControllerDelegate,UINavigationControllerDelegate,MWPhotoBrowserDelegate>

@property (nonatomic,strong) HSAddImageView *addImageView;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property(nonatomic,strong) UIImagePickerController *picker; //图片选择
/* <#description#> */
@property (nonatomic,strong) NSMutableArray *imageArray;

@end

@implementation HSCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self configBaseTableView];
//    [self configFooterRefresh];
//    self.baseTableView.mj_footer.hidden = true;
    
    self.imageArray = [NSMutableArray array];
    
    self.picker = [[UIImagePickerController alloc]init];
    self.picker.allowsEditing = YES;
    self.picker.delegate = self;
    
    self.addImageView = [[HSAddImageView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.addImageView];
    [self.addImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.width.mas_equalTo(ScreenWidth);
        make.height.mas_equalTo(120);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    WeakSelf
    self.addImageView.clickAddActionInAddImageViewBlock = ^(HSAddImageView *view) {
        
        HSAlertView *alertView = [[HSAlertView alloc] initWithTitle:@"上传图片" message:nil alertStyle:UIAlertControllerStyleActionSheet titleArray:@[@"相册",@"拍照"] hasCancel:true controller: weakSelf];
        [weakSelf.view addSubview:alertView];
        alertView.clickActionWithAlertViewBlock = ^(NSInteger index) {
            if (index == 0) {
                //                weakSelf.picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
                //                [weakSelf.navigationController presentViewController:weakSelf.picker animated:YES completion:nil];
                TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:5 - weakSelf.imageArray.count delegate:nil];
                imagePicker.allowTakePicture = false;
                [imagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
                    [weakSelf.imageArray addObjectsFromArray:photos];
                    weakSelf.addImageView.dataArray = weakSelf.imageArray;
                }];
                [weakSelf presentViewController:imagePicker animated:true completion:nil];
            }
            else if (index == 1) {
                weakSelf.picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [weakSelf.navigationController presentViewController:weakSelf.picker animated:YES completion:nil];
            }
        };
    };
    
    self.addImageView.clickCellInAddImageViewBlock = ^(NSArray *imageArray, NSIndexPath *indexPath) {
        
        HSShowBigImageController *photoCtrl = [[HSShowBigImageController alloc] initWithDelegate:self];
        if (imageArray.count < 5) {
            photoCtrl.selectCurrentIndex = indexPath.row - 1;
            [photoCtrl setCurrentPhotoIndex:indexPath.row - 1];
        }
        else {
            photoCtrl.selectCurrentIndex = indexPath.row;
            [photoCtrl setCurrentPhotoIndex:indexPath.row];
        }
        [weakSelf.navigationController pushViewController:photoCtrl animated:true];
    };
    
}
//MARK:--UIImagePickerControllerdelegate
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self.picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [self.picker dismissViewControllerAnimated:true completion:nil];
    
    UIImage *selectImage = [UIImage imageByScalingAndCroppingForSize:CGSizeMake(ScreenWidth, ScreenWidth) andImage:info[@"UIImagePickerControllerOriginalImage"]];
    [self.imageArray addObject:selectImage];
    self.addImageView.dataArray = self.imageArray;
//    [self.addImageView refresh];

}

//MARK:--MWPhoteBrowser Delegate
- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    
    return self.imageArray.count;
}

- (id<MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    
    UIImage *selectImage = self.imageArray[index];
    MWPhoto *photoModel = [[MWPhoto alloc] initWithImage:selectImage];
    return photoModel;
}

//- (void)photoBrowser:(MWPhotoBrowser *)photoBrowser didDisplayPhotoAtIndex:(NSUInteger)index {
//
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"sliderPhotoNotification" object: @(index)];
//}

//MARK:--Network
- (void)requestWithPage:(NSInteger)page {
    
    self.currentPage = page;
    
    [self showLoading:self.view text:nil];
    
    NSString *url = @"";
    WeakSelf
    [[HSNetworkManager sharedManager] getWithURL:url params:nil completion:^(id responseObject, NSError *error) {
        StrongSelf
        if (strongSelf) {
            [strongSelf hideLoading];
            if (error) {
                [strongSelf requestError:error];
            }
            else {
                if (strongSelf.currentPage == 1) {
                    [strongSelf.dataArray removeAllObjects];
                    [strongSelf.dataArray addObjectsFromArray:@[]];
                } else {
                    [strongSelf.dataArray addObjectsFromArray:@[]];
                }
            }
        }
    }];
    
}


@end




























