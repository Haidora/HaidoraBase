//
//  HABNetworkOperation.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABNetworkOperation.h"

@implementation HABNetworkOperation

- (id)initWithURLString:(NSString *)aURLString
                 params:(NSDictionary *)params
             httpMethod:(NSString *)method
{
    NSMutableDictionary *customParams = [NSMutableDictionary dictionaryWithDictionary:params];
    if (customParams == nil) {
        customParams = [NSMutableDictionary dictionary];
    }
    //TODO: you can custom your params
//    [customParams setValue:@""  forKey:@"osVersion"];
//    [customParams setValue:@"" forKey:@"appVersion"];
//    [customParams setValue:@""  forKey:@"deviceModel"];
//    [customParams setValue:@"" forKey:@"appIdentifier"];
//    
    return [super initWithURLString:aURLString
                             params:params
                         httpMethod:method];
}

-(void) operationSucceeded
{
    [super operationSucceeded];
    [[NSNotificationCenter defaultCenter] postNotificationName:HABNetworkOperationFinishedNotification
                                                        object:self];
}

-(void) operationFailedWithError:(NSError*) error
{
    [super operationFailedWithError:error];
    [[NSNotificationCenter defaultCenter] postNotificationName:HABNetworkOperationFinishedNotification
                                                        object:self];
}

@end
