//
//  ShareTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareTableViewCell.h"


@implementation ShareTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageShare = [[UIImageView alloc] init];
        self.imageShare.contentMode = UIViewContentModeScaleToFill;
        [self.contentView addSubview:_imageShare];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_imageShare makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(345 * WIDTHFIT, 165 * HEIGHTFIT));
    }];
}
@end
