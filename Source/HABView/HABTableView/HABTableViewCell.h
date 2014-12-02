//
//  HABTableViewCell.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "HABCore.h"
#import "HABUtil_Device.h"

typedef NS_ENUM(NSInteger, HABTableViewCellSeparatorStyle)
{
    HABTableViewCellSeparatorStyleNone = 0,
    HABTableViewCellSeparatorStyleCustom
};

typedef NS_ENUM(NSInteger, HABTableViewCellSelectionStyle)
{
    HABTableViewCellSelectionStyleNone = 0,
    HABTableViewCellSelectionStyleCustom
};

@interface HABTableViewCell : UITableViewCell

// for tableView
@property (nonatomic, weak) UITableView *tableView;

// for tableViewCell
@property (nonatomic, strong) NSIndexPath *indexPath;

#pragma mark
#pragma mark TableViewCell Separator Style
/**
 *  default is HABTableViewCellSeparatorStyleNone
 */
@property (nonatomic, assign) HABTableViewCellSeparatorStyle habSeparatorStyle;
/**
 *  default is 0.5f
 */
@property (nonatomic, assign) CGFloat habSeparatorPadding;
/**
 *  default is [UIColor grayColor]
 */
@property (nonatomic, strong) UIColor *habSeparatorColor;
/**
 *  default is UIEdgeInsetsMake(0, 0, 0, 0),only left and right works.
 */
@property (nonatomic, assign) UIEdgeInsets habSeparatorEdgeInset;

#pragma mark
#pragma mark TableViewCell Selection Style

/**
 *  default is HABTableViewCellSelectionStyleNone
 */
@property (nonatomic, assign) HABTableViewCellSelectionStyle habSelectionStyle;
/**
 *  default is [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *habBackGroundColor;
/**
 *  default is [UIColor whiteColor]
 */
@property (nonatomic, strong) UIColor *habSelectedBackGroundColor;

#pragma mark
#pragma mark Cell Config
/**
 *  cellIdentifier default is class name.
 *
 *  @return cellIdentifier
 */
+ (NSString *)cellIdentifier;

/**
 *  nibName iPhone is cellIdentifier,iPad is cellIdentifierHD.
 *
 *  @return nibName
 */
+ (NSString *)nibName;
+ (UINib *)nib;

/**
 *  Cell Height
 *
 *  @return default 44.
 */
+ (CGFloat)cellHeight;
+ (CGFloat)cellHeightForTableView:(UITableView *)tableView content:(id)content;

#pragma mark
#pragma mark Load Cell

+ (id)cellForTableView:(UITableView *)tableView
             withStyle:(UITableViewCellStyle)style
    HAB_DEPRECATED_METHOD_NEW_METHOD("use -cellForTableView:withStyle:indexPath:");
+ (id)cellForTableView:(UITableView *)tableView
             withStyle:(UITableViewCellStyle)style
             indexPath:(NSIndexPath *)indexPath;

+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
    HAB_DEPRECATED_METHOD_NEW_METHOD("use -cellForTableView:fromNib:indexPath:");
+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
             indexPath:(NSIndexPath *)indexPath;

+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
    withCellIdentifier:(NSString *)cellIdentifier
    HAB_DEPRECATED_METHOD_NEW_METHOD("use -cellForTableView:fromNib:withCellIdentifier:indexPath:");
+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
    withCellIdentifier:(NSString *)cellIdentifier
             indexPath:(NSIndexPath *)indexPath;

- (void)setContent:(id)content;

#pragma mark
#pragma mark cell Life cycles

- (void)cellDidLoad;
- (void)cellWillAppear;

- (void)reset
    HAB_DEPRECATED_METHOD_NEW_METHOD("reset will not work.user -cellDidLoad cellWillAppear");

@end
