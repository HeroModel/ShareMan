//
//  MyView.h
//  王煌分享
//
//  Created by LL.F on 16/7/11.
//  Copyright © 2016年 LL.F. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MyViewDelegate <NSObject>

- (void)did;
- (void)value:(NSInteger)value;
@end
@interface MyView : UIView

@property (nonatomic, retain) UIColor *linColor;
@property (nonatomic, assign) CGFloat lineWidth;
/** <#注释#> */
@property(nonatomic, assign) id<MyViewDelegate> delegate;
- (void)clear;
@end
