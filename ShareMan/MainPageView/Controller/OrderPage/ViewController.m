//
//  ViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
    
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
