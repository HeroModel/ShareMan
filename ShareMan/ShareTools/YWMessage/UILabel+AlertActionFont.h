//
//  UILabel+AlertActionFont.h
//  ShareMan
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (AlertActionFont)
@property (nonatomic,copy) UIFont *appearanceFont UI_APPEARANCE_SELECTOR;
+ (instancetype)labelString:(NSString *)string WithFont:(UIFont *)font WithTextColor:(UIColor *)textColor;

+ (instancetype)StringWithFont:(UIFont *)font WithTextColor:(UIColor *)textColor;
@end
