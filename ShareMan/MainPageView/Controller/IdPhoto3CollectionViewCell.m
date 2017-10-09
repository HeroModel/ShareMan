//
//  IdPhoto3CollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "IdPhoto3CollectionViewCell.h"

@implementation IdPhoto3CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.IdImage = [[UIImageView alloc] init];
        self.IdImage.contentMode = UIViewContentModeScaleAspectFill;
        self.IdImage.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        self.IdImage.layer.masksToBounds = YES;
        self.IdImage.layer.cornerRadius = 5;
        [self.contentView addSubview:_IdImage];
        
        self.label = [[UILabel alloc] init];
        self.label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = NAV_TITLE_N;
        [_IdImage addSubview:_label];
        
        self.label1 = [[UILabel alloc] init];
        self.label1.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
        self.label1.textAlignment = NSTextAlignmentCenter;
        self.label1.font = NAME_TIT_FONT;
        [_IdImage addSubview:_label1];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_IdImage makeConstraints:^(MASConstraintMaker *make) {
        //        make.top.equalTo(7.5 * HEIGHTFIT);
        //        make.left.equalTo(7.5 * WIDTHFIT);
        make.edges.equalTo(UIEdgeInsetsMake(7.5 * HEIGHTFIT, 7.5 * WIDTHFIT, 7.5 * HEIGHTFIT, 7.5 * WIDTHFIT));
        //        make.size.equalTo(CGSizeMake(137 * WIDTHFIT, 137 * HEIGHTFIT));
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(50 * HEIGHTFIT);
        make.centerX.equalTo(_IdImage);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    [_label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.bottom).offset(20 * HEIGHTFIT);
        make.centerX.equalTo(_IdImage);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
}
- (void)setIsHiddes:(BOOL)isHiddes
{
    if (_isHiddes != isHiddes) {
        _isHiddes = isHiddes;
    }
    if (_isHiddes) {
        self.label.hidden = YES;
        self.label1.hidden = YES;
    }else{
        self.label.hidden = NO;
        self.label1.hidden = NO;
    }
}

@end
