//
//  LicensesView.m
//  ShareMan
//
//  Created by apple on 2017/9/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LicensesView.h"
@interface LicensesView ()
/** <#注释#> */
@property(nonatomic, strong) WKWebView * webView;
/** <#注释#> */
@property(nonatomic, strong) UIView * label1;

@end
@implementation LicensesView

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
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(40 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.right.equalTo(-15 * WIDTHFIT);
        make.bottom.equalTo(-40 * HEIGHTFIT);
    }];
    
    UILabel * label = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"电子协议";
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(25 * HEIGHTFIT);
        make.centerX.equalTo(view.frame.size.width / 2);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line = [UIView lineWithView];
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(32.5 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(110 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIView * line1 = [UIView lineWithView];
    [view addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(32.5 * HEIGHTFIT);
        make.right.equalTo(-20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(110 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    self.label1 = [[UIView alloc] init];
    self.label1.backgroundColor = [UIColor whiteColor];
    [view addSubview:_label1];
    [_label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(0);
        make.left.equalTo(19 * WIDTHFIT);
        make.right.equalTo(-19 * WIDTHFIT);
        make.height.equalTo(458 * HEIGHTFIT);
    }];
    
    UIView * line2 = [UIView lineWithView];
    [view addSubview:line2];
    [line2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label1.bottom).offset(5 * HEIGHTFIT);
        make.left.equalTo(18 * WIDTHFIT);
        make.right.equalTo(-18 * WIDTHFIT);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"我知道了" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didButtonDismiss:)];
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = UIColorFromRGB(GLOBAL_COLOR).CGColor;
    [view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(18 * HEIGHTFIT);
        make.left.equalTo(100 * WIDTHFIT);
        make.right.equalTo(-100 * WIDTHFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
- (void)didButtonDismiss:(UIButton *)sender
{
    [self removeFromSuperview];
}
- (void)showView
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)setOrderId:(NSString *)orderId
{
    if (_orderId != orderId) {
        _orderId = orderId;
    }
    NSString * phone = PHONE_TESTING;
    NSString * token  = TOKEN_TESTING;
    
    UIWebView *webView = [[UIWebView alloc] init];
    webView.backgroundColor = [UIColor whiteColor];
    [_label1 addSubview:webView];
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@", phone, token, orderId];
    NSMutableURLRequest * requestShare = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:PAYMENT]];
    [requestShare setHTTPMethod: @"POST"];
    [requestShare setHTTPBody: [string dataUsingEncoding: NSUTF8StringEncoding]];
    [webView loadRequest:requestShare];
    [webView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
@end
