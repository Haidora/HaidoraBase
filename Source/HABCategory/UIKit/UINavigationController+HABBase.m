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
#import <JRSwizzle/JRSwizzle.h>

@implementation UINavigationController (HABBase)

+(void)load
{
    HABM_DLog(@"UINavigationController (HABBase) JRSwizzle start");
    NSError *error;
    [self jr_swizzleMethod:@selector(pushViewController:animated:)
                withMethod:@selector(habbase_pushViewController:animated:)
                     error:&error];
    if (error)
    {
        HABM_DLog(@"%@",error.domain);
    }
    HABM_DLog(@"UINavigationController (HABBase) JRSwizzle end");
}

-(void)habbase_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [self habbase_pushViewController:viewController animated:animated];

	if (IOS7_OR_LATER)
	{		
		if ([self isCustomBackItem] &&[self respondsToSelector:@selector(interactivePopGestureRecognizer)])
		{
			self.interactivePopGestureRecognizer.delegate = nil;
		}
	}
}

@end
