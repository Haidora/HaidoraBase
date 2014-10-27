//
//  HABTextView.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-27.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABTextView.h"
#import "HABAliginLabel.h"

@interface HABTextView ()

@property (nonatomic, strong) HABAliginLabel *placeholderLabel;
@property (nonatomic, assign) BOOL showPlaceHolder;

@end

@implementation HABTextView

#pragma mark
#pragma mark Init

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _placeholder = @"";
    _placeholderColor = [UIColor grayColor];
    _showPlaceHolder = NO;

    _placeholderLabel = [[HABAliginLabel alloc] init];
    [self addSubview:_placeholderLabel];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputTextChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:nil];

    [self setNeedsLayout];
}

#pragma mark
#pragma mark Render

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGRect frame = self.bounds;
    frame.origin.x += 5;
    frame.origin.y += 8;
    _placeholderLabel.frame = frame;
    _placeholderLabel.font = self.font;
    _placeholderLabel.textAlignment = self.textAlignment;
    _placeholderLabel.textColor = _placeholderColor;
    _placeholderLabel.text = _placeholder;

    if (self.text.length > 0)
    {
        _placeholderLabel.hidden = YES;
    }
    else
    {
        _placeholderLabel.hidden = NO;
    }
}

#pragma mark
#pragma mark Action

- (void)inputTextChange:(NSNotification *)notification
{
    [self setNeedsLayout];
}

@end
