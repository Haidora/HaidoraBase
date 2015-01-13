//
//  UIAlertView+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 15-1-13.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "UIAlertView+HABBase.h"
#import <objc/runtime.h>

@implementation UIAlertView (HABBase)

@end

#pragma mark
#pragma mark UIAlertView (HABBlocks)

static char kHab_clickAction;

@interface UIAlertView ()

@property (nonatomic, copy) void (^clickAction)(UIAlertView *alertView, NSInteger index);

@end

@implementation UIAlertView (HABBlocks)

- (instancetype)initWithTitle:(NSString *)title
                      message:(NSString *)message
                  clickAction:(void (^)(UIAlertView *alertView, NSInteger index))clickAction
            cancelButtonTitle:(NSString *)cancelButtonTitle
            otherButtonTitles:(NSString *)otherButtonTitles, ... NS_REQUIRES_NIL_TERMINATION
{
    self = [self initWithTitle:title
                       message:message
                      delegate:self
             cancelButtonTitle:cancelButtonTitle
             otherButtonTitles:nil];
    if (self)
    {
        self.clickAction = clickAction;
        NSMutableArray *buttons = [NSMutableArray new];
        if (otherButtonTitles)
        {
            [buttons addObject:otherButtonTitles];

            NSString *buttonTitle;
            va_list argumentList;
            va_start(argumentList, otherButtonTitles);
            while ((buttonTitle = va_arg(argumentList, NSString *)))
            {
                [buttons addObject:buttonTitle];
            }
            va_end(argumentList);
        }

        [buttons enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [self addButtonWithTitle:obj];
        }];
    }
    return self;
}

#pragma mark
#pragma mark Setter/Getter

- (void)setClickAction:(void (^)(UIAlertView *, NSInteger))clickAction
{
    objc_setAssociatedObject(self, &kHab_clickAction, clickAction, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(UIAlertView *, NSInteger))clickAction
{
    return objc_getAssociatedObject(self, &kHab_clickAction);
}

#pragma mark
#pragma mark UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.clickAction)
    {
        self.clickAction(alertView, buttonIndex);
    }
}

@end
