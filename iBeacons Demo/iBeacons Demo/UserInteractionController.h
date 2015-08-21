//
//  UserInteractionController.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkResponseDelegate.h"

@interface UserInteractionController : NSObject  <NetworkResponseDelegate>

-(void)startServerPing;
-(void)retrieveUserLP;
@property (strong, nonatomic) NSTimer* serverPollTimer;

@end
