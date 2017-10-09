//
//  PhoneNameTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "PhoneNameTableViewCell.h"

@implementation PhoneNameTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.namePhone = [[UILabel alloc] init];
        self.namePhone.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.namePhone.textAlignment = NSTextAlignmentCenter;
        self.namePhone.font = NAM_TITLE;
        [self.contentView addSubview:_namePhone];
        [_namePhone makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(22.5 * WIDTHFIT);
            make.right.equalTo(-22.5 * WIDTHFIT);
            make.center.equalTo(self.contentView);
        }];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(22.5 * WIDTHFIT);
            make.right.equalTo(-22.5 * WIDTHFIT);
            make.bottom.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
        
    }
    return self;
}

@end
