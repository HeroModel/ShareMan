//
//  UINavigationController+GroundNav.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "UINavigationController+GroundNav.h"

@implementation UINavigationController (GroundNav)
- (void)setImage:(UIImage *)image
{
    if (image) {
        image = [UIImage imageNamed:@"NavigationBg"];
        [self.navigationBar setShadowImage:image];
    }
}
- (UIImage *)image
{
    return self.navigationBar.shadowImage;
}
@end
