//
//  UIView+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import "UIView+HDUtils.h"

@implementation UIView (HDUtils)

@end

@implementation UIView (HDNib)

+ (UIView *)hd_viewFromNib
{
    return [self hd_viewFromNibWith:nil inBundle:nil];
}

+ (UIView *)hd_viewFromNibWith:(NSString *)nibName inBundle:(NSBundle *)bundle
{
    if (nibName.length <= 0)
    {
        nibName = NSStringFromClass([self class]);
    }
    if (nil == bundle)
    {
        bundle = [NSBundle mainBundle];
    }
    NSArray *views = [bundle loadNibNamed:nibName owner:self options:nil];
    if (views.count <= 0)
    {
        // TODO: 写清楚
        NSAssert(NO, @"not found");
    }
    return [views firstObject];
}

@end

@implementation UIView (HDGeometryExtend)

- (CGFloat)hd_x
{
    return self.frame.origin.x;
}

- (void)setHd_x:(CGFloat)hd_x
{
    CGRect frame = self.frame;
    frame.origin.x = hd_x;
    self.frame = frame;
}

- (CGFloat)hd_y
{
    return self.frame.origin.y;
}

- (void)setHd_y:(CGFloat)hd_y
{
    CGRect frame = self.frame;
    frame.origin.y = hd_y;
    self.frame = frame;
}

- (CGFloat)hd_width
{
    return self.frame.size.width;
}

- (void)setHd_width:(CGFloat)hd_width
{
    CGRect frame = self.frame;
    frame.size.width = hd_width;
    self.frame = frame;
}

- (CGFloat)hd_height
{
    return self.frame.size.height;
}

- (void)setHd_height:(CGFloat)hd_height
{
    CGRect frame = self.frame;
    frame.size.height = hd_height;
    self.frame = frame;
}

- (CGPoint)hd_point
{
    return self.frame.origin;
}

- (void)setHd_point:(CGPoint)hd_point
{
    CGRect frame = self.frame;
    frame.origin.x = hd_point.x;
    frame.origin.y = hd_point.y;
    self.frame = frame;
}

- (CGSize)hd_size
{
    return self.frame.size;
}

- (void)setHd_size:(CGSize)hd_size
{
    CGRect frame = self.frame;
    frame.size.width = hd_size.width;
    frame.size.height = hd_size.height;
    self.frame = frame;
}

@end