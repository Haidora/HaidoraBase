//
//  TestUIAlertView.m
//  HaidoraBase
//
//  Created by DaiLingchi on 15-1-13.
//  Copyright (c) 2015年 Haidora. All rights reserved.
//

#import "TestUIAlertView.h"
#import "UIAlertView+HABBase.h"

@implementation TestUIAlertView

- (IBAction)test:(id)sender
{
    UIAlertView *alertView =
        [[UIAlertView alloc] initWithTitle:@"test"
                                   message:@"Message"
                               clickAction:^(UIAlertView *alertView, NSInteger index) {

                               }
                         cancelButtonTitle:@"cancel"
                         otherButtonTitles:@"1", @"2", @"3", nil];
    [alertView show];
}

@end
