//
//  UIAlertView+HABBase.h
//  HaidoraBase
//
//  Created by DaiLingchi on 15-1-13.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertView (HABBase)

@end

#pragma mark
#pragma mark UIAlertView Action Block

@interface UIAlertView (HABBlocks)

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                  clickAction:(void (^)(UIAlertView *alertView, NSInteger index))clickAction
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION;

@end
