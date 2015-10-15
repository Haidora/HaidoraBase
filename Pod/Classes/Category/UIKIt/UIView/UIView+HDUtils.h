//
//  UIView+HDUtils.h
//  Pods
//
//  Created by Dailingchi on 15/10/13.
//
//

#import <UIKit/UIKit.h>

@interface UIView (HDUtils)

@end

/**
 *  根据Nib加载View
 */
@interface UIView (HDNibExtend)

+ (UIView *)hd_viewFromNib;
+ (UIView *)hd_viewFromNibWith:(NSString *)nibName inBundle:(NSBundle *)bundle;

@end

@interface UIView (HDGeometryExtend)

/**
 *  Return self.frame.origin.x
 */
@property (nonatomic, assign) CGFloat hd_x;
/**
 *  Return self.frame.origin.y
 */
@property (nonatomic, assign) CGFloat hd_y;
/**
 *  Return self.frame.size.width
 */
@property (nonatomic, assign) CGFloat hd_width;
/**
 *  Return self.frame.size.height
 */
@property (nonatomic, assign) CGFloat hd_height;
/**
 *  Return self.frame.origin
 */
@property (nonatomic, assign) CGPoint hd_point;
/**
 *  Return self.frame.size
 */
@property (nonatomic, assign) CGSize hd_size;

@end