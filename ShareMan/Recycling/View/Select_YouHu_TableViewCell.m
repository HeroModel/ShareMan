//
//  Select_YouHu_TableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Select_YouHu_TableViewCell.h"

@implementation Select_YouHu_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.strLabel = [[UILabel alloc] init];
        self.strLabel.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        self.strLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.strLabel.textAlignment = NSTextAlignmentCenter;
        self.strLabel.font = NAV_TITLE_N;
        self.strLabel.layer.masksToBounds = YES;
        self.strLabel.layer.cornerRadius = 22;
        [self.contentView addSubview:_strLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_strLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(10 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.right.equalTo(-35 * WIDTHFIT);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
- (void)setIsSelect:(BOOL)isSelect
{
    if (_isSelect != isSelect) {
        _isSelect = isSelect;
    }
    if (_isSelect) {
        self.strLabel.backgroundColor = UIColorFromRGB(GLOBAL_NAME_COLOR);
        self.strLabel.textColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    }else{
        self.strLabel.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        self.strLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    }
}
@end
