//
//  AppDelegate.m
//  WRCellViewDemo
//
//  Created by wangrui on 2017/4/24.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "AppDelegate.h"
#import "DemoListController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[DemoListController new]];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
