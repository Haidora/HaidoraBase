//
//  UITextView+HABValidate.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-10.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HABMacro_Util.h"

@interface UITextView (HABValidate)

HABM_PropertyDynamic_AssignS(NSString, habValidatorName);
HABM_PropertyDynamic_AssignS(NSArray, habvalidators);

@end
