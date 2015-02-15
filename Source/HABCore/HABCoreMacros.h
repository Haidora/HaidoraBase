//
//  HABCoreMacros.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-28.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#ifndef HaidoraBase_HABCoreMacros_h
#define HaidoraBase_HABCoreMacros_h

/**
 *  See https://github.com/jverkoey/nimbus/blob/master/src/core/src/NIPreprocessorMacros.h#L105
 */
#pragma mark
#pragma mark Mark __attribute__

#define HAB_Attribute_method_objc_requires_super __attribute__((objc_requires_super))
#define HAB_Attribute_method_deprecated __attribute__((deprecated))
#define HAB_Attribute_method_deprecatedWith(...) __attribute__((deprecated("" __VA_ARGS__)))

#pragma mark
#pragma mark Living Render Supporting older Xcode

#ifndef IBInspectable

#define IBInspectable

#endif

#ifndef IB_DESIGNABLE

#define IBInspectable

#endif

#pragma mark
#pragma mark Mark deprecated

#define HAB_DEPRECATED_METHOD HAB_Attribute_method_objc_requires_super
#define HAB_DEPRECATED_METHOD_NEW_METHOD(...) HAB_Attribute_method_deprecatedWith(__VA_ARGS__)

#endif
