//
//  UITextView+TextViewString.h
//  ShareMan
//
//  Created by mac on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (TextViewString)
+ (instancetype)textViewWithTextColor:(UIColor *)textColor
                                WithFont:(UIFont *)font
                              WithTarget:(id)target;
@end
