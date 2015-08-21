//
//  UserInteractionController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "UserInteractionController.h"
#import "Vuetrx.h"

@implementation UserInteractionController

- (id)init
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

-(void)startServerPing
{
    self.serverPollTimer = [NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(onTick:) userInfo:nil repeats:YES];
}

-(void)onTick:(NSTimer *)timer {
    //do smth
    [self retrieveUserLP];
}


-(void)retrieveUserLP
{
    NSLog(@"Poll User");
    [[[Vuetrx sharedInstance] getNetworkManager] makeUserRequest:self];
}

-(void)onGotData:(NSString *)data
{
    NSLog(data);
    
    int loyalPoint =  [data intValue];
    
    if(loyalPoint >= 250)
    {
        [self.serverPollTimer invalidate];
        [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:BAR_CODE];
    }
    
}

-(void)onGotError:(int)code withMessage:(NSString *)errorMessage
{
    
}

@end
