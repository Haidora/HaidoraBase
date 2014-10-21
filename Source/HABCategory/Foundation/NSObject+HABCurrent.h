//
//  NSObject+HABCurrent.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-21.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HABCurrent)

#pragma mark
#pragma mark HABCurrent

-(UIView *)currentView;
-(UIWindow *)currentWindow;
-(UIViewController *)currentController;
-(UIViewController *)currentControllerFor:(UIViewController *)viewController;

@end
