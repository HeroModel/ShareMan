//
//  ModityCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ModityCollectionViewCell.h"

@implementation ModityCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.modImage = [[UIImageView alloc] init];
        self.modImage.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_modImage];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_modImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(5 * HEIGHTFIT);
        make.left.and.right.equalTo(0);
        make.bottom.equalTo(0);
    }];
}

@end
