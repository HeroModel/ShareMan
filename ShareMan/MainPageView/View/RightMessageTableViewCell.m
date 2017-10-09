//
//  RightMessageTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RightMessageTableViewCell.h"

@interface RightMessageTableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * headerImage;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;

@end
@implementation RightMessageTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * header = [[UIImageView alloc] init];
        header.image = [UIImage imageNamed:@"system-head"];
        [self.contentView addSubview:header];
        [header makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(30 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(57.5 * WIDTHFIT, 57.5 * HEIGHTFIT));
        }];
        
        UIImageView * images = [[UIImageView alloc] init];
        images.image = [UIImage imageNamed:@"bg-xiaoxi-1"];
        [self.contentView addSubview:images];
        [images makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(25 * HEIGHTFIT);
            make.left.equalTo(header.right).offset(5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(265 * WIDTHFIT, 120 * HEIGHTFIT));
        }];
        
        self.label = [[UILabel alloc] init];
        _label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        _label.font = NAM_TITLE_FONT;
        _label.numberOfLines = 0;
        [images addSubview:_label];
        [_label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20 * HEIGHTFIT);
            make.left.equalTo(30 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(50 * HEIGHTFIT);
        }];
        
        UILabel * label1 = [UILabel labelString:@"优惠券传送门" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        [images addSubview:label1];
        [label1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label.bottom).offset(24 * HEIGHTFIT);
            make.left.equalTo(30 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(90 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        UIButton * button = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"image-jiant" target:self action:nil];
        button.userInteractionEnabled = NO;
        [images addSubview:button];
        [button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_label.bottom).offset(25 * HEIGHTFIT);
            make.left.equalTo(label1.right).offset(5 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(7 * WIDTHFIT, 12 * HEIGHTFIT));
        }];
        
    }
    return self;
}
- (void)setModel:(ContextModel *)model
{
    if (_model != model) {
        _model = model;
    }
    self.label.text = model.message;
}
@end
