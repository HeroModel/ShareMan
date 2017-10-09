//
//  YWCover.m
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "YWCover.h"

@implementation YWCover

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (_clickCover) {
        _clickCover();
    }
}

@end
