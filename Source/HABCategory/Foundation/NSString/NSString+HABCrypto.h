//
//  NSString+HABCrypto.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-3.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HABCrypto)

- (NSString *)hab_StringFromMD5;

#pragma mark
#pragma mark Deprecated Method

- (NSString *)stringFromMD5 HAB_DEPRECATED_METHOD_NEW_METHOD("use - hab_StringFromMD5");

@end
