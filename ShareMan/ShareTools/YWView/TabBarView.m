//
//  TabBarView.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TabBarView.h"

@interface TabBarView ()

@end
@implementation TabBarView
- (instancetype)initWithTabBarViewFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
//        [self createBackGorundView];
//        UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH / 2, 49)];
//        backView.userInteractionEnabled = YES;
//        UITapGestureRecognizer * leftTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didLeftButton:)];
//        [backView addGestureRecognizer:leftTap];
//        backView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
//        [self addSubview:backView];
        
//        UIImageView * leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(50, 6, 22, 22)];
//        leftImage.image = [UIImage imageNamed:@"icon-nor-huishou"];
//        leftImage.contentMode = UIViewContentModeScaleAspectFill;
//        [backView addSubview:leftImage];
//
//        UILabel * leftlabel = [[UILabel alloc] initWithFrame:CGRectMake(leftImage.frame.origin.x - 4, 6 + leftImage.frame.size.height + 2, 30, 15)];
//        leftlabel.text = @"回收";
//        leftlabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
//        leftlabel.textAlignment = NSTextAlignmentCenter;
//        leftlabel.font = TIMER_TITLE_FONT;
//        [backView addSubview:leftlabel];
//
//        UIView * rightView = [[UIView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH / 2, 0, SCREEN_WIDTH / 2, 49)];
//        rightView.userInteractionEnabled = YES;
//        UITapGestureRecognizer * rightTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didRightButton:)];
//        [rightView addGestureRecognizer:rightTap];
//        rightView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
//        [self addSubview:rightView];
        
//        UIImageView * rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(rightView.frame.size.width - 72, 6, 22, 22)];
//        rightImage.image = [UIImage imageNamed:@"icon-nor-weixiu"];
//        rightImage.contentMode = UIViewContentModeScaleAspectFill;
//        [rightView addSubview:rightImage];
//
//        UILabel * rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(rightImage.frame.origin.x - 4, 6 + rightImage.frame.size.height + 2, 30, 15)];
//        rightLabel.text = @"维修";
//        rightLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
//        rightLabel.textAlignment = NSTextAlignmentCenter;
//        rightLabel.font = TIMER_TITLE_FONT;
//        [rightView addSubview:rightLabel];
        
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(SCREEN_WIDTH / 2 - 30, -11, 60, 60);
        [button setImage:[[UIImage imageNamed:@"icon-gongxiang"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        button.adjustsImageWhenDisabled = YES;
        [button addTarget:self action:@selector(didSharedButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];

    }
    return self;
}
- (void)createBackGorundView
{
    
    
}
- (void)show
{
//    [[[[UIApplication sharedApplication] delegate] window] addSubview:self];
}
- (void)didLeftButton:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(didRecyclingButton)]) {
        [self.delegate didRecyclingButton];
    }
}
- (void)didRightButton:(UITapGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(didMaintainButton)]) {
        [self.delegate didMaintainButton];
    }
}
- (void)didSharedButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didSharedButton)]) {
        [self.delegate didSharedButton];
    }
}
@end
