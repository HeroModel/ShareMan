//
//  ServeTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ServeTableViewCell.h"

@interface ServeTableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * ima;
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;
/** <#注释#> */
@property(nonatomic, strong) UIButton * but;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * bigIma;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * image;
@end
@implementation ServeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.ima = [[UIImageView alloc] init];
        self.ima.image = [UIImage imageNamed:@"biankuang"];
        [self.contentView addSubview:_ima];
        
        [_ima makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(6 * HEIGHTFIT);
            make.left.equalTo(13 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(350 * WIDTHFIT, 70 * HEIGHTFIT));
        }];
        
        self.image = [[UIImageView alloc] init];
        _image.image = [UIImage imageNamed:@"btn-tiaokuan"];
        [self.ima addSubview:_image];
        
        [_image makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(8.5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(293 * WIDTHFIT, 48.5 * HEIGHTFIT));
 
        }];
        
        self.bigIma = [[UIImageView alloc] init];
        self.bigIma.image = [UIImage imageNamed:@"guize"];
        self.bigIma.contentMode = UIViewContentModeScaleAspectFit;
        [self.ima addSubview:_bigIma];
        
        [_bigIma makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.bottom).offset(5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0);
        }];
        
        
        
        self.button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"image-jiant" target:self action:nil];
        self.button.userInteractionEnabled = NO;
        [self.ima addSubview:_button];
        
        [_button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(24 * HEIGHTFIT);
            make.right.equalTo(-12.5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(8 * WIDTHFIT, 15 * HEIGHTFIT));
        }];
        
    }
    return self;
}
- (void)setIsOpen:(BOOL)isOpen
{
    if (_isOpen != isOpen) {
        _isOpen = isOpen;
    }
    if (_isOpen == YES) {
        _ima.image = [UIImage imageNamed:@"zhankai"];
        [_ima updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(6 * HEIGHTFIT);
            make.left.equalTo(13 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(350 * WIDTHFIT, 550 * HEIGHTFIT));
        }];
        [self.button setImage:[[UIImage imageNamed:@"image-jiant-down"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_button updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(24 * HEIGHTFIT);
            make.right.equalTo(-12.5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(15 * WIDTHFIT, 15 * HEIGHTFIT));
        }];
        [_bigIma updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.bottom).offset(5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(490 * HEIGHTFIT);
        }];
    }else{
        _ima.image = [UIImage imageNamed:@"biankuang"];
        [_ima updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(6 * HEIGHTFIT);
            make.left.equalTo(13 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(350 * WIDTHFIT, 70 * HEIGHTFIT));
        }];
        [self.button setImage:[[UIImage imageNamed:@"image-jiant"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [_button updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(24 * HEIGHTFIT);
            make.right.equalTo(-12.5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(8 * WIDTHFIT, 15 * HEIGHTFIT));
        }];
        [_bigIma updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_image.bottom).offset(5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0);
        }];
    }
}
@end
