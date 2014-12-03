//
//  NSString+HABCrypto.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-3.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSString+HABCrypto.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (HABCrypto)

- (NSString *)stringFromMD5
{
    NSString *md5String = @"";
    if (![md5String isEqualToString:@""] || md5String.length == 0)
    {
        const char *value = [self UTF8String];
        unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];

        CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);

        NSMutableString *outputString =
            [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
        for (NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++)
        {
            [outputString appendFormat:@"%02x", outputBuffer[count]];
        }
        return outputString;
    }
    return md5String;
}

@end
