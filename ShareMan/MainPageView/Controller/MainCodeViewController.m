//
//  MainCodeViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MainCodeViewController.h"
#import "MainViewController.h"

@interface MainCodeViewController ()<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * phonetextField;
/** <#注释#> */
@property(nonatomic, strong) UIButton * nextButton;
/** <#注释#> */
@property(nonatomic, strong) NSString * phoneStr;
@end

@implementation MainCodeViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    [self.phonetextField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createLogin];
}
- (void)createLogin
{
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(35 * WIDTHFIT, 113 * HEIGHTFIT, 310 * WIDTHFIT, 232 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    UIView * bigView = [[UIView alloc] init];
    bigView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    bigView.userInteractionEnabled = YES;
    [self.view addSubview:bigView];
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = 10 * WIDTHFIT;
    [self.view addSubview:bigView];
    [bigView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(113 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(310 * WIDTHFIT, 232 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"image-close-2" target:self action:@selector(dismissButton:)];
    [bigView addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.right.equalTo(-15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(20 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"验证码";
    label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = NAM_TITLE_FONT_M;
    [bigView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(40 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    self.phonetextField = [[UITextField alloc] init];
    self.phonetextField.placeholder = @"输入短信验证码";
    self.phonetextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.phonetextField.textAlignment = NSTextAlignmentLeft;
    self.phonetextField.font = NAM_TITLE_B;
    self.phonetextField.keyboardType = UIKeyboardTypePhonePad;
    [self.phonetextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.phonetextField.delegate = self;
    [bigView addSubview:self.phonetextField];
    [_phonetextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(40 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    [bigView addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phonetextField.bottom).offset(12 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
    [self.nextButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.nextButton setTitleColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) forState:UIControlStateNormal];
    self.nextButton.titleLabel.font = NAM_TITLE_B;
    self.nextButton.userInteractionEnabled = NO;
    [self.nextButton addTarget:self action:@selector(didNextPushButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.nextButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    self.nextButton.layer.masksToBounds = YES;
    self.nextButton.layer.cornerRadius = 8.0f;
    [bigView addSubview:_nextButton];
    [_nextButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
}
//只允许输入数字，且只有11位数
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length == 4) {
        if ([string isEqualToString:@""]) {
            return YES;
        }
        else {
            return NO;
        }
    }
    return [self validateNumber:string];
}
//只允许输入数字
- (BOOL)validateNumber:(NSString*)number{
    BOOL res = YES;
    NSCharacterSet* tmpSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    int i = 0;
    while (i < number.length) {
        NSString * string = [number substringWithRange:NSMakeRange(i, 1)];
        NSRange range = [string rangeOfCharacterFromSet:tmpSet];
        if (range.length == 0) {
            res = NO;
            break;
        }
        i++;
    }
    return res;
}
- (void)textFieldDidChange:(UITextField *)textField
{
    NSUInteger length = textField.text.length;
    if (length == 4) {
        self.nextButton.enabled = YES;
        self.nextButton.backgroundColor = UIColorFromRGB(GR_COLOR);
        [textField resignFirstResponder];
    }else
    {
        self.nextButton.enabled = NO;
        self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    if (textField.text && [textField.text length] == 4) {
        self.phoneStr = textField.text;
        self.nextButton.userInteractionEnabled = YES;
    }else{
        self.nextButton.userInteractionEnabled = NO;
        
        
    }
}
- (void)didNextPushButton:(UIButton *)sender
{
    [self phone:_str WithIdentifyCode:_phoneStr];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (void)dismissButton:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)phone:(NSString *)phone WithIdentifyCode:(NSString *)identifyCode
{
    
    //    NSDictionary * dic = @{@"phone":[NSString stringWithFormat:@"%@", phone],
    //                           @"identifyCode":[NSString stringWithFormat:@"%@", identifyCode]};
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&identifyCode=%@", phone, identifyCode];
    [NetTools POSTNetWithUrl:DENGLU body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"%@", result);
        NSString * string = result[@"code"];
        if ([string isEqualToString:@"0"]) {
            NSString * phone = [UserDefaults objectForKey:@"phoneNumber"];
            NSString * token = [UserDefaults objectForKey:@"token"];
            
            if (isValidString(phone)) {
                [UserDefaults removeObjectForKey:@"phoneNumber"];
            }
            
            if (isValidString(token)) {
                [UserDefaults removeObjectForKey:@"token"];
            }
            
            [UserDefaults setObject:result[@"data"][@"phoneNumber"] forKey:@"phoneNumber"];
            [UserDefaults setObject:result[@"data"][@"token"] forKey:@"token"];
            [MBProgressShow ShowMBProgress:@"登录成功" WithTimer:1 WithView:self.view];
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pushVC) userInfo:nil repeats:NO];
            
        }else if ([string isEqualToString:@"1011"]) {
            [MBProgressShow ShowMBProgress:@"验证码输入错误" WithTimer:1 WithView:self.view];
        }else{
            [MBProgressShow ShowMBProgress:@"验证码已过期，请重新获取" WithTimer:1 WithView:self.view];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
}
- (void)pushVC
{
    [self.phonetextField resignFirstResponder];
    for (UIViewController * controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[MainViewController class]]) {
            [self.navigationController popToViewController:controller animated:NO];
        }
    }
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
