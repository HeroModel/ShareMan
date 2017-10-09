//
//  UIView+Line.m
//  ShareMan
//
//  Created by apple on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)
+ (instancetype)lineWithView
{
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    return view;
}
@end
