//
//  Networking.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperationManager;

@interface NetworkingImpl : NSObject

/*
 * @brief: Saved reference of the request manager we will be using to make service calls.
 */
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

- (void)makeGetRequestWithNSString:(NSString *)url withNSDictionary:(NSDictionary *)headers withNSDictionary:(NSDictionary *)params withNSString:(NSString *)requestID;
- (void)makePostRequestWithNSString:(NSString *)url withNSDictionary:(NSDictionary *)headers withNSDictionary:(NSDictionary *)params withNSString:(NSString *)requestID;
- (void)makePutRequestWithNSString:(NSString *)url withNSDictionary:(NSDictionary *)headers withNSDictionary:(NSDictionary *)params withNSString:(NSString *)requestID;
- (void)makeDeleteRequestWithNSString:(NSString *)url withNSDictionary:(NSDictionary *)headers withNSDictionary:(NSDictionary *)params withNSString:(NSString *)requestID;

@end
