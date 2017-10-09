//
//  ContextTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ContextTableViewCell.h"

@interface ContextTableViewCell ()

@end
@implementation ContextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftLabel = [[UILabel alloc] init];
        self.leftLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.leftLabel.textAlignment = NSTextAlignmentLeft;
        self.leftLabel.font = NAM_TITLE;
        [self.contentView addSubview:_leftLabel];
        
        self.rightLabel = [[UILabel alloc] init];
        self.rightLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        self.rightLabel.font = NAM_TITLE_B;
        [self.contentView addSubview:_rightLabel];
        
        UIView * line = [[UIView alloc] init];
        line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
        [self.contentView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(20 * WIDTHFIT);
            make.right.equalTo(-20 * WIDTHFIT);
            make.bottom.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_leftLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(18 * HEIGHTFIT);
        make.left.equalTo(25 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    [_rightLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(17 * HEIGHTFIT);
        make.right.equalTo(-20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(100 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
}
@end
