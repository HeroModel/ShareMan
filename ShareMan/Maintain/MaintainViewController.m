//
//  MaintainViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MaintainViewController.h"

@interface MaintainViewController ()

@end

@implementation MaintainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.navigationItem.title = @"维修";
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(aaa)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIImageView * image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"bg-kaitong"];
    [self.view addSubview:image];
    [image makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(0);
        make.height.equalTo(280 * HEIGHTFIT);
    }];
}
- (void)aaa
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
