//
//  BackImageTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/7.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BackImageTableViewCell.h"

@implementation BackImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * image = [[UIImageView alloc] init];
        image.image = [UIImage imageNamed:@"bg-daijinquan"];
        [self.contentView addSubview:image];
        [image makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.and.right.equalTo(0);
            make.height.equalTo(280 * HEIGHTFIT);
        }];
    }
    return self;
}

@end
