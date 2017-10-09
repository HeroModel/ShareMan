//
//  CompleteCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "CompleteCollectionViewCell.h"
#import "ContextTableViewCell.h"

@interface CompleteCollectionViewCell ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
@end
static NSString * const ContextCell = @"ContextTableViewCell";
@implementation CompleteCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.array = @[@"回收机主", @"回收机型", @"完成时间"];
        self.array1 = @[@"薇薇", @"iPhone 7", @"2017-10-19"];
        
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
        
//        UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(6 * WIDTHFIT, 511.5 * HEIGHTFIT, (SCREEN_WIDTH - 12) * WIDTHFIT, 7.5 * HEIGHTFIT)];
//        image.image = [UIImage imageNamed:@"bg-under"];
//        [self.contentView addSubview:image];
        
        CALayer * layer = [CALayer layer];
        layer.frame = CGRectMake(15 * WIDTHFIT, 22.5 * HEIGHTFIT, 345 * WIDTHFIT, 500 * HEIGHTFIT);
        layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
        layer.shadowOffset = CGSizeMake(0, 0);
        layer.shadowOpacity = 0.5;
        layer.cornerRadius = 10.0f;
        [self.contentView.layer addSublayer:layer];
        
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(15 * WIDTHFIT, 22.5 * HEIGHTFIT, 345 * WIDTHFIT, 500 * HEIGHTFIT) style:UITableViewStylePlain];
        self.tableView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.bounces = NO;
        self.tableView.layer.masksToBounds = YES;
        self.tableView.layer.cornerRadius = 10.f;
        self.tableView.rowHeight = 50.f * HEIGHTFIT;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.contentView addSubview:_tableView];
        [self.tableView registerClass:[ContextTableViewCell class] forCellReuseIdentifier:ContextCell];

        [self createTableViewHeader];
    }
    return self;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ContextCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.leftLabel.text = _array[indexPath.row];
    cell.rightLabel.text = _array1[indexPath.row];
    return cell;
}
- (void)createTableViewHeader
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 345 * WIDTHFIT, 159 * HEIGHTFIT)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10.f;
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"¥";
    label.textColor = UIColorFromRGB(SIGN_COLOR);
    label.font = NAV_TITLE_N;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(79 * HEIGHTFIT);
        make.left.equalTo(106.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(12 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.text = @"1889";
    label1.textColor = UIColorFromRGB(SIGN_COLOR);
    label1.font = NUMBER_TITLE_T;
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(64 * HEIGHTFIT);
        make.left.equalTo(label.right).offset(8 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 40 * HEIGHTFIT));
    }];
    
    UILabel * label2 = [[UILabel alloc] init];
    label2.text = @"回收价";
    label2.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    label2.font = TIT_FONT;
    label2.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(142.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 13 * HEIGHTFIT));
    }];
    
    self.tableView.tableHeaderView = view;
}
@end
