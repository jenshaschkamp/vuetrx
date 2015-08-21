//
//  SignUpViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "SignUpViewController.h"
#import "Vuetrx.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-15"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    CGRect backRect = [[UIScreen mainScreen] bounds];
    CGRect completeRect = [[UIScreen mainScreen] bounds];
    
    backRect.size.width = backRect.size.height/2;
    completeRect.origin.x = completeRect.size.height/2;
    completeRect.size.width = completeRect.size.height/2;
    
    UIButton* backBtn = [[UIButton alloc] initWithFrame:backRect];
    [backBtn addTarget:self action:@selector(backPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton* completeBtn = [[UIButton alloc] initWithFrame:completeRect];
    [completeBtn addTarget:self action:@selector(completePressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeBtn];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)backPressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] backBtnPressed];
}

-(void)completePressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:COMPLETE];
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
