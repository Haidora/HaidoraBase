//
//  UILabel+HABAutoLayout.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-14.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UILabel+HABAutoLayout.h"

@implementation UILabel (HABAutoLayout)

- (void)setHabPreferredMaxLayoutWidth:(CGFloat)habPreferredMaxLayoutWidth
{
    if (!IOS_OR_LATER(@"8.0"))
    {
        self.preferredMaxLayoutWidth = habPreferredMaxLayoutWidth;
    }
}

- (CGFloat)habPreferredMaxLayoutWidth
{
    return self.preferredMaxLayoutWidth;
}

@end
