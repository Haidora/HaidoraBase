//
//  NSObject+HABCurrent.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-21.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSObject+HABCurrent.h"

@implementation NSObject (HABCurrent)

- (UIView *)hab_CurrentView
{
    return [self hab_CurrentController].view;
}

- (UIWindow *)hab_CurrentWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

- (UIViewController *)hab_CurrentController
{
    UIWindow *window = [self hab_CurrentWindow];
    return [self hab_CurrentControllerFor:window.rootViewController];
}

- (UIViewController *)hab_CurrentControllerFor:(UIViewController *)viewController
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
        currentController =
            [self hab_CurrentControllerFor:currentController.presentedViewController];
    }
    return currentController;
}

#pragma mark
#pragma mark Deprecated Method

- (UIView *)currentView
{
    return [self hab_CurrentView];
}

- (UIWindow *)currentWindow
{
    return [self hab_CurrentWindow];
}

- (UIViewController *)currentController
{
    return [self hab_CurrentController];
}

- (UIViewController *)currentControllerFor:(UIViewController *)viewController
{
    return [self hab_CurrentControllerFor:viewController];
}

@end
