//
//  Recycling_YouHu_TableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "Recycling_YouHu_TableViewCell.h"

@implementation Recycling_YouHu_TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.left = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_PAGE_COLOR)];
        self.left.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_left];
        
        self.right = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.right.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_right];
        
        UIView * line = [UIView lineWithView];
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.bottom.equalTo(@0);
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
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    [_right makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(17 * HEIGHTFIT);
        make.right.equalTo(-20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
}
@end
