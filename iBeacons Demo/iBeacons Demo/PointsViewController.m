//
//  PointsViewController.m
//  iBeacons Demo
//
//  Copyright (c) 2015 Clearbridge Mobile Inc. All rights reserved.
//

#import "PointsViewController.h"
#import "Vuetrx.h"

@interface PointsViewController ()

@end

@implementation PointsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vuetrx_demo_v2-02"]];
    imgView.frame = [[UIScreen mainScreen] bounds];
    imgView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imgView.contentMode = UIViewContentModeScaleToFill;
    [self.view addSubview:imgView];
    
    CGRect collectionRect = [[UIScreen mainScreen] bounds];
    CGRect recoRect = [[UIScreen mainScreen] bounds];
    
    recoRect.size.width = recoRect.size.height * 0.6f;
    recoRect.origin.y = recoRect.size.width;
    recoRect.size.height = recoRect.size.width * 0.2f;
    collectionRect.origin.x = collectionRect.size.height * 0.60f;
    collectionRect.size.width = collectionRect.size.height * 0.40f;
  
    UIButton* collectionBtn = [[UIButton alloc] initWithFrame:collectionRect];
    [collectionBtn addTarget:self action:@selector(collectionPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:collectionBtn];
    
    UIButton* recoBtn = [[UIButton alloc] initWithFrame:recoRect];
    [recoBtn addTarget:self action:@selector(recommendationPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:recoBtn];

    
}

-(void)collectionPressed
{
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:COLLECTIONS];
}

-(void)recommendationPressed
{
    
    [[[Vuetrx sharedInstance] getNavigationManager] goToPageWithEnum:RECOMMENDATIONS];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
