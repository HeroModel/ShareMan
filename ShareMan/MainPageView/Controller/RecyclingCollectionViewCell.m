//
//  RecyclingCollectionViewCell.m
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RecyclingCollectionViewCell.h"
#import "ContextTableViewCell.h"
#import "ShapeTableViewCell.h"
#import "ClickTableViewCell.h"

@interface RecyclingCollectionViewCell ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array2;
@end
static NSString * const ContextCell = @"ContextTableViewCell";
static NSString * const ShapeCell = @"ShapeTableViewCell";
static NSString * const ClickCell = @"ClickTableViewCell";
@implementation RecyclingCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.array = @[@"回收机主", @"回收时间"];
        self.array1 = @[@"薇薇", @"2017-08-24"];
        self.array2 = @[@"快递单号", @"回收地址"];
        
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
        
        [self createTableViewHeader];
        
        [self.tableView registerClass:[ContextTableViewCell class] forCellReuseIdentifier:ContextCell];
        [self.tableView registerClass:[ShapeTableViewCell class] forCellReuseIdentifier:ShapeCell];
        [self.tableView registerClass:[ClickTableViewCell class] forCellReuseIdentifier:ClickCell];

        
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.array.count;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return self.array2.count;
            break;
        default:
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    switch (indexPath.section) {
        case 0:
        {
            ContextTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ContextCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = _array[indexPath.row];
            cell.rightLabel.text = _array1[indexPath.row];
            return cell;
            
        }
            break;
        case 1:
        {
            ShapeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ShapeCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = @"回收机型";
            cell.rightLabel.text = @"iPhone 7";
            return cell;
        }
            break;
        case 2:
        {
            ClickTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ClickCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.leftLabel.text = _array2[indexPath.row];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return;
            break;
        case 1:
            return;
            break;
        case 2:
        {
            switch (indexPath.row) {
                case 0:
                {
                    if ([self.delegate respondsToSelector:@selector(didButtonAlertView)]) {
                        [self.delegate didButtonAlertView];
                    }
                }
                    break;
                case 1:
                {
                    
                }
                    break;
                default:
                    break;
            }
        }
            break;
        default:
            break;
    }
}
- (void)createTableViewHeader
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 345 * WIDTHFIT, 103 * HEIGHTFIT)];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 10.f;
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"¥";
    label.textColor = UIColorFromRGB(SIGN_COLOR);
    label.font = NAV_TITLE_N;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(48.5 * HEIGHTFIT);
        make.left.equalTo(106.5 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(12 * WIDTHFIT, 18 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [[UILabel alloc] init];
    label1.text = @"1889";
    label1.textColor = UIColorFromRGB(SIGN_COLOR);
    label1.font = NUMBER_TITLE_T;
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(33.5 * HEIGHTFIT);
        make.left.equalTo(label.right).offset(8 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(130 * WIDTHFIT, 40 * HEIGHTFIT));
    }];
    
    UILabel * label2 = [[UILabel alloc] init];
    label2.text = @"预估价";
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
