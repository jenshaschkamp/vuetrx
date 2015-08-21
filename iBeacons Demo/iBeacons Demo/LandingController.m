//
//  LandingController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "LandingController.h"
#import "Vuetrx.h"

@implementation LandingController


- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}



-(void)pressedBtnApp
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:BROADCAST];
}

-(void)pressedBtnKiosk
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:TRACK];
}

@end
