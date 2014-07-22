//
//  UIViewController+HABBarButton.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIViewController+HABBarButton.h"
#import <NUIRenderer.h>

@implementation UIViewController (HABBarButton)

-(void)addDefaultBackBar:(SEL)action
{
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setTitle:NSLocalizedString(@"Back", @"返回") forState:UIControlStateNormal];
    [buttonItem addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [NUIRenderer renderButton:buttonItem withClass:self.styleClassNameForNavBackItem];
    [buttonItem sizeToFit];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    self.navigationItem.leftBarButtonItem = barItem;
}

-(void)addLeftBarButtonWithTitle:(NSString *)title andAction:(SEL)action
{
    self.navigationItem.leftBarButtonItem = [self barButtonItemWithTitle:title
                                                               andAction:action];
}

-(void)addRightBarButtonWithTitle:(NSString *)title andAction:(SEL)action
{
    self.navigationItem.rightBarButtonItem = [self barButtonItemWithTitle:title
                                                                andAction:action];
}

-(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                 andAction:(SEL)action
{
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setTitle:title forState:UIControlStateNormal];
    [buttonItem addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    [NUIRenderer renderButton:buttonItem withClass:self.styleClassNameForNavBarItem];    
    [buttonItem sizeToFit];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    return barItem;
}

-(UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                 andAction:(SEL)action
{
    UIButton *buttonItem = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonItem setImage:image forState:UIControlStateNormal];
    [buttonItem sizeToFit];
    [buttonItem addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:buttonItem];
    return barItem;
}

-(NSString *)styleClassNameForNavBackItem
{
    return @"button-navBarBackItem";
}

-(NSString *)styleClassNameForNavBarItem
{
    return @"button-navBarItem";
}


@end
