//
//  YWStringAlertView.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YWStringAlertView.h"

@interface YWStringAlertView ()
/** <#注释#> */
@property(nonatomic, strong) UIButton * confirmButton;
/** <#注释#> */
@property(nonatomic, strong) UIView * alertView;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
@end
@implementation YWStringAlertView

- (instancetype)initWithFrame:(CGRect)frame WtihString:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        [self createView];
        self.label.text = string;
    }
    return self;
}
- (void)createView
{
    self.alertView = [[UIView alloc] init];
    _alertView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    _alertView.layer.masksToBounds = YES;
    _alertView.layer.cornerRadius = 8;
    [self addSubview:_alertView];
    
    [_alertView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.left.equalTo(self.left).offset(@35);
        make.right.equalTo(self.right).offset(-35);
        make.height.equalTo(@142);
    }];
    
    self.label = [[UILabel alloc] init];
    self.label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.label.font = NAM_TITLE_B;
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.alertView addSubview:_label];
    
    [self.label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alertView.top).offset(@35);
        make.left.equalTo(_alertView.left).offset(@40);
        make.right.equalTo(_alertView.right).offset(-40);
        make.height.equalTo(@20);
    }];
    
    self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.confirmButton.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    [self.confirmButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [self.confirmButton setTitle:@"完成" forState:UIControlStateNormal];
    [self.confirmButton setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
    self.confirmButton.titleLabel.font = NAM_TITLE;
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = 5;
    self.confirmButton.layer.borderWidth = 1;
    self.confirmButton.layer.borderColor = UIColorFromRGB(GLOBAL_PAGE_COLOR).CGColor;
    [self.confirmButton addTarget:self action:@selector(didConfirmButtonString:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmButton];
    
    [self.confirmButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.label.bottom).offset(@35);
        make.left.equalTo(_alertView.left).offset(@80);
        make.right.equalTo(_alertView.right).offset(-80);
        make.height.equalTo(@33);
    }];
    
}
- (void)didConfirmButtonString:(UIButton *)sender
{
//    NSLog(@"按钮");
    [self dismiss];
    
}
- (void)show
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)dismiss
{
    [self removeFromSuperview];
}
@end
