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
    _habSeparatorStyle = HABTableViewCellSeparatorStyleNone;
    _habSeparatorColor = [UIColor grayColor];
    _habSeparatorPadding = 0.5;
    _habSeparatorEdgeInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.habSeparatorStyle != HABTableViewCellSeparatorStyleNone)
    {
        UIView *separatorView = [self viewWithTag:kHABSeparatorViewTag];
        if (!separatorView)
        {
            [self addSubview:self.separatorView];
            self.separatorView.tag = kHABSeparatorViewTag;
            separatorView = self.separatorView;
        }
        CGRect preFrame = self.separatorView.frame;
        separatorView.frame = CGRectMake(_habSeparatorEdgeInset.left,
                                         CGRectGetHeight(self.frame)-CGRectGetHeight(preFrame),
                                         CGRectGetWidth(self.frame)-_habSeparatorEdgeInset.right-_habSeparatorEdgeInset.left,
                                         CGRectGetHeight(preFrame));
    }
}

-(UIControl *)separatorView
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

-(UIControl *)generateView:(UIColor *)color height:(CGFloat)height
{
    UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(0.0f,
                                                                    CGRectGetHeight(self.frame)-height,
                                                                    CGRectGetWidth(self.frame),
                                                                    height)];
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
    else
        cellID = @"HABTableViewCellSystem";
    
    HABTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil)
    {
        cell = [[HABTableViewCell alloc] initWithStyle:style reuseIdentifier:cellID];
    }
    [cell reset];
    cell.tableView = tableView;
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
    [(HABTableViewCell *)cell reset];
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
    [(HABTableViewCell *)cell reset];
    ((HABTableViewCell *)cell).tableView = tableView;
    
    return cell;
}

- (void)setContent:(id)content
{
}

- (void)reset
{
#warning write by yourself
}

@end
