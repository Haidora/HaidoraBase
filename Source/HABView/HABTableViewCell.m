//
//  HABTableViewCell.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABTableViewCell.h"

@interface HABTableViewCell ()

@end

@implementation HABTableViewCell

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self defaultInit];
    }
    return self;
}

-(void)defaultInit
{

}

#pragma mark
#pragma mark Public Method

+ (NSString *)cellIdentifier
{
    return NSStringFromClass([self class]);
}

+ (NSString *)nibName
{
    return [self cellIdentifier];
}

+ (UINib *)nib
{
    NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
    return [UINib nibWithNibName:[self nibName] bundle:classBundle];
}

+ (CGFloat)cellHeight
{
    return 44.0;
}
+ (CGFloat)cellHeightForTableView:(UITableView *)tableView content:(id)content
{
    return [HABTableViewCell cellHeight];
}

+ (id)cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style
{
    NSString *cellID = nil;
    if (style == UITableViewCellStyleDefault)
        cellID = @"HABTableViewCellStyleDefault";
    else if (style == UITableViewCellStyleValue1)
        cellID = @"HABTableViewCellStyleValue1";
    else if (style == UITableViewCellStyleValue2)
        cellID = @"HABTableViewCellStyleValue2";
    else if (style == UITableViewCellStyleSubtitle)
        cellID = @"HABTableViewCellStyleSubtitle";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:cellID];
    }
    else
    {
        [(HABTableViewCell *)cell reset];
    }
    ((HABTableViewCell *)cell).tableView = tableView;
    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib
{
    NSString *cellID = [self cellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        cell = nibObjects[0];
    }
    else
    {
        [(HABTableViewCell *)cell reset];
    }
    ((HABTableViewCell *)cell).tableView = tableView;
    
    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib withCellIdentifier:(NSString *)cellIdentifier
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        for (UITableViewCell *nibCell in nibObjects)
        {
            if ([nibCell.reuseIdentifier isEqualToString:cellIdentifier])
            {
                cell = nibCell;
                break;
            }
        }
    }
    else
    {
        [(HABTableViewCell *)cell reset];
    }
    ((HABTableViewCell *)cell).tableView = tableView;
    
    return cell;
}

- (void)setContent:(id)content withIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
}

- (void)reset
{
#warning write by yourself
}

@end
