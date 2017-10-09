//
//  DownCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DownCollectionViewCell.h"

@implementation DownCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.phoneImage = [[UIImageView alloc] init];
        self.phoneImage.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_phoneImage];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_phoneImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(70 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(377.5 * HEIGHTFIT);
    }];
}
- (void)setModel:(ShareModel *)model
{
    if (_model != model) {
        _model = model;
    }
    

}
@end
