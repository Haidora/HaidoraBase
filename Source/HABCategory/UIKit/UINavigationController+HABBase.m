//
//  UINavigationController+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UINavigationController+HABBase.h"
#import "HABMacro.h"
#import "UIViewController+HABBase.h"
#import <Aspects.h>

@implementation UINavigationController (HABBase)

+ (void)load
{
    NSError *error;
    [self aspect_hookSelector:@selector(pushViewController:animated:)
                  withOptions:AspectPositionAfter
                   usingBlock:^(id<AspectInfo> aspectInfo, UIViewController *viewController,
                                BOOL animated) {
                     UINavigationController *vc = (UINavigationController *)(aspectInfo.instance);
                     [vc habbase_pushViewController:viewController animated:animated];
                   } error:&error];
    if (error)
    {
        HABM_DLog(@"%@", error);
    }
}

- (void)habbase_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (IOS7_OR_LATER)
    {
        if ([self isCustomBackItem] &&
            [self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        {
            self.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

@end
