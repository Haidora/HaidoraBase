//
//  HABUtil_UI.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABUtil_UI.h"

@implementation HABUtil_UI

+(void)showAlertMessage:(NSString *)message
{
	[self showAlertMessageWithTitle:NSLocalizedString(@"Warning", @"")
						 andMessage:message];
}

+(void)showAlertMessageWithTitle:(NSString *)title
                      andMessage:(NSString *)message
{
	[self showAlertMessageWithTitle:title
						 andMessage:message
					 cancelBtnTitle:NSLocalizedString(@"Cancel", @"")
					  otherBtnTille:nil];
}

+(void)showAlertMessageWithTitle:(NSString *)title
					  andMessage:(NSString *)message
				  cancelBtnTitle:(NSString *)cancelTitle
				   otherBtnTille:(NSString *)otherTitle
{
	UIAlertView *alertMessageView = [[UIAlertView alloc]initWithTitle:title
                                                              message:message
                                                             delegate:nil
                                                    cancelButtonTitle:cancelTitle
                                                    otherButtonTitles:otherTitle,nil];
    [alertMessageView show];
}
@end
