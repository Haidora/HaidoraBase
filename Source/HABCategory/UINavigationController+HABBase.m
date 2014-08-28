//
//  UINavigationController+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UINavigationController+HABBase.h"
#import "HABCoreMacros.h"
#import <JRSwizzle.h>

@implementation UINavigationController (HABBase)

+(void)load
{
    HAB_DLog(@"UINavigationController (HABBase) JRSwizzle start");
    NSError *error;
    [self jr_swizzleMethod:@selector(pushViewController:animated:)
                withMethod:@selector(habbase_pushViewController:animated:)
                     error:&error];
    if (error)
    {
        HAB_DLog(@"%@",error.domain);
    }
    HAB_DLog(@"UINavigationController (HABBase) JRSwizzle end");
}

-(void)habbase_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self habbase_pushViewController:viewController animated:animated];
    //fix ios7 later
#ifdef __IPHONE_7_0
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
    {
        self.interactivePopGestureRecognizer.delegate = nil;
    }
#endif
}

@end
