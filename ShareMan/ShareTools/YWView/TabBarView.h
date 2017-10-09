//
//  TabBarView.h
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@protocol TabBarViewDelegate <NSObject>

- (void)didRecyclingButton;
- (void)didSharedButton;
- (void)didMaintainButton;

@end
@interface TabBarView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<TabBarViewDelegate>delegate;
- (instancetype)initWithTabBarViewFrame:(CGRect)frame;



@end
