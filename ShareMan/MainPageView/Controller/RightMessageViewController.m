//
//  RightMessageViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RightMessageViewController.h"
#import "RightMessageTableViewCell.h"
#import "RightVoucherViewController.h"
#import "ContextModel.h"

@interface RightMessageViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end
static NSString * const RightCell = @"RightMessageTableViewCell";
@implementation RightMessageViewController
- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"消 息";
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    [self createTableView];
    [self getData];
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 170 * HEIGHTFIT;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
#ifdef __IPHONE_11_0
    if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[RightMessageTableViewCell class] forCellReuseIdentifier:RightCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ContextModel * model = _array[indexPath.row];
    RightMessageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RightCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    cell.model = model;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    RightVoucherViewController * treVC = [[RightVoucherViewController alloc] init];
    [self.navigationController pushViewController:treVC animated:YES];
}
- (void)getData
{
    [NetTools POSTNetWithUrl:MESSAGE body:nil bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                ContextModel * model = [[ContextModel alloc] initWithDic:dic];
                [self.array addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
