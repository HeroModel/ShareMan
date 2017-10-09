//
//  ProductNameTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ProductNameTableViewCell.h"

@interface ProductNameTableViewCell ()
/** 介绍 */
@property(nonatomic, strong) UILabel * strLabel;
/** <#注释#> */
@property(nonatomic, strong) UIView * lineView;
/** 钱 */
@property(nonatomic, strong) UILabel * label1;
@end
@implementation ProductNameTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.productLabel = [[UILabel alloc] init];
//        self.productLabel.text = @"iPhone 7";
        self.productLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.productLabel.font = NUMBER_TITLE_FONT;
        self.productLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_productLabel];
        
        self.priceLabel = [[UILabel alloc] init];
//        self.priceLabel.text = @"[价值5999元]";
        self.priceLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.priceLabel.font = NAM_TITLE;
        self.priceLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_priceLabel];
        
        self.oldLabel = [[UILabel alloc] init];
//        self.oldLabel.text = @"折旧费 12.0元/天";
        self.oldLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.oldLabel.font = NAM_TITLE;
        self.oldLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_oldLabel];
        
        self.strLabel = [[UILabel alloc] init];
        self.strLabel.text = @"芝麻分≥580即可享受租机服务";
        self.strLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.strLabel.font = NAM_TITLE;
        self.strLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_strLabel];
        
        self.label = [[UILabel alloc] init];
//        self.label.text = @"¥ 2700";
        self.label.textColor = UIColorFromRGB(RED_COLOR);
        self.label.font = NUMBER_TITLE_FONT;
        self.label.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_label];
        
        self.label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        _label1.text = @"[10个月]";
        _label1.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_label1];
        
        self.lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        [self.contentView addSubview:_lineView];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_productLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(290 * WIDTHFIT, 22 * HEIGHTFIT));
    }];
    
    [_priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productLabel.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    [_oldLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_productLabel.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(_priceLabel.right).offset(5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(120 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    
    [_strLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_priceLabel.bottom).offset(20 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(52 * HEIGHTFIT);
        make.right.equalTo(-25 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 22 * HEIGHTFIT));
    }];
    
    [_label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.bottom).offset(12 * HEIGHTFIT);
        make.right.equalTo(-26 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 22 * HEIGHTFIT));
    }];
    
    [_lineView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_strLabel.bottom).offset(15 * HEIGHTFIT);
        make.left.and.right.equalTo(0);
        make.height.equalTo(5 * HEIGHTFIT);
    }];
}

@end
