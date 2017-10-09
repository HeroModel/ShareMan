//
//  UILabel+AlertActionFont.m
//  ShareMan
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UILabel+AlertActionFont.h"

@implementation UILabel (AlertActionFont)
- (void)setAppearanceFont:(UIFont *)appearanceFont
{
    if(appearanceFont)
    {
        [self setFont:appearanceFont];
    }
}

- (UIFont *)appearanceFont
{
    return self.font;
}
+ (instancetype)labelString:(NSString *)string WithFont:(UIFont *)font WithTextColor:(UIColor *)textColor
{
    UILabel * label = [[UILabel alloc] init];
    label.text = string;
    label.textColor = textColor;
    label.font = font;
    label.textAlignment = NSTextAlignmentLeft;
    return label;
}
+ (instancetype)StringWithFont:(UIFont *)font WithTextColor:(UIColor *)textColor
{
    UILabel * label = [[UILabel alloc] init];
    label.textColor = textColor;
    label.font = font;
    return label;
}
@end
