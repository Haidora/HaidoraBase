//
//  HABTextField.m
//  HaidoraBase
//
//  Created by DaiLingChi on 14-11-13.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABTextField.h"

@interface HABTextField ()

@property (nonatomic, strong) UILabel *suffixLabel;

@end

@implementation HABTextField

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
    _suffix = @"";
    _suffixColor = [UIColor grayColor];
    _showSuffix = NO;

    _suffixLabel = [[UILabel alloc] init];
    _suffixLabel.numberOfLines = 0;
    [self addSubview:_suffixLabel];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(inputTextChange:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];

    [self setNeedsLayout];
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark
#pragma mark Render

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (_showSuffix)
    {
        CGRect frame = self.bounds;
        NSString *inputString = self.text;
        if (inputString.length <= 0)
        {
            inputString = self.placeholder;
        }
        CGSize inputSize = [inputString sizeWithAttributes:@{NSFontAttributeName : self.font}];
        frame.origin.x = inputSize.width + 11;

        [UIView animateWithDuration:0.3 animations:^{ _suffixLabel.frame = frame; }];
        _suffixLabel.font = self.font;
        _suffixLabel.textAlignment = self.textAlignment;
        _suffixLabel.textColor = _suffixColor;
        _suffixLabel.text = _suffix;
        _suffixLabel.hidden = NO;
    }
    else
    {
        _suffixLabel.hidden = YES;
    }
}

#pragma mark
#pragma mark Action

- (void)inputTextChange:(NSNotification *)notification
{
    [self setNeedsLayout];
}

@end
