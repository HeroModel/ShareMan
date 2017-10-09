//
//  VouchersViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/17.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "VouchersViewController.h"
#import "VouchersTableViewCell.h"

@interface VouchersViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end

static NSString * const VouchersCell = @"VouchersTableViewCell";
static NSString * const BackImageCell = @"BackImageTableViewCell";
@implementation VouchersViewController

- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"代金券";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"return_p"] highImage:[UIImage imageNamed:@"return_p"] target:(GlobalNavigationController *)self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    [self createTableView];
    [self getDataVoucher];
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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
    [self.tableView registerClass:[VouchersTableViewCell class] forCellReuseIdentifier:VouchersCell];
    [self.tableView registerClass:[BackImageTableViewCell class] forCellReuseIdentifier:BackImageCell];//没数据显示界面
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.array.count == 0) {
        return 1;
    }else{
        
        return self.array.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.array.count == 0) {
        BackImageTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:BackImageCell];
        cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
        return cell;
    }else{
        ContextModel * model = _array[indexPath.row];
        VouchersTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:VouchersCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        cell.model = model;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.array.count == 0) {
        return SCREEN_HEIGHT;
    }else{
        
        return 169 * HEIGHTFIT;
    }
}
- (void)getDataVoucher
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", phone, token];
    [NetTools POSTNetWithUrl:TICKET body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                ContextModel * model = [[ContextModel alloc] initWithDic:dic];
                [self.array addObject:model];
            }
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
