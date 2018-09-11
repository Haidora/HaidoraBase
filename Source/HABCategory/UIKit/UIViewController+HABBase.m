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
#import <JRSwizzle/JRSwizzle.h>
#import <NUI/NUIRenderer.h>
#import <MBProgressHUD/MBProgressHUD.h>

#define kTitleLabel_HABBase @"kTitleLabel_HABBase"
#define kCurrent_HABBase  @"kCurrent_HABBase"

@interface UIViewController (HABBasePrivate)

@property (nonatomic, assign) BOOL current;
/**
 * custom for NavigationBar titleView
 */
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation UIViewController (HABBasePrivate)

@dynamic titleLabel;
@dynamic current;

+(void)load
{
    HABM_DLog(@"UIViewController (HABBase) JRSwizzle start");
    NSError *error;
    [self jr_swizzleMethod:@selector(viewDidLoad) withMethod:@selector(habbase_viewDidLoad) error:&error];
    if (error)
    {
        HABM_DLog(@"%@",error.domain);
    }
	[self jr_swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(habbase_viewWillAppear:) error:&error];
    if (error)
    {
        HABM_DLog(@"%@",error.domain);
    }
	[self jr_swizzleMethod:@selector(viewWillDisappear:) withMethod:@selector(habbase_viewWillDisappear:) error:&error];
    if (error)
    {
        HABM_DLog(@"%@",error.domain);
    }
    [self jr_swizzleMethod:@selector(setTitle:) withMethod:@selector(habbase_setTitle:) error:&error];
    if (error)
    {
        HABM_DLog(@"%@",error.domain);
    }
    HABM_DLog(@"UIViewController (HABBase) JRSwizzle end");
}

-(void)habbase_viewDidLoad
{
    [self habbase_viewDidLoad];
	//Nav Custom TitleLabel
    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [NUIRenderer renderLabel:self.titleLabel withClass:self.styleClassNameForTitleLabel];
    self.navigationItem.titleView = self.titleLabel;
	
	//Nav BackItem
	if ([self isCustomBackItem] && self.navigationController.viewControllers.count>1)
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
    [self habbase_viewWillAppear:animated];
    self.titleLabel.text = self.title;
    [self.titleLabel sizeToFit];
	self.current = YES;
}

-(void)habbase_viewWillDisappear:(BOOL)animated
{
	[self habbase_viewWillDisappear:animated];
	self.current = NO;
}

-(void)habbase_setTitle:(NSString *)title
{
    [self habbase_setTitle:title];
    self.titleLabel.text = self.title;
    [self.titleLabel sizeToFit];
}

#pragma mark
#pragma mark Action

-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark
#pragma mark Get/Set

-(void)setTitleLabel:(UILabel *)titleLabel
{
    objc_setAssociatedObject(self, kTitleLabel_HABBase, titleLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)titleLabel
{
    return objc_getAssociatedObject(self, kTitleLabel_HABBase);
}

-(void)setCurrent:(BOOL)current
{
	objc_setAssociatedObject(self, kCurrent_HABBase, @(current), OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)current
{
	return [objc_getAssociatedObject(self, kCurrent_HABBase) boolValue];
}

@end


@implementation UIViewController (HABBase)

#pragma mark
#pragma mark Common Animation

-(void)hidHubView:(MBProgressHUD *)hud
{
    hud.margin = 10.0f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

-(void)showLoadingAnimation
{
    [self showLoadingAnimationWithMessage:NSLocalizedString(@"Loading...", @"加载中...")];
}

-(void)showLoadingAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = message;
}

-(void)showSuccessAnimation
{
    [self showSuccessAnimationWithMessage:NSLocalizedString(@"Success", @"成功")];
}

-(void)showSuccessAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeCustomView;
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HaidoraBase.bundle/icon_success"]];
    hud.labelText = message;
    //hidden
    [self hidHubView:hud];
}

-(void)showErrorAnimation
{
    [self showErrorAnimationWithMessage:NSLocalizedString(@"Error", @"错误")];
}

-(void)showErrorAnimationWithMessage:(NSString *)message
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = message;
    //hidden
    [self hidHubView:hud];
}


-(void)hideLoadingAnimation
{
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

#pragma mark
#pragma mark Config

-(BOOL)isCustomBackItem
{
	return NO;
}

-(BOOL)isCurrentView
{
	return self.current;
}

#pragma mark
#pragma mark Style

-(NSString *)styleClassNameForTitleLabel
{
    return @"label-navTitle";
}

@end
