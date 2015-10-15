//
//  UITableView+HDUtils.h
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import <UIKit/UIKit.h>

@interface UITableView (HDUtils)

@end

/**
 *  自适应TableView,headerView和footerView
 *
 *  //https://github.com/cmittendorf/TableViewFooterResize/blob/master/TableViewFooterResize/MyTableViewController.m#L31
 *  // https://gist.github.com/andreacremaschi/833829c80367d751cb83#file-uitableview-headerview-m
 */
@interface UITableView (HDAutoLayoutExtend)

- (void)hd_sizeHeaderViewFit;
- (void)hd_sizeFooterViewFit;

@end