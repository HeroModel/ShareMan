//
//  YWAmendPhont.m
//  ShareMan
//
//  Created by apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YWAmendPhont.h"

@interface YWAmendPhont ()<UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * phonetextField;
/** <#注释#> */
@property(nonatomic, strong) UILabel * stringLabel;
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;
/** <#注释#> */
@property(nonatomic, strong) UIButton * nextButton;
@end
@implementation YWAmendPhont
- (void)setStrPhone:(NSString *)strPhone
{
    if (_strPhone != strPhone) {
        _strPhone = strPhone;
    }
    
}
- (instancetype)initWithFrame:(CGRect)frame WithString:(NSString *)string
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createTextPhone];
        [self.phonetextField becomeFirstResponder];
        self.phonetextField.placeholder = string;
        [self createView];
    }
    return self;
}
- (void)createTextPhone
{
    self.phonetextField = [[UITextField alloc] init];
    self.phonetextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.phonetextField.textAlignment = NSTextAlignmentLeft;
    self.phonetextField.font = NAM_TITLE_B;
    self.phonetextField.keyboardType = UIKeyboardTypeNumberPad;
    [self.phonetextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    self.phonetextField.delegate = self;
    [self addSubview:self.phonetextField];
    
    [_phonetextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(40 * HEIGHTFIT);
        make.left.equalTo(62 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(125 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    self.stringLabel = [[UILabel alloc] init];
    self.stringLabel.textColor = UIColorFromRGB(GLOBAL_NAV_COLOR);
    self.stringLabel.font = NAM_TITLE_B;
    self.stringLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_stringLabel];
    
    [_stringLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phonetextField.top);
        make.left.equalTo(self.phonetextField.right);
        make.size.equalTo(CGSizeMake(125 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    
    
    UIView * viewLine = [[UIView alloc] init];
    viewLine.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [self addSubview:viewLine];
    
    [viewLine makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phonetextField.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(_phonetextField.left);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 1 * HEIGHTFIT));
    }];

}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == self.phonetextField) {
        
        if ([ShareTool isMobileNum:textField.text] == YES) {
            self.button.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
            if ([self.delegaet respondsToSelector:@selector(phone:)]) {
                [self.delegaet phone:textField.text];
            }
            self.stringLabel.text = nil;
        }
        else{
            self.button.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
            self.stringLabel.text = @"手机号码错误 !";
        }
    }
}
//只允许输入数字，且只有11位数
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if (textField.text.length == 11) {
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
    if (length == 11) {
//        self.nextButton.enabled = YES;
//        self.nextButton.backgroundColor = UIColorFromRGB(GR_COLOR);
        self.button.userInteractionEnabled = YES;
        self.button.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
        [textField resignFirstResponder];
    }else
    {
//        self.nextButton.enabled = NO;
//        self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
        self.button.userInteractionEnabled = NO;
        self.button.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    }
}
- (void)createView
{
    MQVerCodeInputView * verView = [[MQVerCodeInputView alloc] initWithFrame:CGRectMake(62 * WIDTHFIT, 112 * HEIGHTFIT, 150 * WIDTHFIT, 33 * HEIGHTFIT)];
    verView.keyBoardType = UIKeyboardTypeNumberPad;
    [verView mq_verCodeViewWithMaxLenght];
    verView.block = ^(NSString *text){
        if (text && [text length] == 4) {
            if ([self.delegaet respondsToSelector:@selector(code:)]) {
                [self.delegaet code:text];
            }
           self.nextButton.backgroundColor = UIColorFromRGB(GR_COLOR);
            self.nextButton.userInteractionEnabled = YES;
        }else{
           self.nextButton.backgroundColor = UIColorFromRGB(GLOBAL_CITY_COLOR);
            self.nextButton.userInteractionEnabled = NO;
        }
    };
    [self addSubview:verView];
    
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(232 * WIDTHFIT, 112 * HEIGHTFIT, 80 * WIDTHFIT, 33 * HEIGHTFIT);
    self.button.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    [self.button setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.button setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
    self.button.titleLabel.font = NAM_TITLE;
    self.button.userInteractionEnabled = NO;
    self.button.layer.masksToBounds = YES;
    self.button.layer.cornerRadius = 5.0f;
    self.button.layer.borderWidth = 0.5;
    self.button.layer.borderColor = UIColorFromRGB(GLOBAL_COLOR).CGColor;
    [self.button addTarget:self action:@selector(didButtonAuthCode:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_button];
    
    UIView * viewLines = [[UIView alloc] initWithFrame:CGRectMake(62 * WIDTHFIT, 160 * HEIGHTFIT, 250 * WIDTHFIT, 1 * HEIGHTFIT)];
    viewLines.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [self addSubview:viewLines];
    
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
    [self addSubview:_nextButton];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self endEditing:YES];
}
//验证码
- (void)didButtonAuthCode:(UIButton *)sender
{
    [self openCountdown];
    if ([self.delegaet respondsToSelector:@selector(didCodeButton)]) {
        [self.delegaet didCodeButton];
    }
}
- (void)didNextButton:(UIButton *)sender
{
    if ([self.delegaet respondsToSelector:@selector(didNextButtonController)]) {
        
        [self.delegaet didNextButtonController];
    }
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



@end
