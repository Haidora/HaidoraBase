//
//  NSDate+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import "NSDate+HDUtils.h"

@implementation NSDate (HDUtils)

@end

@implementation NSDate (HDFormatExtend)

+ (void)load
{
#ifdef DEBUG
#if !__has_include("DateTools.h")
    // https://github.com/MatthewYork/DateTools
    NSLog(@"日期处理:pod 'DateTools'");
#endif
#endif
}

@end