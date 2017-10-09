//
//  AddresstableViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddresstableViewCell.h"

@interface AddresstableViewCell ()
/** <#注释#> */
@property(nonatomic, strong) UILabel * nameLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * phoneLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * addressLabel;
/** <#注释#> */
@property(nonatomic, strong) UIButton * deleteButton;
/** <#注释#> */
@property(nonatomic, strong) UIButton * editButton;
/** <#注释#> */
@property(nonatomic, strong) UIView * line;
/** <#注释#> */
@property(nonatomic, assign) NSInteger countID;
@end
@implementation AddresstableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView * groundView = [[UIView alloc] init];
        groundView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        groundView.layer.masksToBounds = YES;
        groundView.layer.cornerRadius = 5;
        [self.contentView addSubview:groundView];
        
        [groundView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(7.5 * HEIGHTFIT);
            make.left.equalTo(17.5 * WIDTHFIT);
            make.right.equalTo(-17.5 * WIDTHFIT);
            make.bottom.equalTo(-7.5 * HEIGHTFIT);
        }];
        
        self.nameLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = NAM_TITLE_B;
        [groundView addSubview:_nameLabel];
        
        self.deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.deleteButton setImage:[[UIImage imageNamed:@"icon-del"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.deleteButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        [self.deleteButton addTarget:self action:@selector(didDeleteButton:) forControlEvents:UIControlEventTouchUpInside];
        [groundView addSubview:_deleteButton];
        
        self.editButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editButton setImage:[[UIImage imageNamed:@"icon-edit"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [self.editButton setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        [self.editButton addTarget:self action:@selector(didEditButton:) forControlEvents:UIControlEventTouchUpInside];
        [groundView addSubview:_editButton];
        
        self.phoneLabel = [[UILabel alloc] init];
        self.nameLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        self.nameLabel.textAlignment = NSTextAlignmentLeft;
        self.nameLabel.font = NAM_TITLE_B;
        [groundView addSubview:_phoneLabel];
        
        self.line = [[UIView alloc] init];
        _line.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
        [groundView addSubview:_line];
        
        self.addressLabel = [[UILabel alloc] init];
        self.addressLabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        self.addressLabel.textAlignment = NSTextAlignmentLeft;
        self.addressLabel.numberOfLines = 0;
        self.addressLabel.font = TIT_FONT;
        [groundView addSubview:_addressLabel];
    }
    return self;
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.left.equalTo(25 * HEIGHTFIT);
        make.size.equalTo(CGSizeMake(228 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    [_deleteButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.left.equalTo(self.nameLabel.right);
        make.size.equalTo(CGSizeMake(24 * WIDTHFIT, 24 * HEIGHTFIT));
    }];
    
    [_editButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.left.equalTo(self.deleteButton.right).offset(25 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(24 * WIDTHFIT, 24 * HEIGHTFIT));
    }];
    
    [_phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameLabel.left);
        make.size.equalTo(CGSizeMake(228 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    [_line makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneLabel.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(self.nameLabel.left);
        make.size.equalTo(CGSizeMake(228 * WIDTHFIT, 1 * HEIGHTFIT));
    }];
    
    [_addressLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.line.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameLabel.left);
        make.size.equalTo(CGSizeMake(228 * WIDTHFIT, 45 * HEIGHTFIT));
    }];
    
}
- (void)didDeleteButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didDeleteButton:)]) {
        [self.delegate didDeleteButton:_countID];
    }
}
- (void)didEditButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didEditButton:consigneeName:consigneeTel:consigneeAddress:detailAddress:)]) {
        [self.delegate didEditButton:_countID
                       consigneeName:_model.consignee_name
                        consigneeTel:_model.consignee_tel
                    consigneeAddress:_model.consignee_address
                       detailAddress:_model.detail_address];
    }
}
- (void)setModel:(IDPersonallModel *)model
{
    if (_model != model) {
        _model = model;
    }
    self.nameLabel.text = _model.consignee_name;
    self.phoneLabel.text = _model.consignee_tel;
    self.addressLabel.text = [NSString stringWithFormat:@"%@%@", _model.consignee_address, _model.detail_address];
    self.countID = [_model.strID integerValue];
    
}
@end
