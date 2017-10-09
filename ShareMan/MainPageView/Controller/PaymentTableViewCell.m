//
//  PaymentTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PaymentTableViewCell.h"

@interface PaymentTableViewCell ()

/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;
@end
@implementation PaymentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        self.label = [[UILabel alloc] init];
        self.label.text = @"实际付款";
        self.label.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.label.textAlignment = NSTextAlignmentLeft;
        self.label.font = NAM_TITLE_B;
        [self.contentView addSubview:_label];
        
        self.mLabel = [[UILabel alloc] init];
        self.mLabel.textColor = UIColorFromRGB(RED_COLOR);
        self.mLabel.textAlignment = NSTextAlignmentLeft;
        self.mLabel.font = NAM_TITLE;
        [self.contentView addSubview:_mLabel];
        
        self.button  =[UIButton buttonWithType:UIButtonTypeCustom];
        [self.button setImage:[[UIImage imageNamed:@"image-jiant"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        [self.contentView addSubview:_button];
        
        self.strLabel = [[UILabel alloc] init];
        self.strLabel.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
        self.strLabel.textAlignment = NSTextAlignmentRight;
        self.strLabel.font = NAM_TITLE_FONT;
        [self.contentView addSubview:_strLabel];
        
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
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(18 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    [_mLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.bottom).offset(7 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    [_button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(29 * HEIGHTFIT);
        make.right.equalTo(-20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(8 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    [_strLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(28 * HEIGHTFIT);
        make.right.equalTo(_button.left).offset(-10 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(120 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
}
@end
