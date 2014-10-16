//
//  AliginLabel.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-4.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//
//@link http://stackoverflow.com/questions/2850879/how-to-make-a-uilabel-which-adjusts-its-text-to-the-upper-left/2850923#2850923

#import "HABAliginLabel.h"

@implementation HABAliginLabel

-(void) drawTextInRect:(CGRect)inFrame
{
    CGRect draw = [self textRectForBounds:inFrame limitedToNumberOfLines:[self numberOfLines]];
    draw.origin = CGPointZero;
    [super drawTextInRect:draw];
}

@end
