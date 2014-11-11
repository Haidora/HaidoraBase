//
//  HABTableViewCell.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABTableViewCell.h"

#define kHABSeparatorViewTag 20000

@interface HABTableViewCell ()

@property (nonatomic, strong) UIControl *separatorView;

@end

@implementation HABTableViewCell

- (id)initWithCoder:(NSCoder *)aDecoder
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

- (void)defaultInit
{
    _habSeparatorStyle = HABTableViewCellSeparatorStyleNone;
    _habSeparatorColor = [UIColor grayColor];
    _habSeparatorPadding = 0.5;
    _habSeparatorEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0);

    _habSelectionStyle = HABTableViewCellSelectionStyleNone;
    _habBackGroundColor = [UIColor whiteColor];
    _habSelectedBackGroundColor = [UIColor colorWithWhite:0.812 alpha:1.000];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.habSeparatorStyle != HABTableViewCellSeparatorStyleNone)
    {
        UIView *separatorView = [self viewWithTag:kHABSeparatorViewTag];
        if (!separatorView)
        {
            [self insertSubview:self.separatorView atIndex:0];
            self.separatorView.tag = kHABSeparatorViewTag;
            separatorView = self.separatorView;
        }
        separatorView.frame = CGRectMake(
            _habSeparatorEdgeInset.left, CGRectGetHeight(self.bounds) - _habSeparatorPadding,
            CGRectGetWidth(self.bounds) - _habSeparatorEdgeInset.right -
                _habSeparatorEdgeInset.left,
            _habSeparatorPadding);
    }

    if (self.habSelectionStyle != HABTableViewCellSelectionStyleNone)
    {
        if (self.backgroundView == nil)
        {
            self.backgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        }
        self.backgroundView.backgroundColor = self.habBackGroundColor;

        if (![self.selectedBackgroundView isKindOfClass:[UIImageView class]] ||
            self.selectedBackgroundView == nil)
        {
            self.selectedBackgroundView = [[UIImageView alloc] initWithFrame:self.bounds];
        }
        self.selectedBackgroundView.backgroundColor = self.habSelectedBackGroundColor;
    }
}

- (UIControl *)separatorView
{
    if (nil == _separatorView)
    {
        switch (_habSeparatorStyle)
        {
        case HABTableViewCellSeparatorStyleCustom:
        {
            _separatorView = [self generateView:_habSeparatorColor height:_habSeparatorPadding];
        }
        break;
        case HABTableViewCellSeparatorStyleNone:
        default:
            break;
        }
    }
    return _separatorView;
}

- (UIControl *)generateView:(UIColor *)color height:(CGFloat)height
{
    UIControl *control =
        [[UIControl alloc] initWithFrame:CGRectMake(0.0f, CGRectGetHeight(self.frame) - height,
                                                    CGRectGetWidth(self.frame), height)];
    control.backgroundColor = color;
    return control;
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
    return [self cellHeight];
}

+ (id)cellForTableView:(UITableView *)tableView withStyle:(UITableViewCellStyle)style
{
    return [self cellForTableView:tableView withStyle:style indexPath:nil];
}

+ (id)cellForTableView:(UITableView *)tableView
             withStyle:(UITableViewCellStyle)style
             indexPath:(NSIndexPath *)indexPath
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
    else
        cellID = @"HABTableViewCellSystem";

    HABTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[[self class] alloc] initWithStyle:style reuseIdentifier:cellID];
        [cell cellDidLoad];
    }
    cell.tableView = tableView;
    cell.indexPath = indexPath;
    [cell cellWillAppear];

    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView fromNib:(UINib *)nib
{
    return [self cellForTableView:tableView fromNib:nib indexPath:nil];
}

+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
             indexPath:(NSIndexPath *)indexPath
{
    NSString *cellID = [self cellIdentifier];
    HABTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        NSArray *nibObjects = [nib instantiateWithOwner:nil options:nil];
        cell = nibObjects[0];
        [cell cellDidLoad];
    }
    cell.tableView = tableView;
    cell.indexPath = indexPath;
    [cell cellWillAppear];

    return cell;
}

+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
    withCellIdentifier:(NSString *)cellIdentifier
{
    return [self cellForTableView:tableView
                          fromNib:nib
               withCellIdentifier:cellIdentifier
                        indexPath:nil];
}

+ (id)cellForTableView:(UITableView *)tableView
               fromNib:(UINib *)nib
    withCellIdentifier:(NSString *)cellIdentifier
             indexPath:(NSIndexPath *)indexPath
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
                [(HABTableViewCell *)cell cellDidLoad];
                break;
            }
        }
    }
    ((HABTableViewCell *)cell).tableView = tableView;
    ((HABTableViewCell *)cell).indexPath = indexPath;
    [(HABTableViewCell *)cell cellWillAppear];

    return cell;
}

- (void)setContent:(id)content
{
}

#pragma mark
#pragma mark cell Life cycles

- (void)cellDidLoad
{
}
- (void)cellWillAppear
{
}

- (void)reset
{
}

@end
