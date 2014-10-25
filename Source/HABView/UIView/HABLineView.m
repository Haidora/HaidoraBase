//
//  HABLineView.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-25.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABLineView.h"

@implementation HABLineView

#pragma mark
#pragma mark Init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _lineHeight = CGRectGetHeight(self.bounds);
    _lineInterval = 0;
    _lineInsetLeft = 0;
    _lineInsetRight = 0;
    _lineColor = self.tintColor;
}

#pragma mark
#pragma mark Render

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    CGContextSetLineCap(context, kCGLineCapButt);
    CGContextSetLineWidth(context, _lineHeight);
    CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);

    CGContextBeginPath(context);
    CGContextMoveToPoint(context, _lineInsetLeft, CGRectGetMidY(self.bounds));
    const CGFloat lengths[] = {_lineInterval, _lineInterval};
    CGContextSetLineDash(context, 0, lengths, 2);
    CGContextAddLineToPoint(context, CGRectGetMaxX(self.bounds) - _lineInsetRight,
                            CGRectGetMidY(self.bounds));
    CGContextStrokePath(context);
}

@end
