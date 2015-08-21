//
//  NetworkResponseDelegate.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkResponseDelegate <NSObject>

-(void) onGotData:(NSString*)data;
-(void) onGotError:(int)code withMessage:(NSString*)errorMessage;

@end
