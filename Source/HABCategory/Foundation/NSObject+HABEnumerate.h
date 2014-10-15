//
//  NSObject+HABEnumerate.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-15.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Enumerate
 */
@interface NSObject (HABEnumerate)

@property(nonatomic, strong) id<NSCopying> eKey;
@property(nonatomic, strong) id eValue;

- (id)initWithKey:(id<NSCopying>)key value:(id)value;

@end

@interface NSArray (HABEnumerate)

- (NSArray *)enumerateAllKeys;

- (NSArray *)enumerateAllValues;

- (id)enumerateValueForKey:(id<NSCopying>)key;

- (id<NSCopying>)enumerateKeyForValue:(id)value;

- (NSArray *)enumerateObjectsWithOut:(NSArray *)withoutKey;

- (NSArray *)enumerateObjectsWith:(NSArray *)keys;

@end
