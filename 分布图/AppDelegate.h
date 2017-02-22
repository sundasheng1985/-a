//
//  AppDelegate.h
//  分布图
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

