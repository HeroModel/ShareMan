//
//  ImageCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.phoneImage = [[UIImageView alloc] init];
        self.phoneImage.layer.masksToBounds = YES;
        self.phoneImage.layer.cornerRadius = 8.f;
        self.phoneImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_phoneImage];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_phoneImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.bottom.equalTo(0);
    }];
}
- (void)setModel:(ShareModel *)model
{
    if (_model != model) {
        _model = model;
    }
    
}
@end
