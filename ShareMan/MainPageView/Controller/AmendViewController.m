//
//  AmendViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AmendViewController.h"
#import "NewAmendViewController.h"
#import "MQVerCodeInputView.h"

@interface AmendViewController ()
/** <#注释#> */
@property(nonatomic, strong) UIButton * nextButton;
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;
/** <#注释#> */
@property(nonatomic, copy) NSString * strCode;
@end

@implementation AmendViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"修改手机号";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;

    UILabel * label = [[UILabel alloc] init];
    label.text = PHONE_TESTING;
    label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = NAM_TITLE_B;
    [self.view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(40 * HEIGHTFIT);
        make.left.equalTo(62 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * view = [UIView lineWithView];
    [self.view addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(label);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    [self createView];
}
- (void)createView
{
    MQVerCodeInputView * verView = [[MQVerCodeInputView alloc] initWithFrame:CGRectMake(62 * WIDTHFIT, 112 * HEIGHTFIT, 150 * WIDTHFIT, 33 * HEIGHTFIT)];
    verView.keyBoardType = UIKeyboardTypeNumberPad;
    [verView mq_verCodeViewWithMaxLenght];
    verView.block = ^(NSString *text){
        if (text && [text length] == 4) {
            self.strCode = text;
            self.nextButton.backgroundColor = UIColorFromRGB(GR_COLOR);
            self.nextButton.userInteractionEnabled = YES;
        }else{
            self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
            self.nextButton.userInteractionEnabled = NO;
        }
    };
    [self.view addSubview:verView];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(232 * WIDTHFIT, 112 * HEIGHTFIT, 80 * WIDTHFIT, 33 * HEIGHTFIT);
    self.button.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
    [self.button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.button setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
    self.button.titleLabel.font = NAM_TITLE;
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 5.0f;
    self.button.layer.borderWidth = 0.5;
    self.button.layer.borderColor = UIColorFromRGB(GLOBAL_COLOR).CGColor;
    [self.button addTarget:self action:@selector(didButtonAuthCode:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    UIView * viewLines = [[UIView alloc] initWithFrame:CGRectMake(62 * WIDTHFIT, 160 * HEIGHTFIT, 250 * WIDTHFIT, 1 * HEIGHTFIT)];
    viewLines.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [self.view addSubview:viewLines];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.frame = CGRectMake(62 * WIDTHFIT, 206 * HEIGHTFIT, 250 * WIDTHFIT, 44 * HEIGHTFIT);
    self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
    [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NAM_TITLE_B;
    self.nextButton.userInteractionEnabled = NO;
    [self.nextButton addTarget:self action:@selector(didNextButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.layer.cornerRadius = 8.0f;
    [self.view addSubview:_nextButton];
}
- (void)didButtonAuthCode:(UIButton *)sender
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(globalQueue, ^{
        [self openCountdown];
    });
    dispatch_async(globalQueue, ^{
        [self upDataWithPhone:PHONE_TESTING];
    });
}
- (void)didNextButton:(UIButton *)sender
{
    [self upPhone:PHONE_TESTING WithCode:_strCode];
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)upDataWithPhone:(NSString *)stringPhone
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@", stringPhone];
    [NetTools POSTNetWithUrl:YANMA body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"发送成功注意查收" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
;
    }];
}
- (void)upPhone:(NSString *)phone WithCode:(NSString *)code
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&identifyCode=%@", phone, code];
    [NetTools POSTNetWithUrl:DENGLU body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        NSString * string = result[@"code"];
        if ([string isEqualToString:@"0"]) {
            
            NSString * token = [UserDefaults objectForKey:@"token"];
            
            if (isValidString(token)) {
                [UserDefaults removeObjectForKey:@"token"];
            }
            
            [UserDefaults setObject:result[@"data"][@"token"] forKey:@"token"];
            
            
            NewAmendViewController * newVC = [[NewAmendViewController alloc] init];
            newVC.oldPhone = PHONE_TESTING;
            [self.navigationController pushViewController:newVC animated:NO];
        }else if ([string isEqualToString:@"1001"]) {
            [MBProgressShow ShowMBProgress:@"验证码输入错误" WithTimer:1 WithView:self.view];
        }else{
            [MBProgressShow ShowMBProgress:@"验证码已过期，请重新获取" WithTimer:1 WithView:self.view];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
;
    }];
}
// 开启倒计时效果
- (void)openCountdown{
    
    __block NSInteger time = 59; //倒计时时间 59
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    
    dispatch_source_set_event_handler(_timer, ^{
        
        if(time <= 0){ //倒计时结束，关闭
            
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮的样式
                [self.button setTitle:@"获取验证码" forState:UIControlStateNormal];//重新发送
                [self.button setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
                self.button.userInteractionEnabled = YES;
//                [self upDataWithPhone:PHONE_TESTING];
            });
            
        }else{
            
            int seconds = time % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                //设置按钮显示读秒效果
                [self.button setTitle:[NSString stringWithFormat:@"%.2dS", seconds] forState:UIControlStateNormal];
                [self.button setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
                self.button.userInteractionEnabled = NO;
            });
            time--;
        }
    });
    dispatch_resume(_timer);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
