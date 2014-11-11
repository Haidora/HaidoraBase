//
//  HABUtil_Device.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABUtil_Device.h"

@implementation HABUtil_Device

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

+ (BOOL)isPhone35
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [self isScreenSize:CGSizeMake(320, 480)];
#else
    return NO;
#endif
}

+ (BOOL)isPhoneRetina35
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [self isScreenSize:CGSizeMake(640, 960)];
#else
    return NO;
#endif
}

+ (BOOL)isPhoneRetina4
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [self isScreenSize:CGSizeMake(640, 1136)];
#else
    return NO;
#endif
}

+ (BOOL)isPad
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [self isScreenSize:CGSizeMake(768, 1024)];
#else
    return NO;
#endif
}

+ (BOOL)isPadRetina
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    return [self isScreenSize:CGSizeMake(1536, 2048)];
#else
    return NO;
#endif
}

+ (BOOL)isScreenSize:(CGSize)size
{
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)])
    {
        CGSize screenSize = [UIScreen mainScreen].currentMode.size;
        CGSize size2 = CGSizeMake(size.height, size.width);

        if (CGSizeEqualToSize(size, screenSize) || CGSizeEqualToSize(size2, screenSize))
        {
            return YES;
        }
    }

    return NO;
#else
    return NO;
#endif
}

#pragma mark
#pragma mark Device Action
+ (void)callToPhone:(NSString *)telPhone
{
    NSString *telString = [NSString stringWithFormat:@"tel://%@", telPhone];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telString]];
}

@end
