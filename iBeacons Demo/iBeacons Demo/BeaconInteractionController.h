//
//  UserInteractionController.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkResponseDelegate.h"

@interface BeaconInteractionController : NSObject  <NetworkResponseDelegate>

-(void)beaconFound;
-(void)resetDemo;
-(void)signUpressed;
-(void)clickedCollection;

@end
