//
//  AppDelegate.h
//  HomeStay
//
//  Created by Q房通 on 2017/11/28.
//  Copyright © 2017年 Q房通. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,WXApiDelegate,QQApiInterfaceDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

