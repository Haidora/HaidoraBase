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

- (NSDate *)dateWithFormatString_HABUtils:(NSString *)formatString
{
    NSString *format = formatString;
    format = format ?: kHab_DefaultTimeFormat;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:format];
    NSString *dataString = [formatter stringFromDate:self];
    return [formatter dateFromString:dataString];
}

- (NSString *)dateWithFormat_HABUtils:(NSString *)format
{
    return [NSDate date_HABUtils:[NSDate date] withFormat:format];
}

+ (NSString *)date_HABUtils:(NSDate *)date withFormat:(NSString *)format
{
    format = format ?: kHab_DefaultTimeFormat;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:format];
    return [formatter stringFromDate:date];
}

+ (NSDate *)dateWithString_HABUtils:(NSString *)dateString withFormat:(NSString *)format
{
    format = format ?: kHab_DefaultTimeFormat;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:format];
    return [formatter dateFromString:dateString];
}

#pragma mark
#pragma mark Specified Date

- (NSDate *)dateWithSpecifiedYear_HABUtils:(NSInteger)yearNum
{
    return [self dateWithSpecifiedYear_HABUtils:yearNum month:0 day:0];
}

- (NSDate *)dateWithSpecifiedMonth_HABUtils:(NSInteger)monthNum
{
    return [self dateWithSpecifiedYear_HABUtils:0 month:monthNum day:0];
}

- (NSDate *)dateWithSpecifiedDay_HABUtils:(NSInteger)dayNum
{
    return [self dateWithSpecifiedYear_HABUtils:0 month:0 day:dayNum];
}

- (NSDate *)dateWithSpecifiedYear_HABUtils:(NSInteger)yearNum
                                     month:(NSInteger)monthNum
                                       day:(NSInteger)dayNum
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *compenents = [[NSDateComponents alloc] init];
    [compenents setYear:yearNum];
    [compenents setMonth:monthNum];
    [compenents setDay:dayNum];
    return [calendar dateByAddingComponents:compenents toDate:self options:0];
}

#pragma mark
#pragma mark Deprecated Method

- (NSString *)hab_DateWithFormat:(NSString *)format
{
    return [self dateWithFormat_HABUtils:format];
}

+ (NSString *)hab_Date:(NSDate *)date withFormat:(NSString *)format
{
    return [self date_HABUtils:date withFormat:format];
}

+ (NSDate *)hab_DateWithString:(NSString *)dateString withFormat:(NSString *)format
{
    return [self dateWithString_HABUtils:dateString withFormat:format];
}
@end
