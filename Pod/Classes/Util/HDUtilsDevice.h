//
//  HDUtilsDevice.h
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import <Foundation/Foundation.h>

@interface HDUtilsDevice : NSObject

#pragma mark
#pragma mark System Info

+ (NSString *)osVersion;
+ (NSString *)appVersion;
+ (NSString *)appBuild;
+ (NSString *)appIdentifier;
+ (NSString *)deviceModel;

#pragma mark
#pragma mark Device

+ (BOOL)isPhoneDevice;
+ (BOOL)isPadDevice;

@end
