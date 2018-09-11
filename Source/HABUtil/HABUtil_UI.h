//
//  HABUtil_UI.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <REValidation/REValidation.h>
#import "HABCoreMacros.h"

@interface HABUtil_UI : NSObject

+ (void)hab_ShowAlertMessage:(NSString *)message;

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title andMessage:(NSString *)message;

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title
                           andMessage:(NSString *)message
                       cancelBtnTitle:(NSString *)cancelTitle
                        otherBtnTille:(NSString *)otherTitle;

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title
                           andMessage:(NSString *)message
                       cancelBtnTitle:(NSString *)cancelTitle
                        otherBtnTille:(NSString *)otherTitle
                          clickAction:(void (^)(id view, NSInteger index))clickAction;

/**
 *  Check input For UITextField or UITextView
 *
 */
+ (BOOL)hab_CheckInputs:(NSArray *)inputs;

#pragma mark
#pragma mark Deprecated Method

+ (void)showAlertMessage:(NSString *)message
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_ShowAlertMessage:");

+ (void)showAlertMessageWithTitle:(NSString *)title
                       andMessage:(NSString *)message
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use hab_ShowAlertMessageWithTitle:andMessage:");

+ (void)showAlertMessageWithTitle:(NSString *)title
                       andMessage:(NSString *)message
                   cancelBtnTitle:(NSString *)cancelTitle
                    otherBtnTille:(NSString *)otherTitle
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use "
                                     "hab_ShowAlertMessageWithTitle:andMessage:"
                                     "cancelBtnTitle:otherBtnTille:");
@end
