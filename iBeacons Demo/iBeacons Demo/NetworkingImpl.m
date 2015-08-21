//
//  Networking.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "NetworkingImpl.h"

#import "AFHTTPRequestOperationManager.h"
#import "Vuetrx.h"
#import "Constants.h"


@implementation NetworkingImpl

- (id)init
{
    self = [super init];
    
    if (self) {
        [[AFNetworkReachabilityManager sharedManager] startMonitoring];
        
        self.manager = [AFHTTPRequestOperationManager manager];
        
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [self.manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        self.manager.responseSerializer = [AFJSONResponseSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [self.manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    }
    
    return self;
}

#pragma mark - Library Inherited Network Calls

- (void)makeGetRequestWithNSString:(NSString *)url
             withNSDictionary:(NSDictionary *)headers
             withNSDictionary:(NSDictionary *)params
                      withNSString:(NSString *)requestID
{
  
    
    [self setHTTPHeadersForDictionary:headers];
    [self.manager GET:url
           parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  if (responseObject) {
                     //TODO
                  } else {
                      NSError *error = [NSError errorWithDomain:@"servicecallmanager" code:404 userInfo:nil];
                    //TODO
                  }
              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                  id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                  
                  //TODO
              }];
}

- (void)makePostRequestWithNSString:(NSString *)url
              withNSDictionary:(NSDictionary *)headers
              withNSDictionary:(NSDictionary *)params
                       withNSString:(NSString *)requestID
{
 
    
    [self setHTTPHeadersForDictionary:headers];
    
    [self.manager POST:url
            parameters:params
               success:^(AFHTTPRequestOperation *operation, id responseObject) {
                   if (responseObject) {
                      //TODO
                       NSDictionary *result = responseObject[@"result"];
                       
                       NSArray* loyaltyPointArray = (NSArray*)[result valueForKey:LOYALTY_POINTS];
                       
                       NSString* loyaltyPoint = [[loyaltyPointArray objectAtIndex:0] stringValue];
                       
                       [[[Vuetrx sharedInstance] getNetworkManager] onSuccess:loyaltyPoint withID:requestID];

                       
                   } else {
                       NSError *error = [NSError errorWithDomain:@"servicecallmanager" code:404 userInfo:nil];
                       //TODO
                   }
               }
               failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                   NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                   
                   //TODO
               }];
    
}

- (void) makePutRequestWithNSString:(NSString *)url
              withNSDictionary:(NSDictionary *)headers
              withNSDictionary:(NSDictionary *)params
                       withNSString:(NSString *)requestID
{
  
    
    [self setHTTPHeadersForDictionary:headers];
    
    [self.manager PUT:url
           parameters:params
              success:^(AFHTTPRequestOperation *operation, id responseObject) {
                  if (responseObject) {
                      //TODO
                  } else {
                      NSError *error = [NSError errorWithDomain:@"servicecallmanager" code:404 userInfo:nil];
                      //TODO
                  }
              }
              failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                  NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                  id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                  
                  //TODO
              }];
}

-( void)makeDeleteRequestWithNSString:(NSString *)url
                withNSDictionary:(NSDictionary *)headers
                withNSDictionary:(NSDictionary *)params
                         withNSString:(NSString *)requestID
{
   
    
    [self setHTTPHeadersForDictionary:headers];
    
    [self.manager DELETE:url
              parameters:params
                 success:^(AFHTTPRequestOperation *operation, id responseObject) {
                     if (responseObject) {
                         //TODO
                     } else {
                         NSError *error = [NSError errorWithDomain:@"servicecallmanager" code:404 userInfo:nil];
                         //TODO
                     }
                 }
                 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                     NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
                     id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                     //TODO
                 }];
}



#pragma mark - Private Implementation Helper Methods

- (NSString*)convertResponseObjectToString:(id)responseObject
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject
                                                       options:0
                                                         error:nil];
    NSString *str = [[NSString alloc] initWithData:jsonData
                                          encoding:NSUTF8StringEncoding];
    
    return str;
}

- (void)setHTTPHeadersForDictionary:(NSDictionary*)headers
{
    for (NSString* key in headers)
    {
        [self.manager.requestSerializer setValue:[headers objectForKey:key]
                              forHTTPHeaderField:key];
    }
}

@end
