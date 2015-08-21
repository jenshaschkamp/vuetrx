//
//  NavigationManager.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "NavigationManager.h"
#import "RecommendationViewController.h"
#import "BarCodeViewController.h"
#import "WelcomeViewController.h"
#import "CollectionViewController.h"
#import "PointsViewController.h"
#import "ConfigViewController.h"
#import "TrackViewController.h"
#import "SignUpViewController.h"
#import "CompleteViewController.h"

@implementation NavigationManager

+(id)sharedInstance
{
    static NavigationManager *navigationManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        navigationManager = [[self alloc] init];
    });
    return navigationManager;
}

-(void)seteNavController:(UINavigationController *)navController
{
    self.MYNAVcontroller = navController;
}

-(void)goToPageWithEnum:(PageID)pageID{

    
    switch (pageID) {
        case TRACK:
        {
            TrackViewController* track = [[TrackViewController alloc] init];
            track.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:track animated:YES];
        }
            break;
            
        case BROADCAST:
        {
            ConfigViewController* broadcast = [[ConfigViewController alloc] init];
            broadcast.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:broadcast animated:YES];
        }
            break;
            
        case RECOMMENDATIONS:
        {
            RecommendationViewController* recommendation = [[RecommendationViewController alloc] init];
            recommendation.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:recommendation animated:YES];
        }
            break;
            
        case COLLECTIONS:
        {
            CollectionViewController* collection = [[CollectionViewController alloc] init];
            collection.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:collection animated:YES];
        }
            break;
            
        case WELCOME:
        {
            WelcomeViewController* welcome = [[WelcomeViewController alloc] init];
            welcome.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:welcome animated:YES];
        }
            break;
            
        case BAR_CODE:
        {
            BarCodeViewController* barCode = [[BarCodeViewController alloc] init];
            barCode.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:barCode animated:YES];
        }
            break;
        case POINTS:
        {
            PointsViewController* points = [[PointsViewController alloc] init];
            points.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:points animated:YES];
        }
            break;
        case SIGNUP:
        {
            SignUpViewController* signup = [[SignUpViewController alloc] init];
            signup.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:signup animated:YES];
        }
            break;
        case COMPLETE:
        {
            CompleteViewController* complete = [[CompleteViewController alloc] init];
            complete.view.frame = self.MYNAVcontroller.view.bounds;
            [self.MYNAVcontroller pushViewController:complete animated:YES];
        }
            break;
        case RESET:
        {
            NSArray *array = [self.MYNAVcontroller viewControllers];
            [self.MYNAVcontroller popToViewController:[array objectAtIndex:1] animated:YES];
            break;

        }
           
            
        default:
            break;
    }
}

-(void)backBtnPressed
{
    [self.MYNAVcontroller popViewControllerAnimated:YES];
}

@end
