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
 *  See https://github.com/jverkoey/nimbus/blob/master/src/core/src/NIPreprocessorMacros.h 105 line
 */
#define HAB_DEPRECATED_METHOD __attribute__((deprecated))

#ifdef DEBUG
#define HAB_DLog(format, ...)\
	{\
		fprintf(stderr, "<%s : %d> %s\n",\
		[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
		__LINE__, __func__);                                                        \
		(NSLog)((format), ##__VA_ARGS__);                                           \
		fprintf(stderr, "-------\n");                                               \
	}
#else
	#define HAB_DLog(format, ...)
#endif

#endif
