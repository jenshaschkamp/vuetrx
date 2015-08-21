//
//  Vuetrx.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "Vuetrx.h"
#import "NavigationManager.h"
#import "NetworkDelegate.h"

@implementation Vuetrx

-(id)init{
    self = [super init];
    
    if(self)
    {
    }
    
    return self;
}

+(id)sharedInstance
{
    static Vuetrx *vuetrx = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vuetrx = [[self alloc] init];
    });
    return vuetrx;
}

-(NetworkManager*)getNetworkManager
{
    return [NetworkManager sharedInstance];
}

-(NavigationManager*)getNavigationManager
{
    return [NavigationManager sharedInstance];
}

@end
