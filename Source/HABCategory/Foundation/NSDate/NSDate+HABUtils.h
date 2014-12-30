//
//  NSDate+HABUtils.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-12-30.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HABUtils)
/**
 *  Format NSDate with formatString
 *
 *  @param format Default is 'yyy-MM-dd hh:mm:ss'
 *
 */
- (NSString *)hab_DateWithFormat:(NSString *)format;
/**
 *  Format NSDate with formatString
 *
 *  @param date
 *  @param format Default is 'YYYY-MM-DD'
 *
 */
+ (NSString *)hab_Date:(NSDate *)date withFormat:(NSString *)format;
/**
 *  Format NSDate with dateString and formatString
 *
 *  @param dateString
 *  @param format Default is 'YYYY-MM-DD'
 *
 */
+ (NSDate *)hab_DateWithString:(NSString *)dateString withFormat:(NSString *)format;

@end
