//
//  NavigationManager.h
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum PageIDTypes
{
    TRACK,
    BROADCAST,
    RECOMMENDATIONS,
    COLLECTIONS,
    WELCOME,
    BAR_CODE,
    POINTS,
    RESET,
    SIGNUP,
    COMPLETE
} PageID;

@interface NavigationManager : NSObject 

+(NavigationManager*)sharedInstance;

@property (nonatomic, strong) UINavigationController *MYNAVcontroller;

-(void)goToPageWithEnum:(PageID)pageID;
-(void)seteNavController:(UINavigationController*)navController;
-(void)backBtnPressed;

@end
