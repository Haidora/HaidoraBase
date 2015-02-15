//
//  NSObject+HABCurrent.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-21.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HABCoreMacros.h"

@interface NSObject (HABCurrent)

#pragma mark
#pragma mark HABCurrent

/**
 *  Get currentView
 *
 *  @return
 */
- (UIView *)currentView_HABCurrent;

/**
 *  Get currentWindow
 *
 *  @return
 */
- (UIWindow *)currentWindow_HABCurrent;

/**
 *  Get currentController
 *
 *  @return
 */
- (UIViewController *)currentController_HABCurrent;

/**
 *  Get currentControllerFor
 *
 *  @param viewController
 *
 *  @return
 */
- (UIViewController *)currentControllerFor_HABCurrent:(UIViewController *)viewController;

#pragma mark
#pragma mark Deprecated Method

- (UIView *)hab_CurrentView HAB_DEPRECATED_METHOD_NEW_METHOD("-use currentView_HABCurrent");
- (UIWindow *)hab_CurrentWindow HAB_DEPRECATED_METHOD_NEW_METHOD("-use currentWindow_HABCurrent");
- (UIViewController *)hab_CurrentController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use currentController_HABCurrent");
- (UIViewController *)hab_CurrentControllerFor:(UIViewController *)viewController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use currentControllerFor_HABCurrent");

- (UIView *)currentView HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentView");
- (UIWindow *)currentWindow HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentWindow");
- (UIViewController *)currentController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentController");
- (UIViewController *)currentControllerFor:(UIViewController *)viewController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentControllerFor:");

@end
