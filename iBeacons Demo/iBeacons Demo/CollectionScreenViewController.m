//
//  CollectionViewController.m
//  iBeacons Demo
//
//  Created by Taso Perdikoulias on 2015-04-10.
//  Copyright (c) 2015 Mobient. All rights reserved.
//

#import "CollectionScreenViewController.h"

@interface CollectionScreenViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation CollectionScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pe_kiosk-demo-03"]];
    
    [self.view addSubview:self.imageView];
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
