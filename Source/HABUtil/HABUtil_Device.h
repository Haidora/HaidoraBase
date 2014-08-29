//
//  HABUtil_Device.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HABUtil_Device : NSObject

#pragma mark
#pragma mark System Info

+ (NSString *)osVersion;
+ (NSString *)appVersion;
+ (NSString *)appIdentifier;
+ (NSString *)deviceModel;

#pragma mark
#pragma mark Device

+ (BOOL)isPhoneDevice;
+ (BOOL)isPadDevice;

+ (BOOL)isPhone35;
+ (BOOL)isPhoneRetina35;
+ (BOOL)isPhoneRetina4;
+ (BOOL)isPad;
+ (BOOL)isPadRetina;
+ (BOOL)isScreenSize:(CGSize)size;

#pragma mark
#pragma mark Device Action

/**
 *  拨打电话
 *
 *  @param telPhone 电话号码
 */
+(void)callToPhone:(NSString*)telPhone;

@end
