//
//  HABTextView.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-27.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE
@interface HABTextView : UITextView

@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

@end
