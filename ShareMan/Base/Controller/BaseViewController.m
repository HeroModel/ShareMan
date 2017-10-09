//
//  BaseViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self preferredStatusBarStyle];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.translucent = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.navigationController.additionalSafeAreaInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    } else {
        // Fallback on earlier versions
    }
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    
    
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
   
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: UIColorFromRGB(GLOBAL_TITLE_COLOR),
                                                                    NSFontAttributeName: NAV_TITLE_FONT_S
                                                                    };
    //导航栏下方阴影
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.navigationController.navigationBar setShadowImage:[UIImage imageNamed:@"nav-image"]];
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    
//    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(0, -350, SCREEN_WIDTH, SCREEN_HEIGHT)];
//    image.image = [UIImage imageNamed:@"bg-kaitong"];
//    image.contentMode = UIViewContentModeScaleToFill;
//    [self.view addSubview:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
