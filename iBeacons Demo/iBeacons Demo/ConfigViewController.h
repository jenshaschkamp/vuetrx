//
//  ConfigViewController.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import "UserInteractionController.h"

@interface ConfigViewController : UIViewController <CBPeripheralManagerDelegate>

@property (strong, nonatomic) CLBeaconRegion *beaconRegion;
@property (strong, nonatomic) NSDictionary *beaconPeripheralData;
@property (strong, nonatomic) CBPeripheralManager *peripheralManager;
@property (strong,nonatomic) UserInteractionController* userinteractionController;

-(void)backPressed;

@end
