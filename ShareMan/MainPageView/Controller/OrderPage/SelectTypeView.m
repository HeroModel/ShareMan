//
//  SelectTypeView.m
//  ShareMan
//
//  Created by apple on 2017/8/22.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SelectTypeView.h"
#import "ColorAndMemoryTableViewCell.h"
#import "ContextModel.h"

@interface SelectTypeView ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UILabel * selLabel;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * phoneImage;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, copy) NSString * strName;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label1;
/** <#注释#> */
@property(nonatomic, assign) double depreciation;
/** <#注释#> */
@property(nonatomic, assign) NSInteger original;
/** <#注释#> */
@property(nonatomic, assign) NSInteger real;
@end
static NSString * const ColorAndMemoryCell = @"ColorAndMemoryTableViewCell";
@implementation SelectTypeView
- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.sizearr = @[@"玫瑰红 / 64G", @"玫瑰红 / 128G", @"银色 / 64G", @"磨砂黑 / 128G", @"土豪金 / 64G", @"土豪金 / 128G"];
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;
        [self createSelectView];
    }
    return self;
}
- (void)createSelectView
{
    //点击黑色阴影部分关闭视图
    UIView * topView = [[UIView alloc] init];
    topView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    topView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [topView addGestureRecognizer:tap1];
    [self addSubview:topView];
    [topView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(0);
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.height.equalTo(155 * HEIGHTFIT);
    }];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 155 * HEIGHTFIT, SCREEN_WIDTH, 515 * HEIGHTFIT)];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 20;
    
    [self addSubview:view];
    
    self.phoneImage = [[UIImageView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 125 * HEIGHTFIT, 150 * WIDTHFIT, 112.5 * HEIGHTFIT)];
    self.phoneImage.contentMode = UIViewContentModeScaleAspectFill;
    _phoneImage.image = [UIImage imageNamed:@"z1"];
    _phoneImage.layer.masksToBounds = YES;
    _phoneImage.layer.cornerRadius = 10;
    [self addSubview:_phoneImage];
    
    UIImageView * imageBuy = [[UIImageView alloc] init];
    imageBuy.image = [UIImage imageNamed:@"btn-determine"];
    imageBuy.contentMode = UIViewContentModeScaleAspectFill;
    imageBuy.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didbaButton:)];
    [imageBuy addGestureRecognizer:tap];
    [view addSubview:imageBuy];
    
    [imageBuy makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.bottom.equalTo(0);
        make.height.equalTo(60 * HEIGHTFIT);
    }];
    
    
    self.label = [[UILabel alloc] init];
    _label.text = @"¥ 2700";
    _label.textColor = UIColorFromRGB(RED_COLOR);
    _label.font = NAV_TITLE_N;
    _label.textAlignment = NSTextAlignmentLeft;
    [view addSubview:_label];
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(18 * HEIGHTFIT);
        make.left.equalTo(_phoneImage.right).offset(16 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    //点击✘图片关闭视图
    self.closeButton = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"image-close" target:self action:@selector(didCloseButton:)];
    [view addSubview:_closeButton];
    [_closeButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.right.equalTo(-20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(35 * WIDTHFIT, 35 * HEIGHTFIT));
    }];
    
    self.selLabel = [[UILabel alloc] init];
    _selLabel.text = @"共享10个月";
    _selLabel.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    _selLabel.textAlignment = NSTextAlignmentLeft;
    _selLabel.font = NAM_TITLE;
    [view addSubview:_selLabel];
    [_selLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(_phoneImage.right).offset(16 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(120 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    self.label1 = [[UILabel alloc] init];
    _label1.text = @"意外保障 ¥268 (必选)";
    _label1.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    _label1.textAlignment = NSTextAlignmentLeft;
    _label1.font = NAM_TITLE;
    [view addSubview:_label1];
    [_label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_selLabel.bottom).offset(7.5 * HEIGHTFIT);
        make.left.equalTo(_phoneImage.right).offset(16 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(138 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"image-choose"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(didAskButton:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label1);
        make.left.equalTo(_label1.right);
        make.size.equalTo(CGSizeMake(15 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    UIButton * button1 = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"image-yiwen" target:self action:@selector(didAskButton:)];
    [view addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_label1.top).offset(-2 * HEIGHTFIT);
        make.right.equalTo(-5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(18 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * selabel = [[UILabel alloc] init];
    selabel.text = @"请选择";
    selabel.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    selabel.font = NAM_TITLE;
    selabel.textAlignment = NSTextAlignmentLeft;
    [view addSubview:selabel];
    [selabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneImage.bottom).offset(22 * HEIGHTFIT);
        make.left.equalTo(35 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(20 * WIDTHFIT, 138 * HEIGHTFIT, 335 * WIDTHFIT, 315 * HEIGHTFIT) style:UITableViewStylePlain];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.rowHeight = 59 * HEIGHTFIT;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [view addSubview:_tableView];
    [self.tableView registerClass:[ColorAndMemoryTableViewCell class] forCellReuseIdentifier:ColorAndMemoryCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sizearr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContextModel * model = _sizearr[indexPath.row];
    ColorAndMemoryTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ColorAndMemoryCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.label.text = model.introduce_title;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContextModel * model = _sizearr[indexPath.row];
    ColorAndMemoryTableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    cell.isSeleted = !cell.isSeleted;
    if (cell.isSeleted) {
        self.strName = model.introduce_title;
        [_phoneImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.cover_fir]] placeholderImage:PLACEHOLDER];
        self.real = model.real_price;
        _label.text = [NSString stringWithFormat:@"¥ %ld", _real];
        _label1.text = [NSString stringWithFormat:@"意外保障 ¥%ld (必选)", model.insurance];
        self.depreciation = model.depreciation_count;
        self.original = model.original_price;
//        NSLog(@"折旧费%.2fd", self.depreciation);
    }
    else{
        ContextModel * model = _sizearr[0];
        self.strName = nil;
        [_phoneImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.cover_fir]] placeholderImage:PLACEHOLDER];
        _label.text = [NSString stringWithFormat:@"¥ %ld", model.real_price];
        _label1.text = [NSString stringWithFormat:@"意外保障 ¥%ld (必选)", model.insurance];
        self.real = 0;
        self.depreciation = 0.0;
        self.original = 0;
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ColorAndMemoryTableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    cell.isSeleted = NO;
}
- (void)didCloseButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didCloseButton)]) {
        
        [self.delegate didCloseButton];
    }
}
- (void)didbaButton:(UITapGestureRecognizer *)sender
{
    if ([self.delegate respondsToSelector:@selector(didOrderButton:WithReal_price:WithDepreciation:WithOriginal:)]) {
        [self.delegate didOrderButton:self.strName WithReal_price:[NSString stringWithFormat:@"%ld", self.real] WithDepreciation:self.depreciation WithOriginal:[NSString stringWithFormat:@"%ld", self.original]];
    }
}
- (void)didAskButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(didQuestionButton)]) {
        [self.delegate didQuestionButton];
    }
}

-(void)tap
{
    if ([self.delegate respondsToSelector:@selector(tapDismissView)]) {
        [self.delegate tapDismissView];
    }
}
- (void)setSizearr:(NSMutableArray *)sizearr
{
    if (_sizearr != sizearr) {
        _sizearr = sizearr;
    }
    ContextModel * model = _sizearr[0];
    [_phoneImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.cover_fir]] placeholderImage:PLACEHOLDER];
    _label1.text = [NSString stringWithFormat:@"意外保障 ¥%ld (必选)", model.insurance];
    _label.text = [NSString stringWithFormat:@"¥ %ld", model.real_price];
    [self.tableView reloadData];
}
//- (void)setColorarray:(NSArray *)colorarray
//{
//    if (_colorarray != colorarray) {
//        _colorarray = colorarray;
//    }
//}

@end
