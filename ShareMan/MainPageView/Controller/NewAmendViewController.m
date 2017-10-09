//
//  NewAmendViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "NewAmendViewController.h"
#import "YWAmendPhont.h"
#import "DataViewController.h"

@interface NewAmendViewController ()<YWAmendPhontDelegate>
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * codeID;
@end

@implementation NewAmendViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改手机号";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    
    YWAmendPhont * amend = [[YWAmendPhont alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) WithString:@"输入新手机号"];
    amend.delegaet = self;
    [self.view addSubview:amend];
    
    
}
- (void)phone:(NSString *)phone
{
    self.phone = phone;
}
- (void)code:(NSString *)code
{
    self.codeID = code;
}
- (void)didCodeButton
{
    [self NewPhone:_phone];
}
- (void)didNextButtonController
{
    [self NewPhone:_phone WithCodeID:_codeID];
}

- (void)pushDataVC
{
    YWStringAlertView * stringView = [[YWStringAlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) WtihString:@"您已成功绑定新手机号"];
    [stringView show];
    
}
- (void)NewPhone:(NSString *)newPhone
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&newPhoneNumber=%@", phone, token, newPhone];
    [NetTools POSTNetWithUrl:NEWPHONE body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"new===%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"发送成功注意查收" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }
       else if([result[@"code"] isEqualToString:@"1011"]) {
            [MBProgressShow ShowMBProgress:@"该手机号已存在，请更换其他号码" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }else{
            [MBProgressShow ShowMBProgress:@"请输入新手机号码" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }
    } failure:^(NSError *error) {
//        NSLog(@"new===%@", error);
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
;
    }];
}
- (void)NewPhone:(NSString *)newPhone WithCodeID:(NSString *)codeID
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&newPhoneNumber=%@&identifyCode=%@", phone, token, newPhone, codeID];
    [NetTools POSTNetWithUrl:NEWCODE body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            NSString * phoneNew = [UserDefaults objectForKey:@"phoneNumber"];
            NSString * tokenNew = [UserDefaults objectForKey:@"token"];
            if (isValidString(phoneNew)) {
                [UserDefaults removeObjectForKey:@"phoneNumber"];
            }
            
            if (isValidString(tokenNew)) {
                [UserDefaults removeObjectForKey:@"token"];
            }
            
            [UserDefaults setObject:result[@"data"][@"phoneNumber"] forKey:@"phoneNumber"];
            [UserDefaults setObject:result[@"data"][@"token"] forKey:@"token"];
            
            for (UIViewController * controller in self.navigationController.viewControllers) {
                if ([controller isKindOfClass:[DataViewController class]]) {
                    [self.navigationController popToViewController:controller animated:YES];
                }
            }
            
            [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(pushDataVC) userInfo:nil repeats:NO];

            
        }else if ([result[@"code"] isEqualToString:@"1011"]) {
            [MBProgressShow ShowMBProgress:@"该手机号已存在，请更换其他号码" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }else{
            [MBProgressShow ShowMBProgress:@"请输入新手机号码" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }

    
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
