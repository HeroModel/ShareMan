//
//  CompleteTableViewCell.m
//  ShareMan
//
//  Created by mac on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CompleteTableViewCell.h"

@implementation CompleteTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.left = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        [self.contentView addSubview:_left];
        
        self.right = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        _right.numberOfLines = 0;
        [self.contentView addSubview:_right];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(40 * WIDTHFIT);
            make.right.equalTo(-40 * WIDTHFIT);
            make.bottom.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_left makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(18 * HEIGHTFIT);
        make.left.equalTo(40 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    [_right makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(17 * HEIGHTFIT);
        make.left.equalTo(_left.right).offset(35 * WIDTHFIT);
        make.right.equalTo(-40 * WIDTHFIT);
        make.height.equalTo(16 * HEIGHTFIT);
    }];
}
@end
