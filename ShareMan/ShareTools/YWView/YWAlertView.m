//
//  YWAlertView.m
//  ShareMan
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YWAlertView.h"

@interface YWAlertView ()<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UIButton * confirmButton;
/** <#注释#> */
@property(nonatomic, strong) UIView * alertView;
/** <#注释#> */
@property(nonatomic, strong) NSString * strNick;
@end
@implementation YWAlertView
- (void)dealloc
{
    [Notification removeObserver:self];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didViewDismiss:)];
        [self addGestureRecognizer:tap];
        [self createView];
        
        //监听键盘是否呼出
        [Notification addObserver:self selector:@selector(upViews:) name:UIKeyboardWillShowNotification object:nil];
        
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
    
    self.textField = [[UITextField alloc] init];
    self.textField.placeholder = @"请输入昵称";
    self.textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.textField.textAlignment = NSTextAlignmentCenter;
    self.textField.font = NAM_TITLE_B;
    self.textField.clearButtonMode = UITextFieldViewModeNever;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.returnKeyType = UIReturnKeyNext;
    self.textField.delegate = self;
    UIButton *button = [self.textField valueForKey:@"_clearButton"];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [button setImage:[[UIImage imageNamed:@"btn-clear"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self addSubview:_textField];
    
    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alertView.top).offset(@35);
        make.left.equalTo(_alertView.left).offset(@40);
        make.right.equalTo(_alertView.right).offset(-40);
        make.height.equalTo(@20);
    }];
    
    UIImageView *line = [[UIImageView alloc] init];
    line.image = [UIImage imageNamed:@"line"];
    [self addSubview:line];
    
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_alertView.top).offset(@63);
        make.left.equalTo(_alertView.left).offset(@40);
        make.right.equalTo(_alertView.right).offset(-40);
        make.height.equalTo(@1);
    }];
    
    self.confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.confirmButton.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    [self.confirmButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [self.confirmButton setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmButton setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
    self.confirmButton.titleLabel.font = NAM_TITLE;
    self.confirmButton.layer.masksToBounds = YES;
    self.confirmButton.layer.cornerRadius = 5;
    self.confirmButton.layer.borderWidth = 1;
    self.confirmButton.layer.borderColor = UIColorFromRGB(GLOBAL_PAGE_COLOR).CGColor;
    [self.confirmButton addTarget:self action:@selector(didConfirmButtonString:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_confirmButton];
    
    [self.confirmButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.bottom).offset(@22);
        make.left.equalTo(_alertView.left).offset(@80);
        make.right.equalTo(_alertView.right).offset(-80);
        make.height.equalTo(@33);
    }];
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([self.delegate respondsToSelector:@selector(upDateNickName:)]) {
        self.strNick = textField.text;
        [self.delegate upDateNickName:_strNick];
    }
}
- (void)didConfirmButtonString:(UIButton *)sender
{
    [self dismiss];
    [self tapAction];
}
- (void)didViewDismiss:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(upDateNickName:)]) {
        self.strNick = nil;
        [self.delegate upDateNickName:_strNick];
    }
    [self dismiss];
    [self tapAction];
}
- (void)show
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)dismiss
{
    [self removeFromSuperview];
}

#pragma mark - 键盘弹出时界面上移及还原
-(void)upViews:(NSNotification *) notification{
    
    //获取键盘的高度
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    int keyBoardHeight = keyboardRect.size.height;
    
    //使视图上移
    CGRect viewFrame = self.frame;
    viewFrame.origin.y = -keyBoardHeight / 3;
    self.frame = viewFrame;
    
}
-(void)tapAction{
    
    if ([self.alertView isFirstResponder]&&UIKeyboardDidShowNotification)
    {
        
        [self.alertView resignFirstResponder];
        
        //使视图还原
        CGRect viewFrame = self.frame;
        viewFrame.origin.y = 0;
        self.frame = viewFrame;
        
        
    }
}
@end
