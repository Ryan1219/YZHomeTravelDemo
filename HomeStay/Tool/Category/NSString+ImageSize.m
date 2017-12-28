//
//  NSString+ImageSize.m
//  HomeStay
//
//  Created by Ryan on 2017/12/6.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "NSString+ImageSize.h"

@implementation NSString (ImageSize)

+ (NSString *)serverImageSizeWith100x135:(NSString *)imageUrl {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:@"100x135"];
}

+ (NSString *)serverImageSizeWith180x135:(NSString *)imageUrl {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:@"180x135"];
}

+ (NSString *)serverImageSizeWith386x289:(NSString *)imageUrl {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:@"386x289"];
}

+ (NSString *)serverImageSizeWith600x450:(NSString *)imageUrl {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:@"600x450"];
}

+ (NSString *)serverImageSizeWith800x600:(NSString *)imageUrl {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:@"800x600"];
}

+ (NSString *)serverImageSizeWithImageUrl:(NSString *)imageUrl imageSize:(NSString *)imageSize {
    
    return [imageUrl stringByReplacingOccurrencesOfString:@"{size}" withString:imageSize];
}


@end















































