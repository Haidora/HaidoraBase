//
//  NSString+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import "NSString+HDUtils.h"

@implementation NSString (HDUtilsPrivate)

- (BOOL)isEmpty
{
    BOOL isEmpty = NO;
    if ([self isEqualToString:@""])
    {
        isEmpty = YES;
    }
    return isEmpty;
}

@end

@implementation NSString (HDUtils)

- (NSString *)hd_stringByTrimingWhitespace
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

@end

@implementation NSString (HDCryptoExtend)

+ (void)load
{
#ifdef DEBUG
#if !__has_include("CocoaSecurity.h")
    // https://github.com/kelp404/CocoaSecurity
    NSLog(@"加密:pod 'CocoaSecurity'");
#endif
#endif
}

@end
