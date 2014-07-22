//
//  UIViewController+HABBase.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (HABBase)

#pragma mark
#pragma mark Common Animation

-(void)showLoadingAnimation;
-(void)showLoadingAnimationWithMessage:(NSString *)message;
-(void)showSuccessAnimation;
-(void)showSuccessAnimationWithMessage:(NSString *)message;
-(void)showErrorAnimation;
-(void)showErrorAnimationWithMessage:(NSString *)message;

-(void)hideLoadingAnimation;

/**
 *  NavigationBar titleView Style(Label) default is @"label-navTitle"
 *
 *  @return
 */
-(NSString *)styleClassNameForTitleLabel;

@end
