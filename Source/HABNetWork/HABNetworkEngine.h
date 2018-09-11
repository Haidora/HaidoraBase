//
//  HABNetworkEngine.h
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import <MKNetworkKit/MKNetworkEngine.h>
#import "HABNetworkOperation.h"

typedef void (^OperationSuccessBlock)(MKNetworkOperation* completedOperation,id result);
/**
 *  NetworkEngine
 */
@interface HABNetworkEngine : MKNetworkEngine

@property(nonatomic, strong) NSMutableArray *workingOperations;

/**
 *  Http Get
 *
 *  @param urlString
 *  @param params
 *  @param successBlock
 *  @param errorBlock
 *
 *  @return
 */
-(MKNetworkOperation *)getOperationWithURLString:(NSString *)urlString
                                          params:(NSDictionary *)params
                                         success:(OperationSuccessBlock)successBlock
                                           error:(MKNKErrorBlock)errorBlock;
/**
 *  Http Post
 *
 *  @param urlString
 *  @param params
 *  @param successBlock
 *  @param errorBlock
 *
 *  @return
 */
-(MKNetworkOperation *)postOperationWithURLString:(NSString *)urlString
                                           params:(NSDictionary *)params
                                          success:(OperationSuccessBlock)successBlock
                                            error:(MKNKErrorBlock)errorBlock;

/**
 *  Http method
 *
 *  @param urlString
 *  @param params
 *  @param method
 *  @param successBlock
 *  @param errorBlock
 *
 *  @return
 */
-(MKNetworkOperation *)cmOperationWithURLString:(NSString *)urlString
                                         params:(NSDictionary *)params
                                         method:(NSString *)method
                                        success:(OperationSuccessBlock)successBlock
                                          error:(MKNKErrorBlock)errorBlock;

/**
 *  soapaction1_2
 *
 *  @param action
 *  @param params
 *  @param successBlock
 *  @param errorBlock
 *
 *  @return
 */
-(MKNetworkOperation*)operationWithSoapAction1_2Webservice:(NSString *)webservice
                                                 andAction:(NSString *)action
                                                    params:(NSDictionary *)params
                                                   success:(OperationSuccessBlock)successBlock
                                                     error:(MKNKErrorBlock)errorBlock;
/**
 *  cancel MKNetworkOperations
 */
-(void)canelAllOperations;

@end
