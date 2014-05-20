//
//  AppDelegate.m
//  TestDemo
//
//  Created by 沿途の风景 on 13-11-26.
//  Copyright (c) 2013年 Andy. All rights reserved.
//

#import "AppDelegate.h"
#import "UserGuideViewController.h"

#import "SecondViewController.h"
#import "MapController.h"

#import "SVController.h"

@interface AppDelegate ()

@property (nonatomic,assign) UIBackgroundTaskIdentifier backgroundUpdateTask;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
//    //判断是不是第一次启动应用
//    if(![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"])
//    {
//        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
//        NSLog(@"第一次启动");
//        //如果是第一次启动的话,使用UserGuideViewController (用户引导页面) 作为根视图
//        UserGuideViewController *userGuideViewController = [[UserGuideViewController alloc] init];
//        self.window.rootViewController = userGuideViewController;
//        //[userGuideViewController release];
//    }
//    else
//    {
//        /*
//        NSLog(@"不是第一次启动");
//        //如果不是第一次启动的话,使用LoginViewController作为根视图
//        _viewController = [[ViewController alloc] init];
//        self.window.rootViewController = _viewController;
//         */
//        
//        SecondViewController *sec = [[SecondViewController alloc] init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:sec];
//        nav.navigationBarHidden = YES;
//        self.window.rootViewController = nav;
//        
//    }
    
    self.window.rootViewController = [[SecondViewController alloc] init];

    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    [self beingBackgroundUpdateTask];
    
    //  这里加上需要长久运行的代码
    
    
    
    [self endBackgroundUpdateTask];
}

- (void)beingBackgroundUpdateTask
{
    self.backgroundUpdateTask = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:^{
        [self endBackgroundUpdateTask];
    }];
}

- (void)endBackgroundUpdateTask
{
    [[UIApplication sharedApplication] endBackgroundTask:self.backgroundUpdateTask];
    self.backgroundUpdateTask = UIBackgroundTaskInvalid;
}


- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
