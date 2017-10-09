//
//  OrderViewController.m
//  ShareMan
//
//  Created by mac on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderViewController.h"
#import "SubmitSuccessfulViewController.h"

@interface OrderViewController ()<UITextFieldDelegate>

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"回收下单";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackPushVC:)];
    self.navigationItem.leftBarButtonItem = left;
    
    [self createView];
}
- (void)createView
{
    UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"iPhone 7";
    [self.view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(40 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(SIGN_COLOR)];
    label1.text = @"¥ 1889";
    [self.view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UILabel * label2 = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label2.text = @"此价为预估价,回收价以最终检测为准";
    [self.view addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(11 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UILabel * label3 = [UILabel StringWithFont:NAV_TITLE_N WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label3.text = @"收款账号";
    [self.view addSubview:label3];
    [label3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label2.bottom).offset(50 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * label4 = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label4.text = @"请务必确保账号使用";
    [self.view addSubview:label4];
    [label4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label3.bottom).offset(12 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UITextField * textField = [UITextField textFieldWithPlaceholder:@"输入收款人真名" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE WithTarget:self];
    [self.view addSubview:textField];
    [textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label4.bottom).offset(35 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.right.equalTo(-50 * WIDTHFIT);
        make.height.equalTo(14 * HEIGHTFIT);
    }];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    [self.view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.right.equalTo(-50 * WIDTHFIT);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    
    UITextField * textField1 = [UITextField textFieldWithPlaceholder:@"输入支付宝账号" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE WithTarget:self];
    [self.view addSubview:textField1];
    [textField1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.right.equalTo(-50 * WIDTHFIT);
        make.height.equalTo(14 * HEIGHTFIT);
    }];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    [self.view addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField1.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.right.equalTo(-50 * WIDTHFIT);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    
    UILabel * label5 = [UILabel StringWithFont:NAV_TITLE_N WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label5.text = @"回收方式";
    [self.view addSubview:label5];
    [label5 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(73 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * label6 = [UILabel StringWithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label6.text = @"全国快递包邮(包邮标准请看回收条款),回收完成后快递费用随回收金额一同转账.";
    label6.numberOfLines = 0;
    [self.view addSubview:label6];
    [label6 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label5.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(50 * WIDTHFIT);
        make.right.equalTo(-50 * WIDTHFIT);
        make.height.equalTo(35 * HEIGHTFIT);
    }];
    
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"提交订单" WithBackgroundColor:UIColorFromRGB(GR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_FONT target:self action:@selector(didSubmitButton:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label6.bottom).offset(60 * HEIGHTFIT);
        make.left.equalTo(60 * WIDTHFIT);
        make.right.equalTo(-60 * WIDTHFIT);
        make.height.equalTo(45 * HEIGHTFIT);
    }];
}
- (void)didSubmitButton:(UIButton *)sender
{
    SubmitSuccessfulViewController * subVC = [[SubmitSuccessfulViewController alloc] init];
    [self.navigationController pushViewController:subVC animated:NO];
}
- (void)didBackPushVC:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
