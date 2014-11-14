//
//  HABTextField.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-13.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

// IB_DESIGNABLE
@interface HABTextField : UITextField

@property (nonatomic, strong) IBInspectable NSString *suffix;
@property (nonatomic, strong) IBInspectable UIColor *suffixColor;
@property (nonatomic, assign) IBInspectable BOOL showSuffix;

@end
