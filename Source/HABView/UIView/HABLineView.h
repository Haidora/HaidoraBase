//
//  HABLineView.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-25.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HABCoreMacros.h"

// IB_DESIGNABLE
@interface HABLineView : UIView

/**
 *  Line Height default is self height
 */
@property (nonatomic, assign) IBInspectable CGFloat lineHeight;

/**
 *  Line Interval default is 0.
 */
@property (nonatomic, assign) IBInspectable CGFloat lineInterval;

/**
 *  Line Inset Left default is 0.
 */
@property (nonatomic, assign) IBInspectable CGFloat lineInsetLeft;

/**
 *  Line Inset Right default is 0.
 */
@property (nonatomic, assign) IBInspectable CGFloat lineInsetRight;

/**
 *  Line Color Default is self.tintColor
 */
@property (nonatomic, strong) IBInspectable UIColor *lineColor;

@end
