//
//  UIApplication+HDUtils.h
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import <UIKit/UIKit.h>

@interface UIApplication (HDUtils)

@end

@interface UIApplication (HDApplicationInfoExtend)

/**
 *  全局共享配置等信息
 */
@property (nonatomic, strong, readonly) NSMutableDictionary *hd_applicationInfo;

@end