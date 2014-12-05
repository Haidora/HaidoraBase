//
//  UIView+HABShadow.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-15.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//
// @link https://github.com/Seitk/UIView-Shadow-Maker

#import <UIKit/UIKit.h>
#import "HABCoreMacros.h"

typedef NS_OPTIONS(NSUInteger, HABShadowDirection){
    HABShadowDirectionTop = 1 << 0, HABShadowDirectionBottom = 1 << 1,
    HABShadowDirectionLeft = 1 << 2, HABShadowDirectionRight = 1 << 3};

@interface UIView (HABShadow)

- (void)hab_MakeInsetShadown;

- (void)hab_MakeInsetShadownWithRadius:(CGFloat)radius;

- (void)hab_MakeInsetShadownWithRadius:(CGFloat)radius
                                 color:(UIColor *)color
                             direction:(HABShadowDirection)direction;

#pragma mark
#pragma mark Deprecated Method

- (void)makeInsetShadown HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_MakeInsetShadown");

- (void)makeInsetShadownWithRadius:(CGFloat)radius
                             alpha:(CGFloat)alpha
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_MakeInsetShadownWithRadius:");

- (void)makeInsetShadownWithRadius:(CGFloat)radius
                             color:(UIColor *)color
                         direction:(HABShadowDirection)direction
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use makeInsetShadownWithRadius:color:direction:");

@end
