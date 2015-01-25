//
//  NSDate+HABUtils.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-12-30.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSDate+HABUtils.h"

#define kHab_DefaultTimeFormat @"yyy-MM-dd HH:mm:ss"

@implementation NSDate (HABUtils)

- (NSString *)hab_DateWithFormat:(NSString *)format
{
    return [NSDate hab_Date:[NSDate date] withFormat:format];
}

+ (NSString *)hab_Date:(NSDate *)date withFormat:(NSString *)format
{
    format = format ?: kHab_DefaultTimeFormat;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *)hab_DateWithString:(NSString *)dateString withFormat:(NSString *)format
{
    format = format ?: kHab_DefaultTimeFormat;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}
@end
