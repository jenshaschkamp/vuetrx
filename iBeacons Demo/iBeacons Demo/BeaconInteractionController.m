//
//  UserInteractionController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "BeaconInteractionController.h"
#import "Vuetrx.h"

@interface BeaconInteractionController ()

@end

@implementation BeaconInteractionController



- (id)init
{
    self = [super init];
    
    if (self) {
    
    }
    
    return self;
}


-(void)beaconFound
{
    [[[Vuetrx sharedInstance] getNetworkManager] updateSF:self];
}

-(void)resetDemo
{
    [[[Vuetrx sharedInstance] getNetworkManager] resetDemo:self];
}

-(void)signUpressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:SIGNUP];
}

-(void)clickedCollection
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:RECOMMENDATIONS];
}

-(void) onGotData:(NSString *)data
{
    NSLog(data);
    
    int loyaltyPoint = [data intValue];
    
    
    if(loyaltyPoint == 249)
    {
        [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:RESET];
    }
    else if (loyaltyPoint >=250)
    {
        [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:POINTS];
    }
    
}


-(void)onGotError:(int)code withMessage:(NSString *)errorMessage
{
    
}

@end
