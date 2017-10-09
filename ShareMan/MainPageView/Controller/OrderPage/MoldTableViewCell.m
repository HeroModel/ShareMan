//
//  MoldTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MoldTableViewCell.h"


@implementation MoldTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIImageView * selectImage = [[UIImageView alloc] init];
        selectImage.image = [UIImage imageNamed:@"btn-style"];
        selectImage.contentMode = UIViewContentModeScaleToFill;
//        selectButton.userInteractionEnabled = NO;
        [self.contentView addSubview:selectImage];
        
        [selectImage makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15 * HEIGHTFIT);
            make.left.equalTo(13 * WIDTHFIT);
            make.right.equalTo(-13 * WIDTHFIT);
            make.height.equalTo(50 * HEIGHTFIT);
        }];
    }
    return self;
}
@end
