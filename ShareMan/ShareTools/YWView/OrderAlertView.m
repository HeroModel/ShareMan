//
//  OrderAlertView.m
//  ShareMan
//
//  Created by apple on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderAlertView.h"

@interface OrderAlertView ()<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
@end
@implementation OrderAlertView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        [self createView];
    }
    return self;
}
- (void)createView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 8;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(181 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 142 * HEIGHTFIT));
    }];
    
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"输入快递单号";
    self.textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.font = NAM_TITLE_B;
    self.textField.clearButtonMode = UITextFieldViewModeNever;
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    self.textField.returnKeyType = UIReturnKeyNext;
    self.textField.delegate = self;
    UIButton *button = [self.textField valueForKey:@"_clearButton"];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [button setImage:[[UIImage imageNamed:@"btn-clear"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [view addSubview:_textField];
    
    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(35 * HEIGHTFIT);
        make.left.equalTo(40 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(225 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_textField.bottom).offset(13 * HEIGHTFIT);
        make.left.equalTo(40 * WIDTHFIT);
        make.right.equalTo(-40 * WIDTHFIT);
        make.height.equalTo(@0.5);
    }];
    
    UIButton * button1 = [UIButton StringButtonWithType:UIButtonTypeCustom WithString:@"取消" target:self action:@selector(didButtonDismiss:)];
    [view addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(17 * HEIGHTFIT);
        make.left.equalTo(45 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(90 * WIDTHFIT, 33 * HEIGHTFIT));
    }];
    
    UIButton * button2 = [UIButton StringButtonWithType:UIButtonTypeCustom WithString:@"确认" target:self action:@selector(didButtonDetermine:)];
    [view addSubview:button2];
    [button2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(17 * HEIGHTFIT);
        make.left.equalTo(button1.right).offset(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(90 * WIDTHFIT, 33 * HEIGHTFIT));
    }];
    
}
- (void)didButtonDismiss:(UIButton *)sender
{
    [self endEditing:YES];
    if ([self.delegate respondsToSelector:@selector(didDismissView)]) {
        [self.delegate didDismissView];
    }
}
- (void)didButtonDetermine:(UIButton *)sender
{
    [self endEditing:YES];
    if ([self.delegate respondsToSelector:@selector(didConfirmButton)]) {
        [self.delegate didConfirmButton];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
@end
