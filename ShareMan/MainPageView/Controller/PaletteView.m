//
//  PaletteView.m
//  ShareMan
//
//  Created by apple on 2017/8/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PaletteView.h"
@interface PaletteView ()<MyViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) UIImage * image;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * phone;
/** <#注释#> */
@property(nonatomic, assign) NSInteger countValue;
@end
@implementation PaletteView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        [self createPaletView];
    }
    return self;
}
- (void)createPaletView
{
    UIView * top = [[UIView alloc] init];
    top.userInteractionEnabled = YES;
    top.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UITapGestureRecognizer * tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didView:)];
    [top addGestureRecognizer:tap2];
    [self addSubview:top];
    [top makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.width.equalTo(375 * WIDTHFIT);
        make.height.equalTo(64 * HEIGHTFIT);
    }];
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    view.userInteractionEnabled = YES;
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10;
    [self addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(top.bottom).offset(0);
        make.left.equalTo(0);
        make.width.equalTo(375 * WIDTHFIT);
        make.height.equalTo(656 * HEIGHTFIT);
    }];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"手写签名";
    label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label.textAlignment = NSTextAlignmentCenter;
    label.font = NAM_TITLE_B;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(147.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    UIButton * down = [UIButton buttonWithType:UIButtonTypeCustom];
    [down setImage:[[UIImage imageNamed:@"image-close"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [down setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    down.titleLabel.font = NAM_TITLE_B;
    [down addTarget:self action:@selector(didDown:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:down];
    
    [down makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(20 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    
    
    UIButton * butDelete = [UIButton buttonWithType:UIButtonTypeCustom];
    [butDelete setTitle:@"清除" forState:UIControlStateNormal];
    [butDelete setTitleColor:UIColorFromRGB(GLOBAL_SIGN_COLOR) forState:UIControlStateNormal];
    [butDelete setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    butDelete.titleLabel.font = NAM_TITLE_B;
    [butDelete addTarget:self action:@selector(didDelete:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:butDelete];
    
    [butDelete makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(23 * HEIGHTFIT);
        make.right.equalTo(0);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    
    
    UIView * line = [[UIView alloc] init];
    line.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(20 * HEIGHTFIT);
        make.left.and.right.equalTo(0);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    
    self.paletteView = [[MyView alloc] initWithFrame:CGRectMake(0, 62.25 * HEIGHTFIT, SCREEN_WIDTH, 484 * HEIGHTFIT)];
    _paletteView.delegate = self;
    [view addSubview:_paletteView];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    [view addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_paletteView.bottom).offset(0);
        make.left.and.right.equalTo(0);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.text = @"完成";
    label1.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    label1.textAlignment = NSTextAlignmentCenter;
    label1.font = NAM_TITLE_B;
    label1.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didViewHold:)];
    [label1 addGestureRecognizer:tap];
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(0);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.height.equalTo(56 * HEIGHTFIT);
    }];
    
    
}
- (void)didView:(UITapGestureRecognizer *)tap
{
    if ([self.delegate respondsToSelector:@selector(deleteView)]) {
        [self.paletteView clear];
        [self.delegate deleteView];
    }
}
- (void)didViewHold:(UITapGestureRecognizer *)tap
{
    [self screenShot];
    [UIView animateWithDuration:1 animations:^{
        if ([self.delegate respondsToSelector:@selector(shotImage:)]) {
            [self.delegate shotImage:self.image];
            [self.paletteView clear];
        }
    }];
    
}
- (void)didDown:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(deleteView)]) {
        [self.paletteView clear];
        [self.delegate deleteView];
    }
}
- (void)value:(NSInteger)value
{
    self.countValue = value;
    if ([self.delegate respondsToSelector:@selector(valueArray:)]) {
        [self.delegate valueArray:value];
    }
}
- (void)didDelete:(UIButton *)sender
{

    [self.paletteView clear];
    if ([self.delegate respondsToSelector:@selector(valueArray:)]) {
        [self.delegate valueArray:_countValue];
    }
}
//截屏功能
-(void)screenShot
{
    //截屏
    UIGraphicsBeginImageContext(self.bounds.size);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    NSLog(@image:%@,image);
    //    UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);//将图片保存在相册中
    
    
    
    CGRect rect = CGRectMake(0, 124.5 * HEIGHTFIT, SCREEN_WIDTH, 484 * HEIGHTFIT);//创建矩形框
    UIImageView *contentView = [[UIImageView alloc] initWithFrame:rect];
    contentView.image=[UIImage imageWithCGImage:CGImageCreateWithImageInRect([image CGImage], rect)];
    self.image = contentView.image;
    
    
}

@end
