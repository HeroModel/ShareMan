//
//  UITextField+TextString.m
//  ShareMan
//
//  Created by mac on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UITextField+TextString.h"

@implementation UITextField (TextString)
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                           WithTextColor:(UIColor *)textColor
                                WithFont:(UIFont *)font
                              WithTarget:(id)target
{
    UITextField * textField = [[UITextField alloc] init];
    textField.placeholder = placeholder;
    textField.textColor = textColor;
    textField.font = font;
    textField.textAlignment = NSTextAlignmentLeft;
    textField.keyboardType = UIKeyboardTypeDefault;
    textField.delegate = target;
    return textField;
}
@end
