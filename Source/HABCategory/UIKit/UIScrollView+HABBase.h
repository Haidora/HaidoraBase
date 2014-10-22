//
//  UIScrollView+HABBase.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (HABBase)

#pragma mark
#pragma mark ContentSize
//@link
// https://github.com/michaeltyson/TPKeyboardAvoiding/blob/master/TPKeyboardAvoiding/UIScrollView%2BTPKeyboardAvoidingAdditions.m#L205

/**
 *  Auto set scrollview ContentSize
 */
- (void)contentSizeToFit;

/**
 *  Auto set scrollview ContentSize with bottom and right margin
 *
 *  @param margin
 */
- (void)contentSizeToFit:(CGFloat)margin;

@end
