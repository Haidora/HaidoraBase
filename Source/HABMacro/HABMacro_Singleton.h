//
//  HABMacro_Singleton.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-8-29.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#ifndef HaidoraBase_HABMacro_Singleton_h
#define HaidoraBase_HABMacro_Singleton_h

#pragma mark
#pragma mark Singleton
// @link http://www.bee-framework.com Bee_Singleton.h

#undef  HABM_ASSIGN_SINGLETON
#define HABM_ASSIGN_SINGLETON(__classname)\
	-(__classname *)sharedInstance;\
	+(__classname *)sharedInstance;

#undef  HABM_DEFINE_SINGLETON
#define HABM_DEFINE_SINGLETON(__classname)\
	static __classname *shared##__classname = nil;\
	-(__classname *)sharedInstance\
	{\
		return [__classname sharedInstance];\
	}\
	+(__classname *)sharedInstance\
	{\
		static dispatch_once_t onceToken;\
		dispatch_once(&onceToken, ^\
		{\
		shared##__classname = [[[self class] alloc] init];\
		});\
		return shared##__classname;\
	}

#endif
