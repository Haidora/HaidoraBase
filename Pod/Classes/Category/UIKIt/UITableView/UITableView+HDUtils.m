//
//  UITableView+HDUtils.m
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import "UITableView+HDUtils.h"

@implementation UITableView (HDUtils)

@end

@implementation UITableView (HDAutoLayoutExtend)

- (void)hd_sizeHeaderViewFit
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

- (void)hd_sizeFooterViewFit
{
    UIView *footView = self.tableFooterView;
    [footView setNeedsLayout];
    [footView layoutIfNeeded];

    CGFloat height = [footView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    footView.frame = (
        {
            CGRect footerFrame = footView.frame;
            footerFrame.size.height = height;
            footerFrame;
        });
    self.tableFooterView = footView;
}

@end