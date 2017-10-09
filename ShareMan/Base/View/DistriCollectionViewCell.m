//
//  DistriCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DistriCollectionViewCell.h"

@implementation DistriCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.phontImage.layer.masksToBounds = YES;
    self.phontImage.layer.cornerRadius = 8;
}
- (void)setModel:(ContextModel *)model
{
    if (_model != model) {
        _model = model;
    }
    NSString * string = [URL stringByAppendingString:model.category_url];
    [self.phontImage sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:PLACEHOLDER];
}
@end
