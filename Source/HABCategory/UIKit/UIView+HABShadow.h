//
//  UIView+HABShadow.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-15.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//
// @link https://github.com/Seitk/UIView-Shadow-Maker

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, HABShadowDirection)
{
	HABShadowDirectionTop      = 1<<0,
	HABShadowDirectionBottom   = 1<<1,
	HABShadowDirectionLeft     = 1<<2,
	HABShadowDirectionRight    = 1<<3
};

@interface UIView (HABShadow)

-(void)makeInsetShadown;

-(void)makeInsetShadownWithRadius:(CGFloat)radius
							alpha:(CGFloat)alpha;

-(void)makeInsetShadownWithRadius:(CGFloat)radius
							color:(UIColor *)color
						direction:(HABShadowDirection)direction;
@end
