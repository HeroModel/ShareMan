//
//  BackGroundCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BackGroundCollectionViewCell.h"

@implementation BackGroundCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = UIColorFromRGB(0xe9e9e9);
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 10;
        [self.contentView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15.5 * HEIGHTFIT);
            make.left.equalTo(33 * WIDTHFIT);
            make.right.equalTo(-33 * WIDTHFIT);
            make.height.equalTo(20 * HEIGHTFIT);
        }];
        
        UIImageView * backView = [[UIImageView alloc] init];
        backView.image = [UIImage imageNamed:@"nodate"];
        backView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:backView];
        [backView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(22.5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(505 * HEIGHTFIT);
        }];
    }
    return self;
}
@end
