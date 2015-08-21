//
//  TrackViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "TrackViewController.h"
#import "Constants.h"
#import "Vuetrx.h"

@interface TrackViewController ()

@end

@implementation TrackViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self initRegion];
    self.beaconInterration = [[BeaconInteractionController alloc] init];
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-16"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    UIButton* signBtn = [[UIButton alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [signBtn addTarget:self action:@selector(signUpPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:signBtn];
    
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
}

- (void)initRegion {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:APP_UUID];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid identifier:@"SFDemo"];
    [self.locationManager startMonitoringForRegion:self.beaconRegion];
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    NSLog(@"Beacon Found");
    [self.locationManager startRangingBeaconsInRegion:self.beaconRegion];
    
    [self foundUser];
    
    
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    NSLog(@"Left Region");
    [self.locationManager stopRangingBeaconsInRegion:self.beaconRegion];
    [self reset];
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)foundUser
{
    [self.beaconInterration beaconFound];
}

-(void)reset
{
    [self.beaconInterration resetDemo];
}

-(void)signUpPressed
{
    [self.beaconInterration signUpressed];
}





@end
