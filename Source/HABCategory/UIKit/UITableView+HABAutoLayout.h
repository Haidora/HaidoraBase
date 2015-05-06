//
//  UITableView+HABAutoLayout.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-23.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (HABAutoLayout)

// https://github.com/cmittendorf/TableViewFooterResize/blob/master/TableViewFooterResize/MyTableViewController.m#L31
// https://gist.github.com/andreacremaschi/833829c80367d751cb83#file-uitableview-headerview-m
/**
 *  Auto size fit tableViewHeaderView frame
 */
- (void)sizeHeaderViewFit;

/**
 *  Auto size fit tableViewFooterView frame
 */
- (void)sizeFooterViewFit;

@end
