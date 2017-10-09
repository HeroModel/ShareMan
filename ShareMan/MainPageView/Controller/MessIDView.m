//
//  MessIDView.m
//  ShareMan
//
//  Created by apple on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MessIDView.h"

@interface MessIDView ()<UITextFieldDelegate, UITextViewDelegate>

@end
@implementation MessIDView
- (instancetype)init
{
    self = [super init];
    if (self) {
        UILabel * label = [UILabel labelString:@"真实姓名" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        [self addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 *WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.nameText = [UITextField textFieldWithPlaceholder:@"您的真实姓名" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        [self addSubview:_nameText];
        [_nameText makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(21.5 * HEIGHTFIT);
            make.left.equalTo(label.right).offset(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(170 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * view = [UIView lineWithView];
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.right.equalTo(-25 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label1 = [UILabel labelString:@"身份证号" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        [self addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 *WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.numText = [UITextField textFieldWithPlaceholder:@"有效身份证号" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        [self addSubview:_numText];
        [_numText makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.bottom).offset(21.5 * HEIGHTFIT);
            make.left.equalTo(label1.right).offset(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(170 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * view1 = [UIView lineWithView];
        [self addSubview:view1];
        [view1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label1.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.right.equalTo(-25 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        
        UILabel * label4 = [UILabel labelString:@"服务密码" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        [self addSubview:label4];
        [label4 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1.bottom).offset(21.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 *WIDTHFIT, 16 * HEIGHTFIT));
        }];

        self.passWord = [UITextField textFieldWithPlaceholder:@"手机号服务密码" WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B WithTarget:self];
        [self addSubview:_passWord];
        [_passWord makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view1.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(label4.right).offset(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(170 * WIDTHFIT, 14 * HEIGHTFIT));
        }];

        UIView * view4 = [UIView lineWithView];
        [self addSubview:view4];
        [view4 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label4.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.right.equalTo(-25 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        
        UILabel * label2 = [UILabel labelString:@"单位名称" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        [self addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view4.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 *WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.strText = [UITextView textViewWithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE WithTarget:self];
        [self addSubview:_strText];
        [_strText makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view4.bottom).offset(10.5 * HEIGHTFIT);
            make.left.equalTo(label4.right).offset(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(170 * WIDTHFIT, 30 * HEIGHTFIT));
        }];
        
        self.strLabel = [UILabel labelString:@"工作单位或所在院校" WithFont:NAM_TITLE WithTextColor:[UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00]];
        [self.strText addSubview:_strLabel];
        [_strLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(5 * HEIGHTFIT);
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(140 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIView * view2 = [UIView lineWithView];
        [self addSubview:view2];
        [view2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label2.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.right.equalTo(-25 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        UILabel * label3 = [UILabel labelString:@"现住地址" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        [self addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view2.bottom).offset(20.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(60 *WIDTHFIT, 14 * HEIGHTFIT));
        }];

        self.addressText = [UITextView textViewWithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE WithTarget:self];
//        self.addressText.scrollEnabled = NO;
        [self addSubview:_addressText];
        [_addressText makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view2.bottom).offset(0.5 * HEIGHTFIT);
            make.left.equalTo(label3.right).offset(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(180 * WIDTHFIT, 55 * HEIGHTFIT));
        }];

        self.addLabel = [UILabel labelString:@"您的现住地址" WithFont:NAM_TITLE WithTextColor:[UIColor colorWithRed:0.78 green:0.78 blue:0.80 alpha:1.00]];
        [self.addressText addSubview:_addLabel];
        [_addLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(10 * HEIGHTFIT);
            make.left.equalTo(0);
            make.size.equalTo(CGSizeMake(140 * WIDTHFIT, 14 * HEIGHTFIT));
        }];

        UIView * view3 = [UIView lineWithView];
        [self addSubview:view3];
        [view3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(label3.bottom).offset(30.5 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.right.equalTo(-25 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
    }
    return self;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.nameText == textField) {
        if ([self.delegate respondsToSelector:@selector(name:)]) {
            
            [self.delegate name:textField.text];
        }
    }
    if (self.numText == textField) {
        if ([self.delegate respondsToSelector:@selector(IdCardNo:)]) {
            
            [self.delegate IdCardNo:textField.text];
        }
    }
    if (self.passWord == textField) {
        if ([self.delegate respondsToSelector:@selector(password:)]) {
            
            [self.delegate password:textField.text];
        }
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if (self.strText == textView) {
        [self.strLabel removeFromSuperview];
    }
    if (self.addressText == textView) {
         [self.addLabel removeFromSuperview];
    }
   
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (self.strText == textView ) {
        if ([self.delegate respondsToSelector:@selector(company:)])
        {
            [self.delegate company:textView.text];
        }
    }
    if (self.addressText == textView) {
        if ([self.delegate respondsToSelector:@selector(address:)])
        {
            [self.delegate address:textView.text];
        }
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
- (void)setIsHiddle:(BOOL)isHiddle
{
    if (_isHiddle != isHiddle) {
        _isHiddle = isHiddle;
    }
    if (_isHiddle) {
        [self.strLabel removeFromSuperview];
        [self.addLabel removeFromSuperview];
    }else{
        [self.strLabel setHidden:NO];
        [self.addLabel setHidden:NO];
    }
}
@end
