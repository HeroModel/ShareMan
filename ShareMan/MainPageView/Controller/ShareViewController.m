//
//  ShareViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareViewController.h"
#import "PaletteView.h"
#import "SignPayViewController.h"

@interface ShareViewController ()<PaletteViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) UIImage * image;
///** <#注释#> */
//@property(nonatomic, strong) UIImageView * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * token;
/** <#注释#> */
@property(nonatomic, strong) WKWebView * webView;
/** <#注释#> */
@property(nonatomic, strong) UIView * baView;
@end

@implementation ShareViewController
{
    NSInteger isSelete;
    PaletteView *palView;
    NSInteger countValue;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"签约支付";
    self.phone = PHONE_TESTING;
    self.token = TOKEN_TESTING;
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBack:)];
    self.navigationItem.leftBarButtonItem = left;
    
    
//    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"nav-icon-Return"] highImage:[UIImage imageNamed:@"nav-icon-Return"] target:(GlobalNavigationController *)self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    [self createView];
    [self webViewUpDate:_orderId];
}

- (void)createView
{
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(15 * WIDTHFIT, 15 * HEIGHTFIT, 345 * WIDTHFIT, 560 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10;
    [self.view addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(345 * WIDTHFIT, 560 * HEIGHTFIT));
    }];
    
    self.baView = [[UIView alloc] init];
    [view addSubview:_baView];
    [_baView makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(0);
        make.height.equalTo(388 * HEIGHTFIT);
    }];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_baView.bottom).offset(5 * HEIGHTFIT);
        make.left.equalTo(21 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(303 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"btn-choose-blue" target:self action:@selector(didButtongray:)];
    isSelete = 1;
    [view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(21 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(24 * WIDTHFIT, 24 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.text = @"我已阅读并接受协议";
    label1.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    label1.textAlignment = NSTextAlignmentLeft;
    label1.font = NAM_TITLE;
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(button.right).offset(10 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UIButton * btu = [UIButton itemButtonWithType:UIButtonTypeCustom WithString:@"签约并支付" target:self action:@selector(didButtonVC:)];
    [view addSubview:btu];
    [btu makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(21 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(303 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
    
    palView = [[PaletteView alloc] initWithFrame:CGRectMake(0, SCREEN_WIDTH, SCREEN_WIDTH, SCREEN_HEIGHT)];
    palView.delegate = self;
}
- (void)webViewUpDate:(NSString *)orderId
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
//    self.webView = [[WKWebView alloc] init];
//    [self.webView loadRequest:[NSMutableURLRequest requestWithURL:[NSURL URLWithString:PAYMENT]]];
//    self.webView.scrollView.showsVerticalScrollIndicator = NO;
//    self.webView.scrollView.showsHorizontalScrollIndicator = NO;
//    [self.baView addSubview:_webView];
//    [_webView makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
//    }];
    
    UIWebView *webView = [[UIWebView alloc] init];
    [self.baView addSubview:webView];
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@", phone, token, orderId];
    NSMutableURLRequest * requestShare = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:PAYMENT]];
    [requestShare setHTTPMethod: @"POST"];
    [requestShare setHTTPBody: [string dataUsingEncoding: NSUTF8StringEncoding]];
    [webView loadRequest:requestShare];
    [webView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    

}
- (void)didButtongray:(UIButton *)but
{
    isSelete = 0;
    but.selected = !but.selected;
    if (but.selected) {
        [but setImage:[[UIImage imageNamed:@"btn-choose-gray"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:0];
        
        isSelete = -1;
    }else{
        [but setImage:[[UIImage imageNamed:@"btn-choose-blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:0];
        isSelete = 1;
    }
    
}
- (void)didButtonVC:(UIButton *)sender
{
    if (isSelete == 1) {
        [self PaletteView];
    }else{
        [MBProgressShow ShowMBProgress:@"请勾选" WithTimer:1 WithView:self.view];
    }
}
- (void)PaletteView
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:palView];
    [UIView animateWithDuration:0.35 animations:^{
        palView.center = self.view.center;
        palView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}
- (void)deleteView
{
    [self didButton];
}
#pragma mark -- 视图消失
- (void)didButton
{
    [UIView animateWithDuration: 0.35 animations: ^{
        palView.frame = CGRectMake(0, self.view.frame.size.height + 64, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    } completion: nil];
}
#pragma mark --- 判断数组有没有值（签名）,跳转付款界面
- (void)valueArray:(NSInteger)array
{
    countValue = array;
}
- (void)shotImage:(UIImage *)image
{
    if (countValue == -1 || countValue == 0) {
        [MBProgressShow ShowMBProgress:@"请签名" WithTimer:1 WithView:[[[UIApplication sharedApplication] delegate] window]];
    }
    else{
        [self editHeader:image WithorderId:_orderId];
        [self didButton];
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(pushVC) userInfo:nil repeats:NO];
       
    }
    
}
- (void)didLeftBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editHeader:(UIImage *)image WithorderId:(NSString *)orderId
{
    NSString * string = PHONE_TESTING;
    NSString * str = TOKEN_TESTING;
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", string],
                           @"token":[NSString stringWithFormat:@"%@", str],
                           @"orderId":[NSString stringWithFormat:@"%@", orderId],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.0f);
    }else
    {
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:AUTOGRAPH WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
//        NSLog(@"上传签名OK===%@", result);
    } fail:^(NSError *error) {
//        NSLog(@"上传签名NO===%@", error);
    } progress:^(NSProgress *uploadProgress) {
        
    }];
}
- (void)pushVC
{
    SignPayViewController * sigVC = [[SignPayViewController alloc] init];
    sigVC.orderId = _orderId;
    [self.navigationController pushViewController:sigVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
