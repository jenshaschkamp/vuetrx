//
//  Vuetrx.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkManager.h"
#import "NavigationManager.h"

@interface Vuetrx : NSObject

+(id)sharedInstance;
-(NetworkManager*)getNetworkManager;
-(NavigationManager*)getNavigationManager;



@end
