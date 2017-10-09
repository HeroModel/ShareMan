//
//  YWCover.h
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YWCover : UIView
/**
 *  点击蒙版调用
 */
@property (nonatomic, strong) void(^clickCover)();
@end
