//
//  FeedbackViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()<UITextViewDelegate, UITextFieldDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextView * textView;
/** <#注释#> */
@property(nonatomic, strong) UILabel * string;
/** <#注释#> */
@property(nonatomic, strong) UIView * backView;
/** <#注释#> */
@property(nonatomic, copy) NSString * textcontext;
/** <#注释#> */
@property(nonatomic, copy) NSString * textLabel;
@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"打小报告";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"return_p"] highImage:[UIImage imageNamed:@"return_p"] target:(GlobalNavigationController *)self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    //监听键盘是否呼出
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(upViews:) name:UIKeyboardWillShowNotification object:nil];
    [self createView];
}
- (void)createView
{
    self.backView = [[UIView alloc] init];
    self.backView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    [self.view addSubview:_backView];
    [_backView makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    UIView *bigView = [[UIView alloc] init];
    bigView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = 8;
    [_backView addSubview:bigView];
    [bigView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(335 * WIDTHFIT, 400 * HEIGHTFIT));
    }];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"意见反馈";
    label.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = NAME_TIT_FONT;
    [bigView addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(29.5 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(47.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIView * line2 = [[UIView alloc] init];
    line2.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line2];
    [line2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(39.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIView * line3 = [[UIView alloc] init];
    line3.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line3];
    [line3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(42.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIView * line4 = [[UIView alloc] init];
    line4.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line4];
    [line4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line3.bottom).offset(42.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIView * line5 = [[UIView alloc] init];
    line5.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line5];
    [line5 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4.bottom).offset(42.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    self.textView = [[UITextView alloc] init];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.textView.textAlignment = NSTextAlignmentLeft;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.returnKeyType = UIReturnKeyDefault;
    self.textView.dataDetectorTypes = UIDataDetectorTypeLink;
    self.textView.showsHorizontalScrollIndicator = NO;
    self.textView.showsVerticalScrollIndicator = NO;
    self.textView.scrollEnabled = NO;
    self.textView.editable = YES;
    self.textView.font = NAM_TITLE;
    self.textView.delegate = self;
    [bigView addSubview:_textView];
    [_textView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 227.5 * HEIGHTFIT));
    }];
    
    self.string = [[UILabel alloc] init];
    _string.text = @"将您的心声反馈给我们...(限200字符)";
    _string.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    _string.font = NAM_TITLE;
    [_textView addSubview:_string];
    [_string makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10 * HEIGHTFIT);
        make.left.equalTo(0);
        make.size.equalTo(CGSizeMake(240 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.text = @"联系方式";
    label1.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    label1.textAlignment = NSTextAlignmentLeft;
    label1.font = NAME_TIT_FONT;
    [bigView addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line5.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UITextField * textField = [[UITextField alloc] init];
    textField.placeholder = @"QQ/微信/邮箱";
    textField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    textField.textAlignment = NSTextAlignmentLeft;
    textField.font = NAM_TITLE;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.delegate = self;
    [bigView addSubview:textField];
    [textField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(label1.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 14 * HEIGHTFIT));
    }];

    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [bigView addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(textField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(label1.left);
        make.size.equalTo(CGSizeMake(305 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton itemButtonWithType:UIButtonTypeCustom WithString:@"提交" target:self action:@selector(didBut)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bigView.bottom).offset(40 * HEIGHTFIT);
        make.centerX.equalTo(self.view);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
    
}
#pragma mark --- UITextView 代理方法
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    [self.string removeFromSuperview];
}
- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.textcontext = textView.text;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    self.textLabel = textField.text;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self keyBoardShow];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches
           withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self keyBoardHide];
}
-(void)textViewDidChange:(UITextView *)textView
{
    // 判断是否有候选字符，如果不为nil，代表有候选字符
    if (textView.markedTextRange == nil) {
        
        //    textview 改变字体的行间距
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        
        paragraphStyle.lineSpacing = 23 * HEIGHTFIT;// 字体的行间距
        
        NSDictionary *attributes = @{
                                     
                                     NSFontAttributeName:NAM_TITLE,
                                     
                                     NSParagraphStyleAttributeName:paragraphStyle
                                     
                                     };
        
        textView.attributedText = [[NSAttributedString alloc] initWithString:textView.text attributes:attributes];
    }
    
}
- (BOOL)textView:(UITextView *)textView
shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text
{
//    NSString  * nsTextContent = textView.text;
//    long existTextNum = [nsTextContent length];
//    NSString * string = [NSString stringWithFormat:@"还可以输入%ld字",200 - existTextNum];
    
    if (range.location >= 100)
    {
        [MBProgressShow ShowMBProgress:@"不能超过100字" WithTimer:2 WithView:self.view];
        return  NO;
        
    }
    else
    {
        return YES;
    }
}
#pragma mark - 键盘弹出时界面上移及还原
//-(void)upViews:(NSNotification *) notification{
//
//    //获取键盘的高度
//    NSDictionary *userInfo = [notification userInfo];
//    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
//    CGRect keyboardRect = [aValue CGRectValue];
//    int keyBoardHeight = keyboardRect.size.height;
//
//    //使视图上移
//    CGRect viewFrame = self.backView.frame;
//    viewFrame.origin.y = (-keyBoardHeight / 6 - 20) * HEIGHTFIT;
//    self.backView.frame = viewFrame;
//
//}
//-(void)tapAction{
//
//    if ([self.backView isFirstResponder]&&UIKeyboardDidShowNotification)
//    {
//
//        [self.backView resignFirstResponder];
//
//        //使视图还原
//        CGRect viewFrame = self.backView.frame;
//        viewFrame.origin.y = 0;
//        self.backView.bounds = viewFrame;
//
//
//    }
//}
- (void)keyBoardShow
{
    int offset = self.view.frame.origin.y - 216.0;//iPhone键盘高
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.transform = CGAffineTransformMakeTranslation(0, offset);
    }];
}
- (void)keyBoardHide
{
    [UIView animateWithDuration:0.5 animations:^{
        self.backView.transform = CGAffineTransformIdentity;
    }];
}
- (void)didBut
{
    if (self.textcontext && [self.textcontext length] != 0 && self.textLabel && [self.textLabel length] != 0) {
        [self upDataphoneNumber:PHONE_TESTING WithToken:TOKEN_TESTING WithAdvice:self.textcontext WithcontactWay:self.textLabel];
    }else{
        [MBProgressShow ShowMBProgress:@"请填写完整" WithTimer:1 WithView:self.view];
    }
    
}
- (void)upDataphoneNumber:(NSString *)phoneNumber
                WithToken:(NSString *)token
               WithAdvice:(NSString *)advice
           WithcontactWay:(NSString *)contactWay
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&advice=%@&contactWay=%@", phoneNumber, token, advice, contactWay];
    [NetTools POSTNetWithUrl:REPORT body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"提交成功" WithTimer:1 WithView:self.view];
        }else{
            return;
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
