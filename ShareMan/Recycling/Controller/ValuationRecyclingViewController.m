//
//  ValuationRecyclingViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/2.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ValuationRecyclingViewController.h"
#import "Recycling_YouHu_TableViewCell.h"
#import "OrderViewController.h"
#import "RecyclingViewController.h"

@interface ValuationRecyclingViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array2;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array3;
@end
static NSString * const RecyclingCell = @"Recycling_YouHu_TableViewCell";
@implementation ValuationRecyclingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"回收";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackPushVC:)];
    self.navigationItem.leftBarButtonItem = left;
    
    self.array = @[@"是否有保", @"外壳情况", @"屏幕外观", @"维修拆机"];
    self.array1 = @[@"过保", @"外壳完好", @"屏幕显示正常", @"屏幕维修"];
    self.array2 = @[@"其他情况", @"其他情况", @"其他情况"];
    self.array3 = @[@"充电不正常", @"机身弯曲", @"机身进水"];
    
    [self createTable];
    [self createHeaderTable];
    [self creaBackButton];
}
- (void)createTable
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 45) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.rowHeight = 50;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[Recycling_YouHu_TableViewCell class] forCellReuseIdentifier:RecyclingCell];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.array.count;
            break;
        case 1:
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
            Recycling_YouHu_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RecyclingCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.left.text = _array[indexPath.row];
            cell.right.text = _array1[indexPath.row];
            return cell;
        }
            break;
        case 1:
        {
            Recycling_YouHu_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RecyclingCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.left.text = _array2[indexPath.row];
            cell.right.text = _array3[indexPath.row];
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)createHeaderTable
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 124)];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    
    UILabel * label = [UILabel labelString:@"iPhone 7" WithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.textAlignment = NSTextAlignmentLeft;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(30 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 20 * HEIGHTFIT));
    }];
    
    UILabel * label1 = [UILabel labelString:@"¥ 1889" WithFont:NAM_TITLE WithTextColor:UIColorFromRGB(SIGN_COLOR)];
    label1.textAlignment = NSTextAlignmentLeft;
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    UILabel * label2 = [UILabel labelString:@"此价为预估价，回收价以最终检测为准。" WithFont:NAME_TIT_FONT WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label2.textAlignment = NSTextAlignmentLeft;
    [view addSubview:label2];
    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.bottom).offset(11 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(220 * WIDTHFIT, 14 * HEIGHTFIT));
    }];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake((375 - 15 - 78) * WIDTHFIT, 27 * HEIGHTFIT, 78 * WIDTHFIT, 33 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 5.0f;
    [view.layer addSublayer:layer];
    
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"重新估价" WithBackgroundColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) WithFont:NAM_TITLE target:self action:@selector(didValuationButton:)];
    [view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(27 * HEIGHTFIT);
        make.right.equalTo(-15 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(78 * WIDTHFIT, 33 * HEIGHTFIT));
    }];
    
    UIView * line = [UIView lineWithView];
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.and.bottom.equalTo(0);
        make.height.equalTo(0.5);
    }];
    
    self.tableView.tableHeaderView = view;
}
- (void)creaBackButton
{
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"立即回收" WithBackgroundColor:UIColorFromRGB(GR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didRecyclingButton:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.bottom);
        make.left.equalTo(-5 * WIDTHFIT);
        make.right.equalTo(5 * WIDTHFIT);
        make.bottom.equalTo(0);
    }];
}
- (void)didValuationButton:(UIButton *)sender
{
    for (UIViewController * controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[RecyclingViewController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}
- (void)didRecyclingButton:(UIButton *)sender
{
    OrderViewController * ordVC = [[OrderViewController alloc] init];
    [self.navigationController pushViewController:ordVC animated:YES];
}
- (void)didBackPushVC:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
