//
//  HABNetworkEngine.m
//  HaidoraBase
//
//  Created by DaiLingchi on 14-7-22.
//  Copyright (c) 2014年 Haidora. All rights reserved.
//

#import "HABNetworkEngine.h"

@implementation HABNetworkEngine

-(id)initWithHostName:(NSString*)hostName customHeaderFields:(NSDictionary*)headers
{
    self = [super initWithHostName:hostName customHeaderFields:headers];
    if (self)
    {
        [self registerOperationSubclass:[HABNetworkOperation class]];
        self.workingOperations = [NSMutableArray array];
        
        return self;
    }
    return nil;
}

-(void)enqueueOperation:(MKNetworkOperation*)operation forceReload:(BOOL)forceReload
{
    [super enqueueOperation:operation forceReload:forceReload];
    if (![self.workingOperations containsObject:operation]) {
        [self.workingOperations addObject:operation];
        //add notification
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(networkOperationFinished:)
                                                     name:HABNetworkOperationFinishedNotification
                                                   object:operation];
    }
}


-(void)dealloc
{
    [self canelAllOperations];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:HABNetworkOperationFinishedNotification object:nil];
}

#pragma mark
#pragma mark private method

-(void)networkOperationFinished:(NSNotification *)notification
{
    HABNetworkOperation *operation = notification.object;
    if (operation!=nil)
    {
        [_workingOperations removeObject:operation];
    }
}

#pragma mark
#pragma mark Public method

-(MKNetworkOperation *)getOperationWithURLString:(NSString *)urlString
                                          params:(NSDictionary *)params
                                         success:(OperationSuccessBlock)successBlock
                                           error:(MKNKErrorBlock)errorBlock
{
    return [self cmOperationWithURLString:urlString
                                   params:params
                                   method:@"GET"
                                  success:successBlock
                                    error:errorBlock];
}

-(MKNetworkOperation *)postOperationWithURLString:(NSString *)urlString
                                           params:(NSDictionary *)params
                                          success:(OperationSuccessBlock)successBlock
                                            error:(MKNKErrorBlock)errorBlock
{
    return [self cmOperationWithURLString:urlString
                                   params:params
                                   method:@"POST"
                                  success:successBlock
                                    error:errorBlock];
}

-(MKNetworkOperation *)cmOperationWithURLString:(NSString *)urlString
                                         params:(NSDictionary *)params
                                         method:(NSString *)method
                                        success:(OperationSuccessBlock)successBlock
                                          error:(MKNKErrorBlock)errorBlock
{
    MKNetworkOperation *operation = [self operationWithURLString:urlString
                                                          params:params
                                                      httpMethod:method];
    DLog(@"http request url:%@",[operation url]);
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         if (successBlock)
         {
             successBlock(completedOperation,completedOperation.responseData);
         }
     }
     errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
     {
         if (error)
         {
            errorBlock(error);
         }
     }];
    [self enqueueOperation:operation];
    
    return operation;
}

-(MKNetworkOperation*)operationWithSoapAction1_2Webservice:(NSString *)webservice
                                                 andAction:(NSString *)action
                                                    params:(NSDictionary *)params
                                                   success:(OperationSuccessBlock)successBlock
                                                     error:(MKNKErrorBlock)errorBlock
{
    DLog(@"\nWebService Action:%@\n WebService Params:%@\n",action,params);
    //generate soapbody
    __block NSString *soapbody = [NSString string];
    [params enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop)
    {
        soapbody = [soapbody stringByAppendingFormat:@"<%@>%@</%@>\n",key,obj,key];
    }];
    //generate soapMsg
    NSString *soapMsg = [NSString stringWithFormat:
                         @"<?xml version=\"1.0\" encoding=\"utf-8\"?> \n"
                         "<soap12:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap12=\"http://www.w3.org/2003/05/soap-envelope\"> \n"
                         "<soap12:Header>"
                         "<MySoapHeader xmlns=\"http://tempuri.org/\">"
                         "<Token>%@</Token>"
                         "</MySoapHeader>"
                         "</soap12:Header>"
                         "<soap12:Body> \n"
                         "<%@ xmlns=\"%@\"> \n"
                         "%@"
                         "</%@>\n"
                         "</soap12:Body> \n"
                         "</soap12:Envelope>",
                         @"",action,@"http://tempuri.org/",soapbody,action];
    
    MKNetworkOperation *operation = [self operationWithURLString:webservice params:nil httpMethod:@"POST"];
    
    [operation setCustomPostDataEncodingHandler:^NSString *(NSDictionary *postDataDict)
     {
         return soapMsg;
     } forType:@"application/soap+xml"];
    
    [operation addCompletionHandler:^(MKNetworkOperation *completedOperation)
     {
         DLog(@"\nWebService Response:%@",completedOperation);
         if (successBlock)
         {
             successBlock(completedOperation,completedOperation.responseString);
         }
     } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error)
     {
         if (errorBlock)
         {
             errorBlock(error);
         }
     }];
    DLog(@"\nWebService Request:%@",operation);
    [self enqueueOperation:operation];
    
    return operation;
}

- (void)canelAllOperations
{
    [_workingOperations makeObjectsPerformSelector:@selector(cancel)];
    [_workingOperations removeAllObjects];
}


@end
