//
//  HABUtil_UserDefaults.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABUtil_UserDefaults.h"

@implementation HABUtil_UserDefaults

static NSUserDefaults* userDefault;

+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^
                  {
                      userDefault = [NSUserDefaults standardUserDefaults];
                  });
}

+ (NSUserDefaults *)shareUserDefault
{
    return userDefault;
}

+ (void)setObject:(id)_object forKey:(NSString *)_key
{
    [userDefault setObject:_object forKey:_key];
    [userDefault synchronize];
}

+ (id)objectForKey:(NSString *)_key
{
    return [userDefault objectForKey:_key];
}

+ (void)removeObjectForKey:(NSString *)_key
{
    [userDefault removeObjectForKey:_key];
    [userDefault synchronize];
}

@end
