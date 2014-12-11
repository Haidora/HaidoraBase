//
//  HABTableViewManager.h
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-2.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HABMacro_Util.h"
#import "HABTableViewCell.h"

@protocol HABTableViewManagerDataSource;
@protocol HABTableViewManagerDelegate;

@interface HABTableViewManager : NSObject <UITableViewDataSource, UITableViewDelegate>

//@[@[],@[]]
@property (nonatomic, strong) NSMutableArray *cellDatas;
@property (nonatomic, copy) HABTableViewCellConfigureBlock cellConfigureBlock;
@property (nonatomic, weak) id<HABTableViewManagerDataSource> dataSource;
@property (nonatomic, weak) id<HABTableViewManagerDelegate> delegate;

- (id)initWithItems:(NSMutableArray *)items
             cellClass:(Class)cellClass
    configureCellBlock:(HABTableViewCellConfigureBlock)cellConfigureBlock;
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)habTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

@end

#pragma mark
#pragma mark HABTableViewManagerDataSource

@protocol HABTableViewManagerDataSource <UITableViewDataSource>

@end

#pragma mark
#pragma mark HABTableViewManagerDelegate

@protocol HABTableViewManagerDelegate <UITableViewDelegate>

@end
