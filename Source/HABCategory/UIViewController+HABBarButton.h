//
//  UIViewController+HABBarButton.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  UIBarButtonItem custom with UIButton
 */
@interface UIViewController (HABBarButton)

/**
 *  NSLocalizedString(@"Back", @"返回")
 */
-(void)addDefaultBackBar:(SEL)action;

/**
 *  self.navigationItem.leftBarButtonItem
 *
 *  @param title
 *  @param action
 */
-(void)addLeftBarButtonWithTitle:(NSString *)title andAction:(SEL)action;

/**
 *  self.navigationItem.rightBarButtonItem
 *
 *  @param title
 *  @param action
 */
-(void)addRightBarButtonWithTitle:(NSString *)title andAction:(SEL)action;

/**
 *  Generate UIBarButtonItem with title
 *
 *  @param title
 *  @param action
 */
-(UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                 andAction:(SEL)action;
/**
 *  Generate UIBarButtonItem with image
 *
 *  @param image
 *  @param action
 */
-(UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                                 andAction:(SEL)action;

#pragma mark
#pragma mark Nui Style
/**
 *  NavBackItem Style(Button) default is @"button-navBarBackItem"
 *
 */
-(NSString *)styleClassNameForNavBackItem;

/**
 *  NavBarItem Style(Button) default is @"button-navBarItem"
 *
 *  @return
 */
-(NSString *)styleClassNameForNavBarItem;

@end
