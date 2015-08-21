//
//  ViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "ViewController.h"
#import "Vuetrx.h"
#import "LandingController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    self.landingController = [[LandingController alloc] init];
    
    CGRect appRect = [[UIScreen mainScreen] bounds];
    CGRect kioskRect = [[UIScreen mainScreen] bounds];
    
    if([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-09"]];
        imgView.frame = [[UIScreen mainScreen] bounds];
        imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        imgView.contentMode = UIViewContentModeScaleToFill;
        [self.view addSubview:imgView];
        
        kioskRect.size.width = kioskRect.size.height/2;
        appRect.origin.x = appRect.size.height/2;
        appRect.size.width = appRect.size.height/2;
    }
    else
    {
        kioskRect.size.height = kioskRect.size.height/2;
        appRect.origin.y = appRect.size.height/2;
        appRect.size.height = appRect.size.height/2;
    }

    
    UIButton* appBtn = [[UIButton alloc] initWithFrame:appRect];
    [appBtn addTarget:self action:@selector(pressedApp) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:appBtn];
    
    UIButton* kioskBtn = [[UIButton alloc] initWithFrame:kioskRect];
    [kioskBtn addTarget:self action:@selector(pressedKiosk) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:kioskBtn];
    
}

-(void)pressedApp
{
    [self.landingController pressedBtnApp];
}

-(void)pressedKiosk
{
    [self.landingController pressedBtnKiosk];
}

-(void)viewDidAppear:(BOOL)animated
{
    [[[Vuetrx sharedInstance ] getNavigationManager ] seteNavController:self.navigationController];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
