//
//  NSString+HABUtils.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-19.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HABCoreMacros.h"

@interface NSString (HABUtils)

/**
 *  trim whitespaceAndNewlineCharacterSet
 *
 *  @return new trim String
 */
- (NSString *)trim HAB_DEPRECATED_METHOD_NEW_METHOD("use - stringByTrimingWhitespace");

/**
 *  trim Whitespace
 *
 *  @return new trim String
 */
- (NSString *)stringByTrimingWhitespace;

@end
