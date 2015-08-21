//
//  NetworkDelegate.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkDelegate <NSObject>

-(void) onSuccessWithPayload:(NSString*)payload withRequestID:(NSString*)requestID;
-(void) onErrorWithStatusCode:(int)statuscode withMessage:(NSString*)message withRequestID:(NSString*)requestID;

@end
