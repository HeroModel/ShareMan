//
//  ProductsTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ProductsTableViewCell.h"

@interface ProductsTableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UIImageView * strImage;
@end
@implementation ProductsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.leftLabel = [[UILabel alloc] init];
        self.leftLabel.textColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        self.leftLabel.textAlignment = NSTextAlignmentCenter;
        self.leftLabel.font = NAM_TITLE_B;
        [self.contentView addSubview:_leftLabel];
        [_leftLabel makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.contentView);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
//        self.strImage = [[UIImageView alloc] init];
//        self.strImage.image = [UIImage imageNamed:@""];
        
        
    }
    return self;
}

- (void)setIsSeleted:(BOOL)isSeleted
{
    if (_isSeleted != isSeleted) {
        _isSeleted = isSeleted;
    }
    if (_isSeleted) {
       self.leftLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    }else{
       self.leftLabel.textColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    }
}
@end
