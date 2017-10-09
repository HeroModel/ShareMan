//
//  ShareWeChatView.m
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareWeChatView.h"

@implementation ShareWeChatView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(disView:)];
        [self addGestureRecognizer:tap];
        [self createShareView];
    }
    return self;
}
- (void)createShareView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view.userInteractionEnabled = YES;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.size.equalTo(CGSizeMake(335 * WIDTHFIT, 142 * HEIGHTFIT));
    }];
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB( GLOBAL_NUMBER_COLOR);
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(27.5 * HEIGHTFIT);
        make.left.equalTo(0);
        make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 1 * HEIGHTFIT));
    }];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"分享到";
    label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = NAM_TITLE_B;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(line.right).offset(13 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB( GLOBAL_NUMBER_COLOR);
    [view addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(27.5 * HEIGHTFIT);
        make.left.equalTo(label.right).offset(13 * WIDTHFIT);
        make.right.equalTo(0);
        make.height.equalTo(1 * HEIGHTFIT);
    }];
    
    UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"Wechat" target:self action:@selector(didWeChatButton:)];
    [view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(36 * HEIGHTFIT);
        make.left.equalTo(58.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(50 * WIDTHFIT, 50 * HEIGHTFIT));
    }];
    
    UIView * line2 = [[UIView alloc] init];
    line2.backgroundColor = UIColorFromRGB( GLOBAL_NUMBER_COLOR);
    [view addSubview:line2];
    [line2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(28 * HEIGHTFIT);
        make.left.equalTo(button.right).offset(62 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(1 * WIDTHFIT, 50 * HEIGHTFIT));
    }];
    
    UIButton * button1 = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"pengyouquan" target:self action:@selector(didWeChatFriendButton:)];
    [view addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(36 * HEIGHTFIT);
        make.right.equalTo(-58.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(50 * WIDTHFIT, 50 * HEIGHTFIT));
    }];
}
- (void)disView:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(dismissView)]) {
        [self.delegate dismissView];
    }
}
- (void)didWeChatButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(weChatButton)]) {
        [self.delegate weChatButton];
    }
}
- (void)didWeChatFriendButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(weChatFriendButton)]) {
        [self.delegate weChatFriendButton];
    }
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
