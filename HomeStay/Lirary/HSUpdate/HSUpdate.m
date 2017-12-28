//
//  HSUpdate.m
//  HomeStay
//
//  Created by Ryan on 2017/12/11.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import "HSUpdate.h"

@implementation HSUpdate

/*
 *单例
 */
static id _sharedInstance = nil;
+ (instancetype)sharedInstance {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[self alloc] init];
    });
    return _sharedInstance;
}

- (void)checkUpdate:(BOOL)response {
    
    
}

- (void)checkNotification {
    
    
}

- (void)requestUpdate {
    
    
}

//MARK:--Exit
- (void)exitApplication {
    
    [UIView beginAnimations:@"exitApplication" context:nil];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDidStopSelector:@selector(animationFinished:finished:context:)];
    [[[UIApplication sharedApplication] delegate] window].bounds = CGRectMake(0, 0, 0, 0);
    [UIView commitAnimations];
}

- (void)animationFinished:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if ([animationID isEqualToString:@"exitApplication"]) {
        exit(0);
    }
}

@end


@implementation HSUpdateDataModel

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"version" : @"newVersion"
             };
}

@end










































































