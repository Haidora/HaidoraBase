//
//  NSObject+HDUtils.h
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (HDUtils)

@end

/**
 *  如果是自定义的ViewController容器需要实现该协议.(UINavigationController和UITabBarController不需要实现该协议)
 */
@protocol HDCurrentProtocol <NSObject>

- (UIViewController *)currentController;

@end

@interface NSObject (HDCurrentExtend)

/**
 *  获取当前的ViewController
 *
 */
- (UIViewController *)hd_currentController;

@end