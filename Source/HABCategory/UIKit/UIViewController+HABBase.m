//
//  UIViewController+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIViewController+HABBase.h"
#import "UIViewController+HABBarButton.h"
#import "HABMacro.h"
#import <objc/runtime.h>
#import <Aspects.h>
#import <NUIRenderer.h>
#import <MBProgressHUD.h>

#define kTitleLabel_HABBase @"kTitleLabel_HABBase"
#define kCurrent_HABBase @"kCurrent_HABBase"

@interface UIViewController (HABBasePrivate)

@property (nonatomic, assign) BOOL current;

@end

@implementation UIViewController (HABBasePrivate)

@dynamic current;

+ (void)load
{
    NSError *error;
    [self aspect_hookSelector:@selector(viewDidLoad)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id<AspectInfo> aspectInfo) {
                     UIViewController *vc = (UIViewController *)(aspectInfo.instance);
                     [vc habbase_viewDidLoad];
                   } error:&error];
    if (error)
    {
        HABM_DLog(@"%@", error);
    }
    [self aspect_hookSelector:@selector(viewWillAppear:)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
                     UIViewController *vc = (UIViewController *)(aspectInfo.instance);
                     [vc habbase_viewWillAppear:animated];
                   } error:&error];
    if (error)
    {
        HABM_DLog(@"%@", error);
    }
    [self aspect_hookSelector:@selector(viewWillDisappear:)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
                     UIViewController *vc = (UIViewController *)(aspectInfo.instance);
                     [vc habbase_viewWillDisappear:animated];
                   } error:&error];
    if (error)
    {
        HABM_DLog(@"%@", error);
    }
}

- (void)habbase_viewDidLoad
{
    // Nav BackItem
    if ([self isCustomBackItem] && self.navigationController.viewControllers.count > 1)
    {
        [self addDefaultBackBar:@selector(backAction)];
    }
    if (IOS7_OR_LATER)
    {
        if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
        {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
    }
}

- (void)habbase_viewWillAppear:(BOOL)animated
{
    self.current = YES;
}

- (void)habbase_viewWillDisappear:(BOOL)animated
{
    self.current = NO;
}

#pragma mark
#pragma mark Action

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark
#pragma mark Get/Set

- (void)setCurrent:(BOOL)current
{
    objc_setAssociatedObject(self, kCurrent_HABBase, @(current), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)current
{
    return [objc_getAssociatedObject(self, kCurrent_HABBase) boolValue];
}

@end

@implementation UIViewController (HABBase)

#pragma mark
#pragma mark Common Animation

- (void)hidHubView:(MBProgressHUD *)hud
{
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

- (void)showLoadingAnimation
{
    [self showLoadingAnimationWithMessage:NSLocalizedString(@"Loading...", @"加载中...")];
}

- (void)showLoadingAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = message;
}

- (void)showSuccessAnimation
{
    [self showSuccessAnimationWithMessage:NSLocalizedString(@"Success", @"成功")];
}

- (void)showSuccessAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView =
        [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"HaidoraBase.bundle/icon_success"]];
    hud.labelText = message;
    // hidden
    [self hidHubView:hud];
}

- (void)showErrorAnimation
{
    [self showErrorAnimationWithMessage:NSLocalizedString(@"Error", @"错误")];
}

- (void)showErrorAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    // hidden
    [self hidHubView:hud];
}

- (void)hideLoadingAnimation
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

#pragma mark
#pragma mark Config

- (BOOL)isCustomBackItem
{
    return NO;
}

- (BOOL)isCurrentView
{
    return self.current;
}

#pragma mark
#pragma mark Style

- (NSString *)styleClassNameForTitleLabel
{
    return @"label-navTitle";
}

@end
