//
//  HeaderView.m
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "HeaderView.h"
#import "IDPersonallModel.h"

@implementation HeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(17.5, 8, SCREEN_WIDTH - 35, 150 * HEIGHTFIT) delegate:self placeholderImage:PLACEHOLDER];
        _cycleScrollView.backgroundColor = [UIColor whiteColor];
        _cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
        _cycleScrollView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
        _cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;//pageController样式
        _cycleScrollView.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方式
        _cycleScrollView.delegate = self;
        [self addSubview:_cycleScrollView];

        UIView * view = [[UIView alloc] init];
        view.userInteractionEnabled = YES;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didCenterImage)];
        [view addGestureRecognizer:tap];
        [self addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(172 * HEIGHTFIT);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSizeMake(71 * WIDTHFIT, 79 * HEIGHTFIT));
        }];
        UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"main-icon-gxcl" target:self action:@selector(didCenterImage)];
        [view addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(view);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * HEIGHTFIT));
        }];
        UILabel * label = [[UILabel alloc] init];
        label.userInteractionEnabled = YES;
        label.text = @"个性潮流";
        label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        label.font = NAM_TITLE_B;
        label.textAlignment = NSTextAlignmentCenter;
        [view addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
        
        UIView * view1 = [[UIView alloc] init];
        UITapGestureRecognizer * tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didLeftImage)];
        [view1 addGestureRecognizer:tap1];
        [self addSubview:view1];
        [view1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(172 * HEIGHTFIT);
            make.left.equalTo(40 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(71 * WIDTHFIT, 79 * HEIGHTFIT));
        }];
        UIButton * button1 = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"main-icon-jjsh" target:self action:@selector(didLeftImage)];
        [view1 addSubview:button1];
        [button1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(view1);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * HEIGHTFIT));
        }];
        UILabel * label1 = [[UILabel alloc] init];
        label1.userInteractionEnabled = YES;
        label1.text = @"经济实惠";
        label1.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        label1.font = NAM_TITLE_B;
        label1.textAlignment = NSTextAlignmentCenter;
        [view1 addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button1.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
        
        UIView * view2 = [[UIView alloc] init];
        UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didRightImage)];
        [view2 addGestureRecognizer:tap2];
        [self addSubview:view2];
        [view2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(172 * HEIGHTFIT);
            make.right.equalTo(-40 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(71 * WIDTHFIT, 79 * HEIGHTFIT));
        }];
        UIButton * button2 = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"main-icon-thhd" target:self action:@selector(didRightImage)];
        [view2 addSubview:button2];
        [button2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(0);
            make.centerX.equalTo(view2);
            make.size.equalTo(CGSizeMake(44 * WIDTHFIT, 44 * HEIGHTFIT));
        }];
        UILabel * label2 = [[UILabel alloc] init];
        label2.userInteractionEnabled = YES;
        label2.text = @"特惠活动";
        label2.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        label2.font = NAM_TITLE_B;
        label2.textAlignment = NSTextAlignmentCenter;
        [view2 addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(button2.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(16 * HEIGHTFIT);
        }];
        
        
        UIView * view3 = [[UIView alloc] init];
        view3.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        [self addSubview:view3];
        [view3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view.bottom).offset(20 * HEIGHTFIT);
            make.left.and.right.equalTo(0);
            make.height.equalTo(14 * HEIGHTFIT);
        }];
        
        UIImageView *bacIma = [[UIImageView alloc] init];
        bacIma.image = [UIImage imageNamed:@"main-bg-hot"];
        bacIma.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:bacIma];
        [bacIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view3.bottom).offset(17.5 * HEIGHTFIT);
            make.centerX.equalTo(self);
            make.size.equalTo(CGSizeMake(33 * WIDTHFIT, 28 * HEIGHTFIT));
        }];
        
        UILabel * label3 = [[UILabel alloc] init];
        label3.text = @"热门推荐";
        label3.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        label3.textAlignment = NSTextAlignmentCenter;
        label3.font = NAM_TITLE;
        [bacIma addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(bacIma);
            make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIImageView *line = [[UIImageView alloc] init];
        line.image = [UIImage imageNamed:@"image-line2"];
        [self addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view3.bottom).offset(25 * HEIGHTFIT);
            make.left.equalTo(110 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(6.5 * WIDTHFIT, 13.5 * HEIGHTFIT));
        }];
        
        UIImageView *line1 = [[UIImageView alloc] init];
        line1.image = [UIImage imageNamed:@"image-line2"];
        [self addSubview:line1];
        [line1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view3.bottom).offset(25 * HEIGHTFIT);
            make.right.equalTo(-110 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(6.5 * WIDTHFIT, 13.5 * HEIGHTFIT));
        }];

    }
    return self;
}
- (void)didLeftImage
{
    if ([self.delegate respondsToSelector:@selector(didLeftImage)]) {
        
        [self.delegate didLeftImage];
    }
}
- (void)didCenterImage
{
    if ([self.delegate respondsToSelector:@selector(didCenterImage)]) {
        
        [self.delegate didCenterImage];
    }
}
- (void)didRightImage
{
    if ([self.delegate respondsToSelector:@selector(didRightImage)]) {
        
        [self.delegate didRightImage];
    }
}
- (void)setArray:(NSMutableArray *)array
{
    if (_array != array) {
        _array = array;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _cycleScrollView.imageURLStringsGroup = _array;
    });
}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
//    NSLog(@"---点击了第%ld张图片", (long)index);
    if ([self.delegate respondsToSelector:@selector(didImageIndex:)]) {
        [self.delegate didImageIndex:index];
    }
}
@end
