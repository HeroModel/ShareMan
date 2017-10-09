//
//  VouchersTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VouchersTableViewCell.h"

@interface VouchersTableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * vouImage;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
@end
@implementation VouchersTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.vouImage = [[UIImageView alloc] init];
        self.vouImage.image = [UIImage imageNamed:@"image-3"];
        self.vouImage.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_vouImage];
        
        self.label = [[UILabel alloc] init];
        self.label.textColor = UIColorFromRGB(FONT_COLOR);
        self.label.textAlignment = NSTextAlignmentLeft;
        self.label.font = NAME_TIT_FONT;
        [_vouImage addSubview:_label];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    [_vouImage makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30 * HEIGHTFIT);
        make.left.equalTo(10 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(350 * WIDTHFIT, 135 * HEIGHTFIT));
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(94 * HEIGHTFIT);
        make.left.equalTo(25 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(185 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
}
- (void)setModel:(ContextModel *)model
{
    if (_model != model) {
        _model = model;
    }
    self.label.text = [NSString stringWithFormat:@"有效期:%@ - %@", model.startDate, model.endDate];
}
@end
