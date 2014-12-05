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

- (UIView *)hab_CurrentView;
- (UIWindow *)hab_CurrentWindow;
- (UIViewController *)hab_CurrentController;
- (UIViewController *)hab_CurrentControllerFor:(UIViewController *)viewController;

#pragma mark
#pragma mark Deprecated Method
- (UIView *)currentView HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentView");
- (UIWindow *)currentWindow HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentWindow");
- (UIViewController *)currentController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentController");
- (UIViewController *)currentControllerFor:(UIViewController *)viewController
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_CurrentControllerFor:");

@end
