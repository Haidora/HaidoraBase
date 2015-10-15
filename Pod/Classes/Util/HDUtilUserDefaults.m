//
//  HDUtilUserDefaults.m
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import "HDUtilUserDefaults.h"

@implementation HDUtilUserDefaults

+ (void)setObject:(id)object forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectForKey:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)removeObjectForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end

@implementation HDUtilUserDefaults (HDSubscriptExtend)

static HDUtilUserDefaults *userDefault;

+ (HDUtilUserDefaults *)shareUserDefault
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      userDefault = [[HDUtilUserDefaults alloc] init];
    });
    return userDefault;
}

- (id)objectForKeyedSubscript:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

- (void)setObject:(id)object forKeyedSubscript:(NSString *)key
{
    if (object && key)
    {
        [[NSUserDefaults standardUserDefaults] setObject:object forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    else if (key && !object)
    {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

@end
