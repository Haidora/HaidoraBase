//
//  UIScrollView+HABBase.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIScrollView+HABBase.h"

@implementation UIScrollView (HABBase)

#pragma mark
#pragma mark ContentSize

- (CGSize)calculatedContentSizeFromSubviewFrames:(CGFloat)margin
{
    BOOL wasShowingVerticalScrollIndicator = self.showsVerticalScrollIndicator;
    BOOL wasShowingHorizontalScrollIndicator = self.showsHorizontalScrollIndicator;

    self.showsVerticalScrollIndicator = NO;
    self.showsHorizontalScrollIndicator = NO;

    CGRect rect = CGRectZero;
    for (UIView *view in self.subviews)
    {
        rect = CGRectUnion(rect, view.frame);
    }
    rect.size.height += margin;

    self.showsVerticalScrollIndicator = wasShowingVerticalScrollIndicator;
    self.showsHorizontalScrollIndicator = wasShowingHorizontalScrollIndicator;

    return rect.size;
}

- (void)contentSizeToFit:(CGFloat)margin
{
    self.contentSize = [self calculatedContentSizeFromSubviewFrames:margin];
}

- (void)contentSizeToFit
{
    [self contentSizeToFit:20];
}

@end
