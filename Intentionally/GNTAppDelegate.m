//
//  GNTAppDelegate.m
//  Intentionally
//
//  Created by Garrett Disco on 5/22/15.
//  Copyright (c) 2015 Garrett Disco. All rights reserved.
//

#import "GNTAppDelegate.h"
#import "GNTViewController.h"
#import "SlideNavigationController.h"
#import "LeftMenuViewController.h"
#import "FontAwesomeKit.h"

@interface GNTAppDelegate()<SlideNavigationControllerDelegate>

@end

@implementation GNTAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    GNTViewController *mainViewController = [[GNTViewController alloc] init];
    
    LeftMenuViewController *leftMenu = [[LeftMenuViewController alloc] init];
    SlideNavigationController *slideController = [[SlideNavigationController alloc] initWithRootViewController:mainViewController];
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    [SlideNavigationController sharedInstance].menuRevealAnimationDuration = 0.18;
    [SlideNavigationController sharedInstance].delegate = mainViewController;
    [SlideNavigationController sharedInstance].enableSwipeGesture = YES;
    
    // Create a custom bar button for left menu
    FAKFontAwesome *barsIcon = [FAKFontAwesome barsIconWithSize:30];
    UIImage *barsImage = [barsIcon imageWithSize:CGSizeMake(30, 30)];    
    UIButton *barsButton  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    [barsButton setImage:barsImage forState:UIControlStateNormal];
    [barsButton addTarget:[SlideNavigationController sharedInstance] action:@selector(toggleLeftMenu) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftBarButtonItem= [[UIBarButtonItem alloc] initWithCustomView:barsButton];
    [SlideNavigationController sharedInstance].leftBarButtonItem = leftBarButtonItem;
    
    
    self.window.rootViewController = [SlideNavigationController sharedInstance];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - UINavigationControllerDelegate

@end
