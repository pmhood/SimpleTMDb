//
//  STTAppDelegate.m
//  SimpleTMDbTestApp
//
//  Created by Peter Hood on 5/17/13.
//  Copyright (c) 2013 Bridge Thirteen. All rights reserved.
//

#import "STTAppDelegate.h"
#import "STTTabBarController.h"

#import <SimpleTMDb/SimpleTMDb.h>
#import "Movie/STTSelectMovieApiViewController.h"
#import "Persons/STTSelectPersonsApiViewController.h"
#import "Configuration/STTConfigurationApiContainerTableViewController.h"

@implementation STTAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Setup the API key
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    [[SimpleTMDb sharedInstance] setApiKey:[infoDictionary objectForKey:@"API key"]];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];

    STTConfigurationApiContainerTableViewController *configurationViewController = [[STTConfigurationApiContainerTableViewController alloc] init];
    UINavigationController *configurationNav = [[UINavigationController alloc] initWithRootViewController:configurationViewController];

    
    STTSelectMovieApiViewController *moviesViewController = [[STTSelectMovieApiViewController alloc] init];
    UINavigationController *moviesNav = [[UINavigationController alloc] initWithRootViewController:moviesViewController];

    STTSelectPersonsApiViewController *personsViewController = [[STTSelectPersonsApiViewController alloc] init];
    UINavigationController *personsNav = [[UINavigationController alloc] initWithRootViewController:personsViewController];


    
    STTTabBarController *tbc = [[STTTabBarController alloc] initWithNibName:@"STTTabBarController" bundle:nil];
    [tbc setViewControllers:@[configurationNav, moviesNav, personsNav]];

    [[self window] setRootViewController:tbc];
    
    
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
