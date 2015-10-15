//
//  HDUtilUserDefaults.h
//  Pods
//
//  Created by Dailingchi on 15/10/15.
//
//

#import <Foundation/Foundation.h>

/**
 *  用户配置信息简单封装(用NSUserDefaults或者其他存储)
 */
@interface HDUtilUserDefaults : NSObject

+ (void)setObject:(id)object forKey:(NSString *)key;
+ (id)objectForKey:(NSString *)key;
+ (void)removeObjectForKey:(NSString *)key;

@end

@interface HDUtilUserDefaults (HDSubscriptExtend)

+ (HDUtilUserDefaults *)shareUserDefault;
/**
 *  [HDUtilUserDefaults shareUserDefault][key]
 */
- (id)objectForKeyedSubscript:(NSString *)key;

/**
 *  [HDUtilUserDefaults shareUserDefault][key] = value
 */
- (void)setObject:(id)object forKeyedSubscript:(NSString *)key;

@end
