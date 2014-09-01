//
//  UIView+HABGeometryExtend.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-1.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIView+HABGeometryExtend.h"

@implementation UIView (HABGeometryExtend)

- (float) x
{
    return self.frame.origin.x;
}

- (void) setX:(float)x
{
	CGRect frame = self.frame;
	frame.origin.x = x;
	self.frame = frame;
}

- (float) y
{
    return self.frame.origin.y;
}

- (void) setY:(float)y
{
	CGRect frame = self.frame;
	frame.origin.y = y;
	self.frame = frame;
}

- (float) width
{
    return self.frame.size.width;
}

- (void) setWidth:(float)width
{
	CGRect frame = self.frame;
	frame.size.width = width;
	self.frame = frame;
}

- (float) height
{
    return self.frame.size.height;
}

- (void) setHeight:(float)height
{
	CGRect frame = self.frame;
	frame.size.height = height;
	self.frame = frame;
}

- (CGPoint) point
{
    return self.frame.origin;
}

- (void) setPoint:(CGPoint)point
{
	CGRect frame = self.frame;
	frame.origin.x = point.x;
	frame.origin.y = point.y;
	self.frame = frame;
}

- (CGSize) size
{
    return self.frame.size;
}

- (void) setSize:(CGSize)size
{
	CGRect frame = self.frame;
	frame.size.width = size.width;
	frame.size.height = size.height;
	self.frame = frame;
}

@end
