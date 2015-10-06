//
//  TLAppDelegate.m
//  侧边菜单视图-第三方
//
//  Created by MS on 15-6-13.
//  Copyright (c) 2015年 MS. All rights reserved.
//

#import "TLAppDelegate.h"

#import "ICSDrawerController.h"
#import "TLConfigTableViewController.h"
#import "TLMainViewController.h"


@implementation TLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    NSArray *colors = @[[UIColor redColor],
                        [UIColor blackColor],
                        [UIColor blueColor]];
    //创建设置界面(侧边栏)
    TLConfigTableViewController *configVC = [[TLConfigTableViewController alloc] initWithColors:colors];
    //创建主界面
    TLMainViewController *mainVC = [[TLMainViewController alloc] init];
    mainVC.view.backgroundColor = colors[0];
    
    //创建第三方视图,并且将主界面(mainVC)设置成中心视图
    ICSDrawerController *drawer = [[ICSDrawerController alloc] initWithLeftViewController:configVC centerViewController:mainVC];
    //将drawer设置成根视图控制器
    self.window.rootViewController = drawer;
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
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
