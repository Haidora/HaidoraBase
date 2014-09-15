//
//  UIApplication+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIApplication+HABBase.h"
#import <objc/runtime.h>

#define kUIApplicationHABBase_UserInfo @"kUIApplicationHABBase_UserInfo"

@implementation UIApplication (HABBase)

@dynamic userInfo;

-(void)setUserInfo:(NSMutableDictionary *)userInfo
{
    objc_setAssociatedObject(self, kUIApplicationHABBase_UserInfo, userInfo, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableDictionary *)userInfo
{
	NSMutableDictionary *dictionary = objc_getAssociatedObject(self, kUIApplicationHABBase_UserInfo);
	if (nil == dictionary)
	{
		dictionary = [NSMutableDictionary dictionary];
		objc_setAssociatedObject(self, kUIApplicationHABBase_UserInfo, dictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
    return dictionary;
}

@end
