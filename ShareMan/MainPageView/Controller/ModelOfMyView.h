//
//  ModelOfMyView.h
//  王煌分享
//
//  Created by LL.F on 16/7/11.
//  Copyright © 2016年 LL.F. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ModelOfMyView : NSObject

+ (id)viewModelWithColor:(UIColor *)color
                    path:(UIBezierPath *)path
                   width:(CGFloat)width;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, retain) UIBezierPath *path;
@property (nonatomic, assign) CGFloat width;

@end
