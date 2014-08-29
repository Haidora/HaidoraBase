//
//  HABMacro_Color.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#ifndef HaidoraBase_HABMacro_Color_h
#define HaidoraBase_HABMacro_Color_h

#define HABM_RGBColor_MAX 255.0

#define HABM_RGBColorA(r,g,b,a)\
	[UIColor colorWithRed:(r)/(HAB_RGBColor_MAX) green:(g)/(HAB_RGBColor_MAX) blue:(b)/(HAB_RGBColor_MAX) alpha:(a)]
#define HABM_RGBColor(r,g,b)\
	HABM_RGBColorA(r,g,b,1)

#endif
