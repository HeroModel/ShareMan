//
//  ColorAndMemoryTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ColorAndMemoryTableViewCell.h"
@interface ColorAndMemoryTableViewCell ()

@end
@implementation ColorAndMemoryTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] init];
        self.label.font = NAM_TITLE_B;
        self.label.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.backgroundColor = UIColorFromRGB(BACK_COLOR);
        self.label.layer.masksToBounds = YES;
        self.label.layer.cornerRadius = 8;
        self.label.text = @"玫瑰红 / 64G";
        [self.contentView addSubview:_label];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(7.5 * HEIGHTFIT);
        make.left.and.right.equalTo(0);
        make.bottom.equalTo(-7.5 * HEIGHTFIT);
    }];
}
- (void)setIsSeleted:(BOOL)isSeleted
{
    if (_isSeleted != isSeleted) {
        _isSeleted = isSeleted;
    }
    if (_isSeleted) {
        self.label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.label.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    }
    else{
       self.label.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
       self.label.backgroundColor = UIColorFromRGB(BACK_COLOR);
    }
}
@end
