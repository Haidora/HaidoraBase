//
//  NSObject+HABEnumerate.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-10-15.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "NSObject+HABEnumerate.h"
#import <objc/runtime.h>

#define kKey @"eKey"
#define kValue @"eValue"

@implementation NSObject (HABEnumerate)

@dynamic eKey;
@dynamic eValue;

- (void)setEKey:(id<NSCopying>)eKey {
  objc_setAssociatedObject(self, kKey, eKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id<NSCopying>)eKey {
  return objc_getAssociatedObject(self, kKey);
}

- (void)setEValue:(id)eValue {
  objc_setAssociatedObject(self, kValue, eValue,
                           OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)eValue {
  return objc_getAssociatedObject(self, kValue);
}

- (id)initWithKey:(id<NSCopying>)key value:(id)value {
  self = [self init];
  if (self) {
    NSAssert(key && value, @"Must not be empty!!!");
    self.eKey = key;
    self.eValue = value;
  }
  return self;
}

@end

@implementation NSArray (HABEnumerate)

- (NSArray *)enumerateAllKeys {
  NSMutableArray *allKeys = [NSMutableArray array];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model = obj;
      if ([model respondsToSelector:@selector(eKey)]) {
        [allKeys addObject:model.eKey];
      }
  }];
  return allKeys;
}

- (NSArray *)enumerateAllValues {
  NSMutableArray *allKeys = [NSMutableArray array];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model = obj;
      if ([model respondsToSelector:@selector(eValue)]) {
        [allKeys addObject:model.eValue];
      }
  }];

  return allKeys;
}

- (id)enumerateValueForKey:(id<NSCopying>)key {
  __block id value;
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model = obj;
      if ([model respondsToSelector:@selector(eKey)]) {
        NSObject *eKey = (NSObject *)model.eKey;
        if ([eKey isEqual:key]) {
          *stop = YES;
          value = model.eValue;
        }
      }
  }];
  return value;
}

- (id<NSCopying>)enumerateKeyForValue:(id)value {
  __block id key;
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model = obj;
      if ([model respondsToSelector:@selector(eValue)]) {
        NSObject *eValue = (NSObject *)model.eValue;
        if ([eValue isEqual:value]) {
          *stop = YES;
          key = model.eKey;
        }
      }
  }];
  return key;
}

- (NSArray *)enumerateObjectsWithOut:(NSArray *)withoutKey {
  NSMutableArray *enumerTempArray = [NSMutableArray array];
  NSMutableArray *allKeys =
      [NSMutableArray arrayWithArray:self.enumerateAllKeys];
  [allKeys removeObjectsInArray:withoutKey];

  [allKeys enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model =
          [[NSObject alloc] initWithKey:obj
                                  value:[self enumerateValueForKey:obj]];
      [enumerTempArray addObject:model];
  }];
  return enumerTempArray;
}

- (NSArray *)enumerateObjectsWith:(NSArray *)keys {
  NSMutableArray *enumerValueArray = [NSMutableArray array];
  [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
      NSObject *model = obj;
      if ([model respondsToSelector:@selector(eKey)]) {
        if ([keys containsObject:model.eKey]) {
          [enumerValueArray addObject:model.eValue];
        }
      }
  }];
  return enumerValueArray;
}

@end
