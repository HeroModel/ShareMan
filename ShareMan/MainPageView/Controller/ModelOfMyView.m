//
//  ModelOfMyView.m
//  王煌分享
//
//  Created by LL.F on 16/7/11.
//  Copyright © 2016年 LL.F. All rights reserved.
//

#import "ModelOfMyView.h"

@implementation ModelOfMyView
+ (id)viewModelWithColor:(UIColor *)color path:(UIBezierPath *)path width:(CGFloat)width
{
    ModelOfMyView *modelOfMyView = [[ModelOfMyView alloc] init];
    modelOfMyView.color = color;
    modelOfMyView.path = path;
    modelOfMyView.width = width;
    return modelOfMyView;
}
@end
