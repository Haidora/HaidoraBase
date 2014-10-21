//
//  NSObject+HABCurrent.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-21.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSObject+HABCurrent.h"

@implementation NSObject (HABCurrent)

- (UIView *)currentView
{
    return [self currentController].view;
}

- (UIWindow *)currentWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

- (UIViewController *)currentController
{
    UIWindow *window = [self currentWindow];
    return [self currentControllerFor:window.rootViewController];
}

- (UIViewController *)currentControllerFor:(UIViewController *)viewController
{
    UIViewController *currentController;
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        currentController = navigationController.visibleViewController;
    }
    else if ([viewController isKindOfClass:[UITabBarController class]])
    {
        UITabBarController *tabBarController = (UITabBarController *)viewController;
        if ([tabBarController.selectedViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *navigationController =
                (UINavigationController *)tabBarController.selectedViewController;
            currentController = navigationController.visibleViewController;
        }
        else
        {
            currentController = tabBarController.selectedViewController;
        }
    }
    else
    {
        currentController = viewController;
    }
    if (currentController.presentedViewController)
    {
        currentController = [self currentControllerFor:currentController.presentedViewController];
    }
    return currentController;
}

@end
