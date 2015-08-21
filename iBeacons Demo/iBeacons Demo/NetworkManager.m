//
//  NetworkManager.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "NetworkManager.h"
#import "Constants.h"

@implementation NetworkManager

enum RestType {
  
    GET,
    POST,
    PUT,
    DELETE
    
};


-(id)init{
    self = [super init];
    
    if(self)
    {
        self.networkingImpl = [[NetworkingImpl alloc] init];
        self.requests = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

+(id)sharedInstance
{
    static NetworkManager *networkManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkManager = [[self alloc] init];
    });
    return networkManager;
}

-(void)resetDemo:(id<NetworkResponseDelegate>)networkResponce
{
    NSDictionary* headers = [[NSDictionary alloc] init];
    NSDictionary* params = [[NSDictionary alloc] init];
    
    [self makeRequestWithRestType:POST withNSString:HEROKU_ENDPOINT_RESET withHeaders:headers withParams:params withCallback:networkResponce];
}


-(void)updateSF:(id<NetworkResponseDelegate>)networkResponce
{
    NSDictionary* headers = [[NSDictionary alloc] init];
    NSDictionary* params = [[NSDictionary alloc] init];
    
    [self makeRequestWithRestType:POST withNSString:HEROKU_ENDPOINT_BEACON withHeaders:headers withParams:params withCallback:networkResponce];
}

-(void)makeUserRequest:(id<NetworkResponseDelegate>)networkResponce
{
    NSDictionary* headers = [[NSDictionary alloc] init];
    NSDictionary* params = [[NSDictionary alloc] init];
    
    [self makeRequestWithRestType:POST withNSString:HEROKU_ENDPOINT_USER withHeaders:headers withParams:params withCallback:networkResponce];
}

-(void) makeRequestWithRestType:(ResType) type
                   withNSString:(NSString*) url
                    withHeaders:(NSDictionary*) headers
                     withParams:(NSDictionary*) params
                   withCallback:(id<NetworkResponseDelegate>) callback
{
    NSString *requestID = [[NSUUID UUID] UUIDString];

    [self.requests setObject:callback forKey:requestID];
    
    switch (type) {
        case GET:
            [self.networkingImpl makeGetRequestWithNSString:url withNSDictionary:headers withNSDictionary:params withNSString:requestID];
            break;
        case POST:
            [self.networkingImpl makePostRequestWithNSString:url withNSDictionary:headers withNSDictionary:params withNSString:requestID];
            break;
        case PUT:
            [self.networkingImpl makePutRequestWithNSString:url withNSDictionary:headers withNSDictionary:params withNSString:requestID];
            break;
        case DELETE:
            [self.networkingImpl makeDeleteRequestWithNSString:url withNSDictionary:headers withNSDictionary:params withNSString:requestID];
            break;
            
        default:
            break;
    }
    
}

-(void) onError:(int)errorCode withPayload:(NSString *)payload withID:(NSString *)requestID
{
    id<NetworkResponseDelegate> callback = (id<NetworkResponseDelegate>)[self.requests objectForKey:requestID];
    
    if(callback != nil){
        [callback onGotError:errorCode withMessage:payload];
    }
    
    [self.requests removeObjectForKey:requestID];
    
}

-(void) onSuccess:(NSString *)payload withID:(NSString *)requestID
{
    id<NetworkResponseDelegate> callback = (id<NetworkResponseDelegate>)[self.requests objectForKey:requestID];
    
    if(callback != nil){
        [callback onGotData:payload];
    }
    
    [self.requests removeObjectForKey:requestID];
}

@end

