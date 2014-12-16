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
    CGFloat height = 0;
    if (IOS_OR_LATER(@"8.0"))
    {
        height = UITableViewAutomaticDimension;
    }
    else
    {
        UITableViewCell *cell =
            [_cellClass cellForTableView:tableView fromNib:self.nib indexPath:indexPath];
        self.cellConfigureBlock(cell, [self itemAtIndexPath:indexPath], indexPath);
        [cell layoutIfNeeded];
        CGSize size = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        // fix contenView height +1
        // for uilabel you need set preferredMaxLayoutWidth
        height = size.height + 1;
    }
    return height;
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
            cell = [_cellClass cellForTableView:tableView fromNib:self.nib indexPath:indexPath];
        }
    }
    else
    {
        if ([_cellClass isSubclassOfClass:[HABTableViewCell class]])
        {
            cell = [_cellClass cellForTableView:tableView fromNib:self.nib indexPath:indexPath];
        }
    }
    if (self.cellConfigureBlock)
    {
        self.cellConfigureBlock(cell, [self itemAtIndexPath:indexPath], indexPath);
    }
    return cell;
}

#pragma mark
#pragma mark optional Delete Action

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL canEdit = NO;
    if ([self.dataSource respondsToSelector:@selector(tableView:canEditRowAtIndexPath:)])
    {
        canEdit = [self.dataSource tableView:tableView canEditRowAtIndexPath:indexPath];
    }
    return canEdit;
}

- (void)tableView:(UITableView *)tableView
    commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
     forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.dataSource
            respondsToSelector:@selector(tableView:commitEditingStyle:forRowAtIndexPath:)])
    {
        [self.dataSource tableView:tableView
                commitEditingStyle:editingStyle
                 forRowAtIndexPath:indexPath];
    }
    else
    {
        [tableView beginUpdates];
        if (editingStyle == UITableViewCellEditingStyleDelete)
        {
            NSMutableArray *cells = _cellDatas[indexPath.section];
            [cells removeObjectAtIndex:indexPath.row];
            [tableView deleteRowsAtIndexPaths:@[ indexPath ]
                             withRowAnimation:UITableViewRowAnimationAutomatic];
        }
        [tableView endUpdates];
    }
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

#pragma mark
#pragma mark Delete Action

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCellEditingStyle editingStyle = UITableViewCellEditingStyleNone;
    if ([self.delegate respondsToSelector:@selector(tableView:editingStyleForRowAtIndexPath:)])
    {
        editingStyle = [self.delegate tableView:tableView editingStyleForRowAtIndexPath:indexPath];
    }
    return editingStyle;
}

- (NSString *)tableView:(UITableView *)tableView
    titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *titleForDelete = NSLocalizedString(@"Delete", @"");
    if ([self.delegate respondsToSelector:@selector(tableView:
                                              titleForDeleteConfirmationButtonForRowAtIndexPath:)])
    {
        [self.delegate tableView:tableView
            titleForDeleteConfirmationButtonForRowAtIndexPath:indexPath];
    }
    return titleForDelete;
}

@end
