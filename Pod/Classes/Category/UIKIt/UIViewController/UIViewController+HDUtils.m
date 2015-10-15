//
//  UIViewController+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import "UIViewController+HDUtils.h"

@implementation UIViewController (HDUtils)

@end

@implementation UIViewController (HDNavigationBarItemExtend)

- (void)hd_addDefaultBackBar:(SEL)action style:(void (^)(UIButton *button))buttonStyle
{
    [self hd_addLeftBarButtonWithTitle:NSLocalizedString(@"Back", @"返回")
                             andAction:action
                                 style:buttonStyle];
}

- (void)hd_addLeftBarButtonWithTitle:(NSString *)title
                           andAction:(SEL)action
                               style:(void (^)(UIButton *button))buttonStyle
{
    self.navigationItem.leftBarButtonItem =
        [self hd_barButtonItemWithTitle:title andAction:action style:buttonStyle];
}

- (void)hd_addRightBarButtonWithTitle:(NSString *)title
                            andAction:(SEL)action
                                style:(void (^)(UIButton *button))buttonStyle
{
    self.navigationItem.rightBarButtonItem =
        [self hd_barButtonItemWithTitle:title andAction:action style:buttonStyle];
}

- (UIBarButtonItem *)hd_barButtonItemWithTitle:(NSString *)title
                                     andAction:(SEL)action
                                         style:(void (^)(UIButton *button))buttonStyle
{
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setTitle:title forState:UIControlStateNormal];
    if (buttonStyle)
    {
        buttonStyle(buttonItem);
    }
    [buttonItem sizeToFit];
    [buttonItem addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    return barItem;
}

- (UIBarButtonItem *)hd_barButtonItemWithImage:(UIImage *)image
                                highlightImage:(UIImage *)highlightImage
                                     andAction:(SEL)action
                                         style:(void (^)(UIButton *button))buttonStyle
{
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setImage:image forState:UIControlStateNormal];
    [buttonItem setImage:highlightImage forState:UIControlStateHighlighted];
    if (buttonStyle)
    {
        buttonStyle(buttonItem);
    }
    [buttonItem sizeToFit];
    [buttonItem addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    return barItem;
}

@end

@implementation UIViewController (HDLoadAnimationExtend)

+ (void)load
{
#ifdef DEBUG
#if !__has_include("HaidoraProgressHUDManager.h")
    NSLog(@"Hud动画:pod 'HaidoraProgressHUDManager'");
#endif
#endif
}

@end

@implementation UIViewController (HDAlertViewExtend)

+ (void)load
{
#ifdef DEBUG
#if !__has_include("HaidoraAlertViewManager.h")
    NSLog(@"弹出框:pod 'HaidoraAlertViewManager'");
#endif
#endif
}

@end