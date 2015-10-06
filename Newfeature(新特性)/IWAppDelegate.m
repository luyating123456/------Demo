//
//  IWAppDelegate.m
//  ItcastWeibo
//
//  Created by apple on 14-5-5.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "IWAppDelegate.h"
#import "IWTabBarViewController.h"
#import "IWNewfeatureViewController.h"
#import "IWOAuthViewController.h"
#import "IWAccount.h"

@implementation IWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // 先判断有无存储账号信息
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *file = [doc stringByAppendingPathComponent:@"account.data"];
    IWAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
    
    if (account) { // 之前登录成功
        NSString *key = @"CFBundleVersion";
        
        // 取出沙盒中存储的上次使用软件的版本号
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSString *lastVersion = [defaults stringForKey:key];
        
        // 获得当前软件的版本号
        NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
        
        if ([currentVersion isEqualToString:lastVersion]) {
            // 显示状态栏
            application.statusBarHidden = NO;
            self.window.rootViewController = [[IWTabBarViewController alloc] init];
        } else { // 新版本
            self.window.rootViewController = [[IWNewfeatureViewController alloc] init];
            // 存储新版本
            [defaults setObject:currentVersion forKey:key];
            [defaults synchronize];
        }
    } else { // 之前没有登录成功
        self.window.rootViewController = [[IWOAuthViewController alloc] init];
    }
    
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
