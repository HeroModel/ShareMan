//
//  SignPayViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/24.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SignPayViewController.h"
#import "PaymentTableViewCell.h"
#import "PayTableViewCell.h"
#import "TreatmentViewController.h"
#import "ShareParticularsViewController.h"
#import "GlobalNavigationController.h"
#import "REFrostedViewController.h"

@interface SignPayViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
TreatmentViewControllerDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * arr;
/** <#注释#> */
@property(nonatomic, assign) NSInteger indexPathRow;
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * token;
/** <#注释#> */
@property(nonatomic, copy) NSString * totalPrice;
/**  */
@property(nonatomic, copy) NSString * count;
/** <#注释#> */
@property(nonatomic, copy) NSString * amount;
/** <#注释#> */
@property(nonatomic, copy) NSString * newsTotalPrice;
/** <#注释#> */
@property(nonatomic, copy) NSString * notifcationName;
/** 订单ID */
@property(nonatomic, copy) NSString * voucherId;
@end
static NSString * const PaymentCell = @"PaymentTableViewCell";
static NSString * const PayCell = @"PayTableViewCell";
static NSString * const appScheme = @"com.youhu.net.ShareMan";
@implementation SignPayViewController
- (void)dealloc
{
    [Notification removeObserver:self name:FICAtion object:nil];
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath *indexpa = [NSIndexPath indexPathForItem:0 inSection:1];
    [self.tableView selectRowAtIndexPath:indexpa animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexpa];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"签约支付";
    self.phone = PHONE_TESTING;
    self.token = TOKEN_TESTING;
    self.voucherId = @"-1";
    UIBarButtonItem * left = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"nav-icon-Return"] highImage:[UIImage imageNamed:@"nav-icon-Return"] target:self action:@selector(didiBack:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = left;
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    
    [self payTableView];
    [self createButton];
    [self selectPay:_orderId];
    
    NSIndexPath *indexpa = [NSIndexPath indexPathForItem:0 inSection:1];
    [self.tableView selectRowAtIndexPath:indexpa animated:YES scrollPosition:UITableViewScrollPositionNone];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexpa];
    
}
- (void)payTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)style:UITableViewStylePlain];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.bounces = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
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
    [_tableView registerClass:[PaymentTableViewCell class] forCellReuseIdentifier:PaymentCell];
    [_tableView registerClass:[PayTableViewCell class] forCellReuseIdentifier:PayCell];
    
    
}
- (void)createButton
{
    UIButton * button = [UIButton itemButtonWithType:UIButtonTypeCustom WithString:@"付款" target:self action:@selector(selectButton:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(-5);
        make.right.equalTo(5);
        make.bottom.equalTo(0);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        
        PaymentTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:PaymentCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if (self.newsTotalPrice == nil) {
            cell.mLabel.text = [NSString stringWithFormat:@"¥ %@", _totalPrice];
        }else{
            cell.mLabel.text = [NSString stringWithFormat:@"¥ %@", _newsTotalPrice];
        }
        if (self.amount == nil) {
            cell.strLabel.text = @"请选择使用优惠券";
        }else{
            cell.strLabel.text = [NSString stringWithFormat:@"-%@", _amount];
        }
        return cell;
    }else{
        PayTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:PayCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            return 65 * HEIGHTFIT;
            break;
        case 1:
            return 60 * HEIGHTFIT;
            break;
        default:
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TreatmentViewController * vouVC = [[TreatmentViewController alloc] init];
        vouVC.delegate = self;
        vouVC.orderId = _orderId;
        [self.navigationController pushViewController:vouVC animated:YES];
    }else{
        self.indexPathRow = indexPath.row;
        PayTableViewCell * cell = (PayTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:1]];
        cell.isSelected = YES;
    }
}
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 1) {
//        PayTableViewCell * cell = (PayTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:1]];
//        cell.isSelected = NO;
//    }else{
//        return;
//    }
//}
- (void)selectButton:(UIButton *)button
{
//    switch (self.indexPathRow) {
//        case 0:
//            [self upData];
//            break;
//        case 1:
//            NSLog(@"微信");
//            break;
//        default:
//            break;
//    }
    
    [self upDataWithOrderId:_orderId];
}
- (void)selectPay:(NSString *)orderId
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@", _phone, _token, orderId];
    [NetTools POSTNetWithUrl:PAYWAY body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            self.totalPrice = result[@"data"][@"totalPrice"];
            [self.tableView reloadData];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
}
- (void)passAmount:(NSString *)amount
        totalPrice:(NSString *)totalPrice
{
    self.amount = amount;
    self.newsTotalPrice = totalPrice;
    [self.tableView reloadData];
}
- (void)orderID:(NSString *)orderID
{
    self.voucherId = orderID;
    [self.tableView reloadData];
}
- (void)upDataWithOrderId:(NSString *)orderId
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@&voucherId=%@", _phone, _token, orderId, _voucherId];
    [NetTools POSTNetWithUrl:Pay body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"支付宝成功==%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            NSString * string = result[@"data"];
            [[AlipaySDK defaultService] payOrder:string fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            NSLog(@"支付宝===%@", resultDic);
                [self noticeAlert:[resultDic[@"resultStatus"] integerValue]];
//                [Notification addObserver:self selector:@selector(noticeAlert:) name:FICAtion object:nil];
            }];
        }

    } failure:^(NSError *error) {
//        NSLog(@"支付宝失败==%@", error);
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
        
    }];
}
- (void)noticeAlert:(NSInteger)count
{
    switch (count) {
        case 9000:
        {
            self.notifcationName = @"交易成功";
        }
            break;
        case 6002:
        {
            self.notifcationName = @"网络连接出错";
        }
            break;
        case 5000:
        {
            self.notifcationName = @"重复请求";
        }
            break;
        case 4000:
        {
            self.notifcationName = @"交易失败";
        }
            break;
            case 6001:
        {
            self.notifcationName = @"订单取消";
            
        }
            break;
        default:
            break;
    }
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:_notifcationName message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ShareParticularsViewController * vouVC = [[ShareParticularsViewController alloc] init];
        GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:vouVC];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    }];
    [alert addAction:dismiss];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)didiBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
