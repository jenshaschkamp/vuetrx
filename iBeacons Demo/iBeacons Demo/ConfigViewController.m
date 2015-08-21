//
//  ConfigViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "ConfigViewController.h"
#import "Constants.h"
#import "Vuetrx.h"

@interface ConfigViewController ()

@end

@implementation ConfigViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self initBeacon];
    [self startBroadcasting];
    self.userinteractionController = [[UserInteractionController alloc] init];
    
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-06"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
    [self pollServer];
}

-(void)backPressed
{
    [self.peripheralManager stopAdvertising];
    NSLog(@"Powered Off");
    [[[Vuetrx sharedInstance] getNavigationManager] backBtnPressed];
}


- (void)initBeacon {
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:APP_UUID];
    self.beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                                major:USER_MAJOR
                                                                minor:USER_MINOR
                                                           identifier:@"VueTrx"];
}




- (IBAction)transmitBeacon:(UIButton *)sender {
 
}

-(void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        NSLog(@"Powered On");
        [self.peripheralManager startAdvertising:self.beaconPeripheralData];
    } else if (peripheral.state == CBPeripheralManagerStatePoweredOff) {
        NSLog(@"Powered Off");
        [self.peripheralManager stopAdvertising];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)startBroadcasting
{
    self.beaconPeripheralData = [self.beaconRegion peripheralDataWithMeasuredPower:nil];
    self.peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                     queue:nil
                                                                   options:nil];
}

-(void)pollServer
{
    [self.userinteractionController startServerPing];
}
@end
