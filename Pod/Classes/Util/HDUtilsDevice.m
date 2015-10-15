//
//  HDUtilsDevice.m
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import "HDUtilsDevice.h"

@implementation HDUtilsDevice

#pragma mark
#pragma mark System Info.

+ (NSString *)osVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [NSString stringWithFormat:@"%@ %@", [UIDevice currentDevice].systemName,
                                      [UIDevice currentDevice].systemVersion];
#else
    return nil;
#endif
}

+ (NSString *)appVersion
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
    NSString *value = [[NSBundle mainBundle] infoDictionary][@"CFBundleShortVersionString"];
    return value;
#else
    return nil;
#endif
}

+ (NSString *)appBuild
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR || TARGET_OS_MAC)
    NSString *value = [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleVersionKey];
    if (nil == value || 0 == value.length)
    {
        value = [[NSBundle mainBundle] infoDictionary][@"CFBundleVersion"];
    }
    return value;
#else
    return nil;
#endif
}

+ (NSString *)appIdentifier
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    static NSString *identifierValue = nil;
    if (nil == identifierValue)
    {
        identifierValue =
            [[NSBundle mainBundle] infoDictionary][(NSString *)kCFBundleIdentifierKey];
    }
    return identifierValue;
#else
    return nil;
#endif
}

+ (NSString *)deviceModel
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [UIDevice currentDevice].model;
#else
    return nil;
#endif
}

#pragma mark
#pragma mark Device

+ (BOOL)isPhoneDevice
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSString *deviceType = [UIDevice currentDevice].model;

    if ([deviceType rangeOfString:@"iPhone" options:NSCaseInsensitiveSearch].length > 0 ||
        [deviceType rangeOfString:@"iPod" options:NSCaseInsensitiveSearch].length > 0 ||
        [deviceType rangeOfString:@"iTouch" options:NSCaseInsensitiveSearch].length > 0)
    {
        return YES;
    }
#endif

    return NO;
}

+ (BOOL)isPadDevice
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    NSString *deviceType = [UIDevice currentDevice].model;

    if ([deviceType rangeOfString:@"iPad" options:NSCaseInsensitiveSearch].length > 0)
    {
        return YES;
    }
#endif

    return NO;
}

@end
