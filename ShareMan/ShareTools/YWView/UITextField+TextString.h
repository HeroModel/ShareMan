//
//  UITextField+TextString.h
//  ShareMan
//
//  Created by mac on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (TextString)
+ (instancetype)textFieldWithPlaceholder:(NSString *)placeholder
                           WithTextColor:(UIColor *)textColor
                                WithFont:(UIFont *)font
                              WithTarget:(id)target;
@end
