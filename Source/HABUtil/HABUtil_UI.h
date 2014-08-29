//
//  HABUtil_UI.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HABUtil_UI : NSObject

+(void)showAlertMessage:(NSString *)message;

+(void)showAlertMessageWithTitle:(NSString *)title
                      andMessage:(NSString *)message;

+(void)showAlertMessageWithTitle:(NSString *)title
					  andMessage:(NSString *)message
				  cancelBtnTitle:(NSString *)cancelTitle
				   otherBtnTille:(NSString *)otherTitle;
@end
