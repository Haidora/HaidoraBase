//
//  UIView+HABBundle.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-16.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HABBundle)

/**
 *  loadNibNamed by NSStringFromClass([self class])
 *
 *  @return UIView ("NSStringFromClass([self class])")
 */
+ (UIView *)viewFromNib;

/**
 *  loadNibView from bundle
 *
 *  @param bundle the nib bundle;
 *
 *  @return the nib uiview;
 */
+ (UIView *)viewFromNibByBundle:(NSBundle *)bundle;

@end
