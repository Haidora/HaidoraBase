//
//  HABUtil_UserDefaults.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HABUtil_UserDefaults : NSObject

+ (NSUserDefaults *)shareUserDefault;
+ (void)setObject:(id)_object forKey:(NSString *)_key;
+ (id)objectForKey:(NSString *)_key;
+ (void)removeObjectForKey:(NSString *)_key;

@end
