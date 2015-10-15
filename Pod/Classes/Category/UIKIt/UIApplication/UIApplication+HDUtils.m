//
//  UIApplication+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/14.
//
//

#import "UIApplication+HDUtils.h"
#import <objc/runtime.h>

@implementation UIApplication (HDUtils)

@end

static char *kHDApplicationInfoExtend_applicationInfo = "kHDApplicationInfoExtend_applicationInfo";
@implementation UIApplication (HDApplicationInfoExtend)

@dynamic hd_applicationInfo;

- (void)setHd_applicationInfo:(NSMutableDictionary *)hd_applicationInfo
{
    objc_setAssociatedObject(self, &kHDApplicationInfoExtend_applicationInfo, hd_applicationInfo,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)hd_applicationInfo
{
    NSMutableDictionary *results =
        objc_getAssociatedObject(self, &kHDApplicationInfoExtend_applicationInfo);
    if (nil == results)
    {
        results = [NSMutableDictionary dictionary];
        [self setHd_applicationInfo:results];
    }
    return results;
}

@end