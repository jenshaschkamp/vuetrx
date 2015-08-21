//
//  TrackViewController.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "BeaconInteractionController.h"
#import "NetworkResponseDelegate.h"
#import "BeaconInteractionController.h"

@interface TrackViewController : UIViewController <CLLocationManagerDelegate>

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) BeaconInteractionController* beaconInterration;

-(void)signUpPressed;

@end
