//
//  ApplyContextCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ApplyContextCollectionViewCell.h"

@interface ApplyContextCollectionViewCell ()

/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) UILabel * phone;
/** <#注释#> */
@property(nonatomic, strong) UILabel * money;
/** <#注释#> */
@property(nonatomic, strong) UILabel * leftLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * rightLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * number;
/** <#注释#> */
@property(nonatomic, strong) UILabel * address;
/** <#注释#> */
@property(nonatomic, strong) UILabel * date;
/** <#注释#> */
@property(nonatomic, strong) UILabel * color;
/** <#注释#> */
@property(nonatomic, strong) UIButton * button;

@end
@implementation ApplyContextCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = UIColorFromRGB(0xe9e9e9);
        view.layer.masksToBounds = YES;
        view.layer.cornerRadius = 10;
        [self.contentView addSubview:view];
        [view makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(15.5 * HEIGHTFIT);
            make.left.equalTo(33 * WIDTHFIT);
            make.right.equalTo(-33 * WIDTHFIT);
            make.height.equalTo(20 * HEIGHTFIT);
        }];

        
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(15 * WIDTHFIT, 22.5 * HEIGHTFIT, 345 * WIDTHFIT, 500 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        UIView * backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor whiteColor];
        backView.layer.masksToBounds = YES;
        backView.layer.cornerRadius = 10.f;
        [self.contentView addSubview:backView];
        [backView makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(22.5 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(500 * HEIGHTFIT);
        }];
        
        self.phone = [[UILabel alloc] init];
        _phone.text = @"iPhone 7";
        _phone.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
        _phone.font = NAM_TITLE_FONT_M;
        [backView addSubview:_phone];
        [_phone makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(20 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 20 * HEIGHTFIT));
        }];
        
        self.color = [[UILabel alloc] init];
        _color.text = @"黑色 / 32G";
        _color.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
        _color.font = NAM_TITLE;
        [backView addSubview:_color];
        [_color makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_phone.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(85 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        self.money = [[UILabel alloc] init];
        _money.text = @"¥ 1889";
        _money.textColor = UIColorFromRGB(SIGN_COLOR);
        _money.font = NAM_TITLE;
        [backView addSubview:_money];
        [_money makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_color.bottom).offset(10 * HEIGHTFIT);
            make.left.equalTo(25 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        CALayer * layer1 = [CALayer layer];
        layer1.frame = CGRectMake(264 * WIDTHFIT, 17.5 * HEIGHTFIT, 66 * WIDTHFIT, 33 * HEIGHTFIT);
        layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer1.shadowOffset = CGSizeMake(0, 0);
        layer1.shadowOpacity = 0.5;
        layer1.cornerRadius = 5.0f;
        [backView.layer addSublayer:layer1];
        
        
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        [self.button setTitleColor:UIColorFromRGB(SIGN_COLOR) forState:UIControlStateNormal];
        self.button.titleLabel.font = NAM_TITLE_B;
        self.button.adjustsImageWhenDisabled = NO;
        self.button.layer.masksToBounds = YES;
        self.button.layer.cornerRadius = 5;
        [self.button addTarget:self action:@selector(didButtonPly:) forControlEvents:UIControlEventTouchUpInside];
        [backView addSubview:_button];
        [_button makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(17.5 * HEIGHTFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(66 * WIDTHFIT, 33 * HEIGHTFIT));
        }];
        
        CALayer * layer2 = [CALayer layer];
        layer2.frame = CGRectMake(178 * WIDTHFIT, 17.5 * HEIGHTFIT, 66 * WIDTHFIT, 33 * HEIGHTFIT);
        layer2.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer2.shadowOffset = CGSizeMake(0, 0);
        layer2.shadowOpacity = 0.5;
        layer2.cornerRadius = 5.0f;
        [backView.layer addSublayer:layer2];
        
        UIButton * button1 = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"取消订单" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(SIGN_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didButtonDismiss:)];
        [backView addSubview:button1];
        [button1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(17.5 * HEIGHTFIT);
            make.right.equalTo(_button.left).offset(-20 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(66 * WIDTHFIT, 33 * HEIGHTFIT));
        }];

        UIView * line = [UIView lineWithView];
        [backView addSubview:line];
        [line makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_money.bottom).offset(20 * HEIGHTFIT);
            make.left.equalTo(0);
            make.right.equalTo(0);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];

        self.leftLabel = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        self.leftLabel.textAlignment = NSTextAlignmentLeft;
        self.leftLabel.text = @"申请人";
        [backView addSubview:_leftLabel];
        [_leftLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        self.rightLabel = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        [backView addSubview:_rightLabel];
        [_rightLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line.bottom).offset(18 * HEIGHTFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 16 * HEIGHTFIT));
        }];

        UIView * line1 = [UIView lineWithView];
        [backView addSubview:line1];
        [line1 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_leftLabel.bottom).offset(20 * WIDTHFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];

        UILabel * label = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label.textAlignment = NSTextAlignmentLeft;
        label.text = @"身份证号码";
        [backView addSubview:label];
        [label makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        self.number = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.number.textAlignment = NSTextAlignmentRight;
        [backView addSubview:_number];
        [_number makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line1.bottom).offset(18 * HEIGHTFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 16 * HEIGHTFIT));
        }];

        UIView * line2 = [UIView lineWithView];
        [backView addSubview:line2];
        [line2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_number.bottom).offset(20 * WIDTHFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        

        UILabel * label2 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label2.textAlignment = NSTextAlignmentLeft;
        label2.text = @"现住地址";
        [backView addSubview:label2];
        [label2 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line2.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
       
        self.address = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.address.textAlignment = NSTextAlignmentRight;
        self.address.numberOfLines = 0;
        [backView addSubview:_address];
        [_address makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line2.bottom).offset(10 * HEIGHTFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(195 * WIDTHFIT, 50 * HEIGHTFIT));
        }];

        UIView * line3 = [UIView lineWithView];
        [backView addSubview:line3];
        [line3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_address.bottom).offset(15 * WIDTHFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];

        UILabel * label3 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
        label3.textAlignment = NSTextAlignmentLeft;
        label3.text = @"申请日期";
        [backView addSubview:label3];
        [label3 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line3.bottom).offset(18 * HEIGHTFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
        }];
        
        
        self.date = [UILabel StringWithFont:NAM_TITLE_B WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
        self.date.textAlignment = NSTextAlignmentRight;
        self.date.numberOfLines = 0;
        [backView addSubview:_date];
        [_date makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(line3.bottom).offset(18 * HEIGHTFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.size.equalTo(CGSizeMake(200 * WIDTHFIT, 16 * HEIGHTFIT));
        }];
        
        UIView * line4 = [UIView lineWithView];
        [backView addSubview:line4];
        [line4 makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_date.bottom).offset(20 * WIDTHFIT);
            make.left.equalTo(15 * WIDTHFIT);
            make.right.equalTo(-15 * WIDTHFIT);
            make.height.equalTo(0.5 * HEIGHTFIT);
        }];
        

    }
    return self;
}
- (void)didButtonPly:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didButtonAlert:)]) {
        [self.delegate didButtonAlert:_model.order_id];
    }
}
- (void)didButtonDismiss:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didButtonDismissAlert:)]) {
        [self.delegate didButtonDismissAlert:_model.order_id];
    }
}
- (void)setModel:(OrderModel *)model
{
    if (_model != model) {
        _model = model;
    }
    self.phone.text = model.version;
    self.money.text = [NSString stringWithFormat:@"¥ %ld", model.real_price];
    self.rightLabel.text = model.name;
    NSString * string = model.id_card_no;
    self.number.text = [string stringByReplacingCharactersInRange:NSMakeRange(4, 10) withString:@"**********"];
    self.address.text = model.address;
    self.date.text = model.create_time;
    self.color.text = model.color_name;
    NSInteger count = (long)model.status;
    if (count == 1) {
        [self.button setTitle:@"申请中" forState:UIControlStateNormal];
        self.button.userInteractionEnabled = NO;
    }else{
        [self.button setTitle:@"待支付" forState:UIControlStateNormal];
        self.button.userInteractionEnabled = YES;
    }

}

@end
