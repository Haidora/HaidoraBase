//
//  UIView+HABBundle.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-16.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIView+HABBundle.h"

@implementation UIView (HABBundle)

+ (UIView *)viewFromNib
{
	return [self viewFromNibByBundle:[NSBundle mainBundle]];
}

+ (UIView *)viewFromNibByBundle:(NSBundle *)bundle
{
	NSArray *views = [bundle loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
	return [views objectAtIndex:0];
}

@end
