//
//  NetworkManager.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkResponseDelegate.h"
#import "NetworkingImpl.h"

@interface NetworkManager : NSObject

+(id)sharedInstance;

@property (nonatomic, strong) NetworkingImpl* networkingImpl;
@property (nonatomic, strong) NSMutableDictionary* requests;

-(void)updateSF:(id<NetworkResponseDelegate>)networkResponce;
-(void)makeUserRequest:(id<NetworkResponseDelegate>)networkResponce;
-(void)resetDemo:(id<NetworkResponseDelegate>)networkResponce;
-(void) onSuccess:(NSString*) payload withID: (NSString*)requestID;
-(void) onError:(int)errorCode withPayload:(NSString*) payload withID: (NSString*)requestID;

@end
