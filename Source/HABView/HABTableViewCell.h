//
//  HABTableViewCell.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,HABTableViewCellSeparatorStyle)
{
    HABTableViewCellSeparatorStyleNone = 0,
    HABTableViewCellSeparatorStyleCustom
};

@interface HABTableViewCell : UITableViewCell

//for tableView
@property (nonatomic, weak) UITableView *tableView;

//for tableviewcell style
/**
 *  default is HABTableViewCellSeparatorStyleNone
 */
@property (nonatomic, assign) HABTableViewCellSeparatorStyle habSeparatorStyle;
/**
 *  default is 0.5f
 */
@property (nonatomic, assign) CGFloat       habSeparatorPadding;
/**
 *  default is [UIColor grayColor]
 */
@property (nonatomic, strong) UIColor       *habSeparatorColor;
/**
 *  default is UIEdgeInsetsMake(0, 0, 0, 0)
 */
@property (nonatomic, assign) UIEdgeInsets  habSeparatorEdgeInset;

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

+ (id)cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib;
+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib withCellIdentifier:(NSString *)cellIdentifier;

- (void)setContent:(id)content;
/**
 *  tableViewcell复用时回调
 */
- (void)reset;

@end
