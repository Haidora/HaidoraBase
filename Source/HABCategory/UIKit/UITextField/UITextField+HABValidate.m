//
//  UITextField+HABValidate.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-10.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UITextField+HABValidate.h"
#import <objc/runtime.h>

@implementation UITextField (HABValidate)

HABM_PropertyDynamic_DefineS(NSString, habValidatorName);
HABM_PropertyDynamic_DefineS(NSArray, habValidators);

@end
