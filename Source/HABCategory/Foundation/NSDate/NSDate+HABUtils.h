//
//  NSDate+HABUtils.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-12-30.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HABCoreMacros.h"

@interface NSDate (HABUtils)

/**
 *  Format NSDate with formatString
 *
 *  @param format Default is 'yyy-MM-dd hh:mm:ss'
 *
 */
- (NSString *)dateWithFormat_HABUtils:(NSString *)format;
/**
 *  Format NSDate with formatString
 *
 *  @param date
 *  @param format Default is 'YYYY-MM-DD'
 *
 */
+ (NSString *)date_HABUtils:(NSDate *)date withFormat:(NSString *)format;
/**
 *  Format NSDate with dateString and formatString
 *
 *  @param dateString
 *  @param format Default is 'YYYY-MM-DD'
 *
 */
+ (NSDate *)dateWithString_HABUtils:(NSString *)dateString withFormat:(NSString *)format;

#pragma mark
#pragma mark Deprecated Method

- (NSString *)hab_DateWithFormat:(NSString *)format
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use dateWithFormat_HABUtils:");
+ (NSString *)hab_Date:(NSDate *)date
            withFormat:(NSString *)format
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use date_HABUtils:withFormat:");
+ (NSDate *)hab_DateWithString:(NSString *)dateString
                    withFormat:(NSString *)format
    HAB_DEPRECATED_METHOD_NEW_METHOD("-use dateWithString_HABUtils:withFormat:");

@end
