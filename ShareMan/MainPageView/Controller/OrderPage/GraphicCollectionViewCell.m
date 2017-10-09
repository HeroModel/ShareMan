//
//  GraphicCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "GraphicCollectionViewCell.h"

@implementation GraphicCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.grapIamge = [[UIImageView alloc] init];
        self.grapIamge.contentMode = UIViewContentModeScaleToFill;
//        self.grapIamge.image = []
        [self.contentView addSubview:_grapIamge];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_grapIamge makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(5);
        make.left.and.right.equalTo(0);
        make.bottom.equalTo(0);
    }];
}
@end
