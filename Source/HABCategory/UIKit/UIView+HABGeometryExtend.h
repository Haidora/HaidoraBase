//
//  UIView+HABGeometryExtend.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-9-1.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HABGeometryExtend)

/**
 *  Return self.frame.origin.x
 */
@property (nonatomic, assign) float   x;
/**
 *  Return self.frame.origin.y
 */
@property (nonatomic, assign) float   y;
/**
 *  Return self.frame.size.width
 */
@property (nonatomic, assign) float   width;
/**
 *  Return self.frame.size.height
 */
@property (nonatomic, assign) float   height;
/**
 *  Return self.frame.origin
 */
@property (nonatomic, assign) CGPoint point;
/**
 *  Return self.frame.size
 */
@property (nonatomic, assign) CGSize  size;

@end
