//
//  UITableView+HABAutoLayout.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-23.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UITableView+HABAutoLayout.h"

@implementation UITableView (HABAutoLayout)

- (void)sizeHeaderViewFit
{
    UIView *headView = self.tableHeaderView;
    [headView setNeedsLayout];
    [headView layoutIfNeeded];

    CGFloat height = [headView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    headView.frame = (
        {
            CGRect headerFrame = headView.frame;
            headerFrame.size.height = height;
            headerFrame;
        });
    self.tableHeaderView = headView;
}

@end
