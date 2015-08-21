//
//  BarCodeViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "BarCodeViewController.h"
#import "Vuetrx.h"

@interface BarCodeViewController ()

@end

@implementation BarCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-10"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

-(void)backPressed;
{
    [[[Vuetrx sharedInstance] getNavigationManager] backBtnPressed];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
