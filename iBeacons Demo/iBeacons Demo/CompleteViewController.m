//
//  CompleteViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "CompleteViewController.h"
#import "Vuetrx.h"

@interface CompleteViewController ()

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-17"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    CGRect backRect = [[UIScreen mainScreen] bounds];
    CGRect collecRect = [[UIScreen mainScreen] bounds];
    
    backRect.size.width = backRect.size.height/2;
    collecRect.origin.x = collecRect.size.height/2;
    collecRect.size.width = collecRect.size.height/2;
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:backRect];
    [backBtn addTarget:self action:@selector(exitPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton* collectBtn = [[UIButton alloc] initWithFrame:collecRect];
    [collectBtn addTarget:self action:@selector(collectPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)exitPressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:RESET];
}

-(void)collectPressed
{
     [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:COLLECTIONS];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
