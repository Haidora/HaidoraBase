//
//  NSString+HABUtils.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-19.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSString+HABUtils.h"
#import "HABMacro_Util.h"

@implementation NSString (HABUtils)

- (BOOL)isEmpty
{
    BOOL isEmpty = NO;
    if ([self isEqualToString:@""])
    {
        isEmpty = YES;
    }
    return isEmpty;
}

- (NSString *)hab_StringByTrimingWhitespace
{
    NSString *returnString;
    if ([self isEmpty])
    {
        returnString = self;
    }
    else
    {
        returnString = [self
            stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    return returnString;
}

#pragma mark
#pragma mark Deprecated Method

- (NSString *)trim
{
    return [self stringByTrimingWhitespace];
}

- (NSString *)stringByTrimingWhitespace
{
    return [self hab_StringByTrimingWhitespace];
}

@end
