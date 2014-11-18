//
//  HABMacro_Util.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#ifndef HaidoraBase_HABMacro_Util_h
#define HaidoraBase_HABMacro_Util_h

#pragma mark
#pragma mark WeakSelf

#define HABM_WeakSelf __weak __typeof(self) weakSelf = self;

#pragma mark
#pragma mark DLog

#ifdef DEBUG
#define HABM_DLog(format, ...)                                                                     \
    {                                                                                              \
        fprintf(stderr, "<%s : %d> %s\n",                                                          \
                [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],         \
                __LINE__, __func__);                                                               \
        (NSLog)((format), ##__VA_ARGS__);                                                          \
        fprintf(stderr, "-------\n");                                                              \
    }
#else
#define HABM_DLog(format, ...)
#endif

#pragma mark
#pragma mark IOS Version

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS_Version ([[UIDevice currentDevice] systemVersion])
#define IOS7_OR_LATER ([IOS_Version compare:@"7.0"] != NSOrderedAscending)

#else

#define IOS7_OR_LATER (NO)

#endif

#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)

#define IOS_OR_LATER(systemVersion) ([IOS_Version compare:systemVersion] != NSOrderedAscending)

#else

#define IOS_OR_LATER (NO)

#endif

#pragma mark
#pragma mark Utils

#define HABM_StringWithFormat(format, ...) [NSString stringWithFormat:format, ##__VA_ARGS__]
#define HABM_LocalizedStringWithFormat(format, ...)                                                \
    [NSString localizedStringWithFormat:format, ##__VA_ARGS__]

#endif
