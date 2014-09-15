//
//  UIView+HABShadow.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-15.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "UIView+HABShadow.h"

#pragma mark
#pragma mark HABShadowLayer
@interface HABShadowLayer : CAGradientLayer

@property (nonatomic, assign) CGFloat radius;
@property (nonatomic, assign) HABShadowDirection direction;
@property (nonatomic, strong) UIColor *color;


@end

@implementation HABShadowLayer


@end

#pragma mark
#pragma mark HABShadowView
@interface HABShadowView : UIView

@end

@implementation HABShadowView

-(void)layoutSublayersOfLayer:(CALayer *)layer
{
	[super layoutSublayersOfLayer:layer];
	[layer.sublayers enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
	 {
		 CALayer *tempLayer = obj;
		 if ([tempLayer isKindOfClass:[HABShadowLayer class]])
		 {
			 HABShadowLayer *tempShadowLayer = (HABShadowLayer *)tempLayer;
			 switch (tempShadowLayer.direction)
			 {
				 case HABShadowDirectionTop:
					 tempShadowLayer.frame = CGRectMake(0,
														0,
														CGRectGetWidth(self.bounds),
														tempShadowLayer.radius);
					 break;
				 case HABShadowDirectionBottom:
					 tempShadowLayer.frame = CGRectMake(0,
														CGRectGetHeight(self.bounds)-tempShadowLayer.radius,
														CGRectGetWidth(self.bounds),
														tempShadowLayer.radius);
					 break;
				 case HABShadowDirectionLeft:
					 tempShadowLayer.frame = CGRectMake(0,
														0,
														tempShadowLayer.radius,
														CGRectGetHeight(self.bounds));
					 break;
				 case HABShadowDirectionRight:
					 tempShadowLayer.frame = CGRectMake(CGRectGetWidth(self.bounds)-tempShadowLayer.radius,
														0,
														tempShadowLayer.radius,
														CGRectGetHeight(self.bounds));
					 break;
				 default:
					 break;
			 }
		 }
	 }];
}

@end

#pragma mark
#pragma mark UIView (HABShadow)

@implementation UIView (HABShadow)

-(void)makeInsetShadown
{
	[self makeInsetShadownWithRadius:1
							   alpha:1];
}

-(void)makeInsetShadownWithRadius:(CGFloat)radius
							alpha:(CGFloat)alpha
{
	UIColor *color = [UIColor lightGrayColor];
	[self makeInsetShadownWithRadius:radius
							   color:color
						   direction:(HABShadowDirectionTop |
									  HABShadowDirectionBottom |
									  HABShadowDirectionLeft |
									  HABShadowDirectionRight)];
}

-(void)makeInsetShadownWithRadius:(CGFloat)radius
							color:(UIColor *)color
						direction:(HABShadowDirection)direction
{
	[self addSubview:[self createShadownViewWithRadius:radius color:color direction:direction]];
}


-(UIView *)createShadownViewWithRadius:(CGFloat)radius
								 color:(UIColor *)color
							 direction:(HABShadowDirection)direction
{
	HABShadowView *shadowView = [[HABShadowView alloc]initWithFrame:CGRectMake(0,
																			   0,
																			   CGRectGetWidth(self.bounds),
																			   CGRectGetHeight(self.bounds))];
	shadowView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	shadowView.backgroundColor = [UIColor clearColor];
	shadowView.userInteractionEnabled = NO;
	
	if (direction & HABShadowDirectionTop)
	{
		HABShadowLayer *gradientLayer = [HABShadowLayer layer];
		gradientLayer.startPoint = CGPointMake(0.5, 0.0);
		gradientLayer.endPoint = CGPointMake(0.5, 1.0);
		gradientLayer.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
		
		gradientLayer.direction = HABShadowDirectionTop;
		gradientLayer.radius = radius;
		
		[shadowView.layer insertSublayer:gradientLayer atIndex:0];
	}
	if (direction & HABShadowDirectionBottom)
	{
		HABShadowLayer *gradientLayer = [HABShadowLayer layer];
		gradientLayer.startPoint = CGPointMake(0.5, 1.0);
		gradientLayer.endPoint = CGPointMake(0.5, 0.0);
		gradientLayer.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
		
		gradientLayer.direction = HABShadowDirectionBottom;
		gradientLayer.radius = radius;
		
		[shadowView.layer insertSublayer:gradientLayer atIndex:0];
	}
	if (direction & HABShadowDirectionLeft)
	{
		HABShadowLayer *gradientLayer = [HABShadowLayer layer];
		gradientLayer.startPoint = CGPointMake(0.0, 0.5);
		gradientLayer.endPoint = CGPointMake(1.0, 0.5);
		gradientLayer.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
		
		gradientLayer.direction = HABShadowDirectionLeft;
		gradientLayer.radius = radius;
		
		[shadowView.layer insertSublayer:gradientLayer atIndex:0];
	}
	if (direction & HABShadowDirectionRight)
	{
		HABShadowLayer *gradientLayer = [HABShadowLayer layer];
		gradientLayer.startPoint = CGPointMake(1.0, 0.5);
		gradientLayer.endPoint = CGPointMake(0.0, 0.5);
		gradientLayer.colors = [NSArray arrayWithObjects:(id)[color CGColor], (id)[[UIColor clearColor] CGColor], nil];
		
		gradientLayer.direction = HABShadowDirectionRight;
		gradientLayer.radius = radius;
		
		[shadowView.layer insertSublayer:gradientLayer atIndex:0];
	}
	return shadowView;
}

@end
