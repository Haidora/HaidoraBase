//
//  UIViewController+HDUtils.h
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import <UIKit/UIKit.h>

@interface UIViewController (HDUtils)

@end

@interface UIViewController (HDNavigationBarItemExtend)

- (void)hd_addDefaultBackBar:(SEL)action style:(void (^)(UIButton *button))buttonStyle;
- (void)hd_addLeftBarButtonWithTitle:(NSString *)title
                           andAction:(SEL)action
                               style:(void (^)(UIButton *button))buttonStyle;
- (void)hd_addRightBarButtonWithTitle:(NSString *)title
                            andAction:(SEL)action
                                style:(void (^)(UIButton *button))buttonStyle;

- (UIBarButtonItem *)hd_barButtonItemWithTitle:(NSString *)title
                                     andAction:(SEL)action
                                         style:(void (^)(UIButton *button))buttonStyle;
- (UIBarButtonItem *)hd_barButtonItemWithImage:(UIImage *)image
                                highlightImage:(UIImage *)highlightImage
                                     andAction:(SEL)action
                                         style:(void (^)(UIButton *button))buttonStyle;

@end

@interface UIViewController (HDLoadAnimationExtend)

@end

@interface UIViewController (HDAlertViewExtend)

@end