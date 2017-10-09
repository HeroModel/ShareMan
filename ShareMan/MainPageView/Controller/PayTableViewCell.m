//
//  PayTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PayTableViewCell.h"

@interface PayTableViewCell ()

@end
@implementation PayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.payImage = [[UIImageView alloc] init];
        self.payImage.image = [UIImage imageNamed:@"image-alipay"];
        self.payImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_payImage];
        
        self.label = [[UILabel alloc] init];
        self.label.text = @"支付宝";
        self.label.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
        self.label.font = NAM_TITLE;
        self.label.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_label];
        
        self.butt = [UIButton buttonWithType:UIButtonTypeCustom];
        [_butt setImage:[[UIImage imageNamed:@"btn-choose-gray"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
        [_butt setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        _butt.userInteractionEnabled = NO;
        [self.contentView addSubview:_butt];
        [_butt makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(18 * HEIGHTFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(24 * WIDTHFIT, 24 * HEIGHTFIT));
        }];
        
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        [self.contentView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.bottom.equalTo(0);
            make.height.equalTo(0.5);
        }];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_payImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(8 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(43 * WIDTHFIT, 43 * HEIGHTFIT));
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(22.5 * HEIGHTFIT);
        make.left.equalTo(_payImage.right).offset(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
}
- (void)setIsSelected:(BOOL)isSelected
{
    if (_isSelected != isSelected) {
        _isSelected = isSelected;
    }
    if (_isSelected) {
        [_butt setImage:[[UIImage imageNamed:@"btn-choose-blue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    }else{
        [_butt setImage:[[UIImage imageNamed:@"btn-choose-gray"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    }
    self.butt.selected = _isSelected;
}
@end
