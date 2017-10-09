//
//  ShareIndentViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareIndentViewController.h"
#import "ApplyCollectionViewCell.h"
#import "ShareingCollectionViewCell.h"
#import "FinshedCollectionViewCell.h"
#import "ShareViewController.h"
#import "OrderModel.h"

@interface ShareIndentViewController ()
<
UICollectionViewDataSource,
UICollectionViewDelegate,
ApplyCollectionViewCellDelegate,
ShareingCollectionViewCellDelegate,
FinshedCollectionViewCellDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) UIButton * tempButton;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * backImage;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * dataArray;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * dataArray1;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * dataArray2;
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * token;
@end
static NSString * const ApplyCell = @"ApplyCollectionViewCell";
static NSString * const ShareingCell = @"ShareingCollectionViewCell";
static NSString * const FinshedCell = @"FinshedCollectionViewCell";
@implementation ShareIndentViewController
{
    LicensesView *licView;
}
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (NSMutableArray *)dataArray1
{
    if (_dataArray1 == nil) {
        _dataArray1 = [NSMutableArray array];
    }
    return _dataArray1;
}
- (NSMutableArray *)dataArray2
{
    if (_dataArray2 == nil) {
        _dataArray2 = [NSMutableArray array];
    }
    return _dataArray2;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"共享订单";
    self.phone = PHONE_TESTING;
    self.token = TOKEN_TESTING;
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackPopVC:)];
    self.navigationItem.leftBarButtonItem = left;
    [self createCollectionView];
    [self createView];
    [self upDateWithPhoneNumber:_phone WithToken:_token WithStatus:@"0"];

}
- (void)createCollectionView
{
    
    UIImageView * image9 = [[UIImageView alloc] initWithFrame:CGRectMake(6 * WIDTHFIT, 511.5 * HEIGHTFIT, (SCREEN_WIDTH - 12) * WIDTHFIT, 7.5 * HEIGHTFIT)];
    image9.image = [UIImage imageNamed:@"bg-under"];
    [self.view addSubview:image9];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - 64);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[ApplyCollectionViewCell class] forCellWithReuseIdentifier:ApplyCell];
    [self.collectionView registerClass:[ShareingCollectionViewCell class] forCellWithReuseIdentifier:ShareingCell];
    [self.collectionView registerClass:[FinshedCollectionViewCell class] forCellWithReuseIdentifier:FinshedCell];
    
    licView = [[LicensesView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0:
        {
            ApplyCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ApplyCell forIndexPath:indexPath];
            cell.array = self.dataArray;
            cell.delegate = self;
            return cell;
        }
            break;
        case 1:
        {
            ShareingCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ShareingCell forIndexPath:indexPath];
            cell.array = self.dataArray1;
            cell.delegate = self;
            return cell;
        }
            break;
        case 2:
        {
            FinshedCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:FinshedCell forIndexPath:indexPath];
            cell.array = self.dataArray2;
            cell.delegate = self;
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)createView
{
    self.backImage = [[UIImageView alloc] initWithFrame:CGRectMake(6 * WIDTHFIT, 406.5 * HEIGHTFIT, SCREEN_WIDTH - 12, 105 * HEIGHTFIT)];
    self.backImage.image = [UIImage imageNamed:@"bg-blue"];
    self.backImage.userInteractionEnabled = YES;
    [self.view addSubview:_backImage];
    
    float X = 26 * WIDTHFIT;
    float Y = 11 * HEIGHTFIT;
    float S = 32 * WIDTHFIT;
    float W = 83 * WIDTHFIT;
    float H = 83 * HEIGHTFIT;
    
    UIImage * image = [[UIImage imageNamed:@"icon_shenqing_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image1 = [[UIImage imageNamed:@"icon_gongxiang_nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image2 = [[UIImage imageNamed:@"icon-quxiao-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.array = @[image, image1, image2];
    
    UIImage * image3 = [[UIImage imageNamed:@"icon_shenqing_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image4 = [[UIImage imageNamed:@"icon_gongxiang_sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image5 = [[UIImage imageNamed:@"icon-quxiao-sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.array1 = @[image3, image4, image5];
    
    
    
    for (int i = 0; i < 3; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.backgroundColor = [UIColor clearColor];
        [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
        [button setImage:_array[i] forState:UIControlStateNormal];
        [button setImage:_array1[i] forState:UIControlStateSelected];
        button.frame = CGRectMake(X + i * W + S * i, Y, W, H);
        button.tag = 1000 + i;
        [button addTarget:self action:@selector(didButtonSelede:) forControlEvents:UIControlEventTouchUpInside];
        [_backImage addSubview:button];
        if (i == 0) {
            button.selected = YES;
            self.tempButton = button;
        }
    }
    
}
- (void)didButtonSelede:(UIButton *)but
{
    
    NSInteger index = but.tag - 1000;
    switch (index) {
        case 0:
        {
            [self upDateWithPhoneNumber:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        case 1:
        {
            [self upDateWithPhone1Number:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        case 2:
        {
            [self upDateWithPhone2Number:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        default:
            break;
    }
    [self.collectionView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:NO];
    
    self.tempButton.selected = !self.tempButton.selected;
    but.selected = !but.selected;
    self.tempButton = but;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH_FRAME;
    switch (index) {
        case 0:
        {
            [self upDateWithPhoneNumber:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        case 1:
        {
            [self upDateWithPhone1Number:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        case 2:
        {
            [self upDateWithPhone2Number:_phone WithToken:_token WithStatus:[NSString stringWithFormat:@"%ld", (long)index]];
        }
            break;
        default:
            break;
    }

    UIButton *bt = [_backImage viewWithTag:index + 1000];
    self.tempButton.selected = !self.tempButton.selected;
    bt.selected = !bt.selected;
    self.tempButton = bt;
}

- (void)didBUttonPushPlayVC:(NSString *)order_id
{
    ShareViewController * shareVC = [[ShareViewController alloc] init];
    shareVC.orderId = order_id;
    [self.navigationController pushViewController:shareVC animated:YES];
}
//取消订单
- (void)didBUttonPushDismissVC:(NSString *)order_id
{
    [self dismissID:order_id];
}
//删除订单
- (void)delegeDismissOrder:(NSString *)order_id
{
    [self deleteOrder:order_id];
}
- (void)upDateWithPhoneNumber:(NSString *)phoneNumber WithToken:(NSString *)token WithStatus:(NSString *)status
{
    NSString *string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&status=%@", phoneNumber, token, status];
    [NetTools POSTNetWithUrl:DINGDAN body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"1===%@", result);
        [self.dataArray removeAllObjects];
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                OrderModel * model = [[OrderModel alloc] initWithDic:dic];
                [self.dataArray addObject:model];
            }
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)upDateWithPhone1Number:(NSString *)phoneNumber WithToken:(NSString *)token WithStatus:(NSString *)status
{
    NSString *string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&status=%@", phoneNumber, token, status];
    [NetTools POSTNetWithUrl:DINGDAN body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"2===%@", result);
        [self.dataArray1 removeAllObjects];
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                OrderModel * model = [[OrderModel alloc] initWithDic:dic];
                [self.dataArray1 addObject:model];
            }
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)upDateWithPhone2Number:(NSString *)phoneNumber WithToken:(NSString *)token WithStatus:(NSString *)status
{
    NSString *string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&status=%@", phoneNumber, token, status];
    [NetTools POSTNetWithUrl:DINGDAN body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"3===%@", result);
        [self.dataArray2 removeAllObjects];
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                OrderModel * model = [[OrderModel alloc] initWithDic:dic];
                [self.dataArray2 addObject:model];
            }
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
       [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)dismissID:(NSString *)orderId
{
    NSString * orderID = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@", _phone, _token, orderId];
    [NetTools POSTNetWithUrl:ORDERDISMISS body:orderID bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"取消成功" WithTimer:1 WithView:self.view];
            [self upDateWithPhoneNumber:_phone WithToken:_token WithStatus:@"0"];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"取消失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)deleteOrder:(NSString *)orderId
{
    NSString * orderID = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&orderId=%@", _phone, _token, orderId];
    [NetTools POSTNetWithUrl:DELETEORDER body:orderID bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"删除成功" WithTimer:1 WithView:self.view];
            [self upDateWithPhone2Number:_phone WithToken:_token WithStatus:@"2"];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"删除失败" WithTimer:1 WithView:self.view];
    }];
}
//产看电子协议
- (void)orderid:(NSString *)order_id
{
    licView.phone = _phone;
    licView.token = _token;
    licView.orderId = order_id;
    [licView showView];
}
- (void)didBackPopVC:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
