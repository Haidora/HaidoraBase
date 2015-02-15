//
//  NSObject+HABCurrent.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-21.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSObject+HABCurrent.h"

@implementation NSObject (HABCurrent)

- (UIView *)currentView_HABCurrent
{
    return [self currentController_HABCurrent].view;
}

- (UIWindow *)currentWindow_HABCurrent
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        window = [[UIApplication sharedApplication].windows objectAtIndex:0];
    }
    return window;
}

- (UIViewController *)currentController_HABCurrent
{
    UIWindow *window = [self currentWindow_HABCurrent];
    return [self currentControllerFor_HABCurrent:window.rootViewController];
}

- (UIViewController *)currentControllerFor_HABCurrent:(UIViewController *)viewController
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
            [self currentControllerFor_HABCurrent:currentController.presentedViewController];
    }
    return currentController;
}

#pragma mark
#pragma mark Deprecated Method

- (UIView *)hab_CurrentView
{
    return [self currentView_HABCurrent];
}

- (UIWindow *)hab_CurrentWindow
{
    return [self currentWindow_HABCurrent];
}

- (UIViewController *)hab_CurrentController
{
    return [self currentController_HABCurrent];
}

- (UIViewController *)hab_CurrentControllerFor:(UIViewController *)viewController
{
    return [self currentControllerFor_HABCurrent:viewController];
}

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
