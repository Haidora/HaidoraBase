//
//  HABUtil_UI.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABUtil_UI.h"
#import "UITextField+HABValidate.h"
#import "UITextView+HABValidate.h"

#import "UIAlertView+HABBase.h"

@implementation HABUtil_UI

+ (void)hab_ShowAlertMessage:(NSString *)message
{
    [self hab_ShowAlertMessageWithTitle:NSLocalizedString(@"Warning", @"") andMessage:message];
}

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title andMessage:(NSString *)message
{
    [self hab_ShowAlertMessageWithTitle:title
                             andMessage:message
                         cancelBtnTitle:NSLocalizedString(@"Cancel", @"")
                          otherBtnTille:nil];
}

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title
                           andMessage:(NSString *)message
                       cancelBtnTitle:(NSString *)cancelTitle
                        otherBtnTille:(NSString *)otherTitle
{
    [self hab_ShowAlertMessageWithTitle:title
                             andMessage:message
                         cancelBtnTitle:cancelTitle
                          otherBtnTille:otherTitle
                            clickAction:nil];
}

+ (void)hab_ShowAlertMessageWithTitle:(NSString *)title
                           andMessage:(NSString *)message
                       cancelBtnTitle:(NSString *)cancelTitle
                        otherBtnTille:(NSString *)otherTitle
                          clickAction:(void (^)(id view, NSInteger index))clickAction
{
    UIAlertView *alertMessageView = [[UIAlertView alloc] initWithTitle:title
                                                               message:message
                                                           clickAction:clickAction
                                                     cancelButtonTitle:cancelTitle
                                                     otherButtonTitles:otherTitle, nil];

    [alertMessageView show];
}

+ (BOOL)hab_CheckInputs:(NSArray *)inputs
{
    BOOL isError = YES;
    NSMutableArray *validatorErros = [NSMutableArray array];
    [inputs enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UITextField class]])
        {
            UITextField *input = obj;
            NSArray *erros = [REValidation validateObject:input.text
                                                     name:input.habValidatorName
                                               validators:input.habvalidators];
            [validatorErros addObjectsFromArray:erros];
        }
        else if ([obj isKindOfClass:[UITextView class]])
        {
            UITextView *input = obj;
            NSArray *erros = [REValidation validateObject:input.text
                                                     name:input.habValidatorName
                                               validators:input.habvalidators];
            [validatorErros addObjectsFromArray:erros];
        }
    }];
    if (validatorErros.count > 0)
    {
        isError = NO;
        NSString *erroString = [NSString string];
        for (NSError *error in validatorErros)
        {
            erroString = [erroString stringByAppendingFormat:@"%@\n", error.localizedDescription];
        }
        [self hab_ShowAlertMessage:erroString];
    }

    return isError;
}

#pragma mark
#pragma mark Deprecated Method
+ (void)showAlertMessage:(NSString *)message
{
    [self hab_ShowAlertMessage:message];
}

+ (void)showAlertMessageWithTitle:(NSString *)title andMessage:(NSString *)message
{
    [self hab_ShowAlertMessageWithTitle:title andMessage:message];
}

+ (void)showAlertMessageWithTitle:(NSString *)title
                       andMessage:(NSString *)message
                   cancelBtnTitle:(NSString *)cancelTitle
                    otherBtnTille:(NSString *)otherTitle
{
    [self hab_ShowAlertMessageWithTitle:title
                             andMessage:message
                         cancelBtnTitle:cancelTitle
                          otherBtnTille:otherTitle];
}
@end
