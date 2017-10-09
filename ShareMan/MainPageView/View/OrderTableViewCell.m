//
//  OrderTableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "OrderTableViewCell.h"

@interface OrderTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *viewLine;

@end
@implementation OrderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.viewLine.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
