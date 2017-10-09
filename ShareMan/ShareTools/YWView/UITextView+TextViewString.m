//
//  UITextView+TextViewString.m
//  ShareMan
//
//  Created by mac on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UITextView+TextViewString.h"

@implementation UITextView (TextViewString)
+ (instancetype)textViewWithTextColor:(UIColor *)textColor
                                WithFont:(UIFont *)font
                              WithTarget:(id)target
{
    UITextView * textView = [[UITextView alloc] init];
    textView.textColor = textColor;
    textView.font = font;
    textView.showsHorizontalScrollIndicator = NO;
    textView.textAlignment = NSTextAlignmentLeft;
    textView.keyboardType = UIKeyboardTypeDefault;
    textView.delegate = target;
    return textView;
}
@end
