//
//  UIButton+ButtonTool.m
//  ShareMan
//
//  Created by apple on 2017/8/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIButton+ButtonTool.h"

@implementation UIButton (ButtonTool)
+ (instancetype)itemButtonWithType:(UIButtonType)type
                        WithString:(NSString *)string
                            target:(id)target
                            action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = UIColorFromRGB(GR_COLOR);
    [button setTitle:string forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.titleLabel.font = NAM_TITLE_FONT;
//    button.adjustsImageWhenDisabled = NO;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 8;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (instancetype)ImageButtonWithType:(UIButtonType)type
                         WithString:(NSString *)string
                             target:(id)target
                             action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = [UIColor clearColor];
    [button setImage:[[UIImage imageNamed:string] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.adjustsImageWhenDisabled = NO;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (instancetype)StringButtonWithType:(UIButtonType)type
                          WithString:(NSString *)string
                              target:(id)target
                              action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:UIColorFromRGB(GLOBAL_PAGE_COLOR) forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.titleLabel.font = NAM_TITLE;
    button.adjustsImageWhenDisabled = NO;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = UIColorFromRGB(GLOBAL_SIGN_COLOR).CGColor;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
+ (instancetype)ButtonWithType:(UIButtonType)type
                    WithString:(NSString *)string
           WithBackgroundColor:(UIColor *)backgroundColor
                 WithTextColor:(UIColor *)textColor
                      WithFont:(UIFont *)font
                        target:(id)target
                        action:(SEL)action
{
    UIButton * button = [UIButton buttonWithType:type];
    button.backgroundColor = backgroundColor;
    [button setTitle:string forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.titleLabel.font = font;
    button.adjustsImageWhenDisabled = NO;
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}
@end
