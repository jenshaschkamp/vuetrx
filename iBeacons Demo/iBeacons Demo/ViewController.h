//
//  ViewController.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "LandingController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) LandingController* landingController;

-(void)pressedKiosk;
-(void)pressedApp;

@end
