//
//  HABTableViewManager.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-12-2.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABTableViewManager.h"

@interface HABTableViewManager ()

@property (nonatomic, strong) UINib *nib;
@property (nonatomic, strong) Class cellClass;

@end

@implementation HABTableViewManager

- (id)initWithItems:(NSMutableArray *)items
             cellClass:(Class)cellClass
    configureCellBlock:(HABTableViewCellConfigureBlock)cellConfigureBlock
{
    self = [super init];
    if (self)
    {
        _cellDatas = items;
        _cellConfigureBlock = [cellConfigureBlock copy];
        _cellClass = cellClass;
    }
    return self;
}

- (UINib *)nib
{
    if (nil == _nib)
    {
        if ([_cellClass isSubclassOfClass:[HABTableViewCell class]])
        {
            _nib = [_cellClass nib];
        }
    }
    return _nib;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    return _cellDatas[indexPath.section][indexPath.row];
}

- (CGFloat)habTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [_cellClass cellForTableView:tableView fromNib:self.nib indexPath:indexPath];
    self.cellConfigureBlock(cell, [self itemAtIndexPath:indexPath], indexPath);
    [cell layoutIfNeeded];
    CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    // fix contenView height +1
    return size.height + 1;
}

#pragma mark
#pragma mark UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSInteger item = _cellDatas.count;
    return item;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *items = _cellDatas[section];
    return items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;
    if ([self.dataSource respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)])
    {
        cell = [self.dataSource tableView:tableView cellForRowAtIndexPath:indexPath];
        if (!cell && [_cellClass isSubclassOfClass:[HABTableViewCell class]])
        {
            cell = [_cellClass cellForTableView:tableView fromNib:self.nib];
        }
    }
    else
    {
        if ([_cellClass isSubclassOfClass:[HABTableViewCell class]])
        {
            cell = [_cellClass cellForTableView:tableView fromNib:self.nib];
        }
    }
    if (self.cellConfigureBlock)
    {
        self.cellConfigureBlock(cell, [self itemAtIndexPath:indexPath], indexPath);
    }
    return cell;
}

#pragma mark
#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    if ([self.delegate respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)])
    {
        height = [self.delegate tableView:tableView heightForRowAtIndexPath:indexPath];
    }
    else
    {
        height = [self tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView
    estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat height = 0;
    if ([self.delegate respondsToSelector:@selector(tableView:estimatedHeightForRowAtIndexPath:)])
    {
        height = [self.delegate tableView:tableView estimatedHeightForRowAtIndexPath:indexPath];
    }
    else
    {
        height = 44.0;
        if ([_cellClass isSubclassOfClass:[HABTableViewCell class]])
        {
            height = [_cellClass cellHeightForTableView:tableView
                                                content:[self itemAtIndexPath:indexPath]];
        }
    }
    return height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    CGFloat height = 0;
    if ([self.delegate respondsToSelector:@selector(tableView:heightForHeaderInSection:)])
    {
        height = [self.delegate tableView:tableView heightForHeaderInSection:section];
    }
    return height;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if ([self.delegate respondsToSelector:@selector(tableView:viewForHeaderInSection:)])
    {
        return [self.delegate tableView:tableView viewForHeaderInSection:section];
    }
    else
    {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    else
    {
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
