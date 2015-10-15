//
//  NSObject+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import "NSObject+HDUtils.h"

@implementation NSObject (HDUtils)

@end

@implementation NSObject (HDCurrentPrivate)

- (UIWindow *)hd_currentWindow
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (!window)
    {
        // TODO: lastObject or firstObject need test.
        window = [[UIApplication sharedApplication].windows firstObject];
    }
    return window;
}

- (UIViewController *)hd_currentControllerWith:(UIViewController *)viewController
{
    UIViewController *currentController;
    // UINavigationController
    if ([viewController isKindOfClass:[UINavigationController class]])
    {
        UINavigationController *navigationController = (UINavigationController *)viewController;
        currentController = navigationController.visibleViewController;
    }
    // UITabBarController
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
    // other Controller
    else
    {
        if (viewController.childViewControllers.count > 0 &&
            [viewController conformsToProtocol:@protocol(HDCurrentProtocol)])
        {
            currentController = [((id<HDCurrentProtocol>)viewController)currentController];
        }
        else
        {
            currentController = viewController;
        }
    }
    if (currentController.presentedViewController)
    {
        currentController =
            [self hd_currentControllerWith:currentController.presentedViewController];
    }
    return currentController;
}

@end

@implementation NSObject (HDCurrentExtend)

- (UIViewController *)hd_currentController
{
    UIWindow *window = [self hd_currentWindow];
    return [self hd_currentControllerWith:window.rootViewController];
}

@end
