//
//  RecommendationViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "RecommendationViewController.h"
#import "Vuetrx.h"

@interface RecommendationViewController ()


@end

@implementation RecommendationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-08"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    CGRect collectionRect = [[UIScreen mainScreen] bounds];
    CGRect backRect = [[UIScreen mainScreen] bounds];
    
    backRect.size.width = backRect.size.height * 0.5f;
    backRect.origin.y = backRect.size.width;
    collectionRect.origin.x = collectionRect.size.height * 0.50f;
    collectionRect.origin.y = collectionRect.size.height *0.5;
    collectionRect.size.width = collectionRect.size.height * 0.50f;
    collectionRect.size.height = collectionRect.size.width * 0.5f;
    
    UIButton* collectionBtn = [[UIButton alloc] initWithFrame:collectionRect];
    [collectionBtn addTarget:self action:@selector(collectionPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionBtn];
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:backRect];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
}

-(void)viewDidAppear:(BOOL)animated
{
}

-(void)backPressed;
{
    [[[Vuetrx sharedInstance] getNavigationManager] backBtnPressed];
}

-(void)collectionPressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:COLLECTIONS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
