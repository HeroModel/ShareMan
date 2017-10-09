//
//  MainViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "MainViewController.h"
#import "TabBarView.h"
#import "RecyclingViewController.h"
#import "SharedViewController.h"
#import "MaintainViewController.h"
#import "MessageView.h"
#import "ViewController.h"//空白页
#import "REFrostedViewController.h"
#import "DistriCollectionViewCell.h"
#import "HeaderView.h"
#import "DetailsPageViewController.h"//商品详情页
#import "MainLoginViewController.h"//登录页
#import "TidalCurrentViewController.h"
#import "RightMessageViewController.h"//右侧消息
#import "IDPersonallModel.h"
#import "ContextModel.h"

@interface MainViewController ()
<
TabBarViewDelegate,
SDCycleScrollViewDelegate,
UICollectionViewDelegate,
UICollectionViewDataSource,
HeaderViewDelegate
>
//MessageViewDelegate,
/** <#注释#> */
@property(nonatomic, strong) TabBarView * tabView;
/** 轮播图数组 */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * arr;
/** <#注释#> */
@property(nonatomic, strong) MessageView * messView;
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray<IDPersonallModel *> * dataSource;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * dataArray;
@end

static NSString * const DistriCell = @"DistriCollectionViewCell";
@implementation MainViewController
- (NSMutableArray *)dataArray
{
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    self.navigationItem.title = @"汇享侠";
    
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName: UIColorFromRGB(GLOBAL_TITLE_COLOR),
                                                                    NSFontAttributeName: REG_TITLE_FONT
                                                                    };
    NSMutableArray *vcs = [self.navigationController.viewControllers mutableCopy];
    [vcs removeAllObjects];
    
    [self.tabView setHidden:NO];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftBarButton:)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem * rightButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-news"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didRightBarButton:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createCollectionView];
    [self createTabBarView];
    [self slideshowPhoto];
    [self getaDataSpot];
    
}
- (void)createCollectionView
{
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, 160);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 49) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.bouncesZoom = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
#ifdef __IPHONE_11_0
    if ([_collectionView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:_collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"DistriCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:DistriCell];
    [self.collectionView registerClass:[HeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ContextModel * model = _dataArray[indexPath.item];
    DistriCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:DistriCell forIndexPath:indexPath];
    cell.model = model;
    return cell;
}
#pragma mark --- 返回头视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    HeaderView * heaView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    heaView.array = _array;
    heaView.delegate = self;
    return heaView;
}
- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
referenceSizeForHeaderInSection:(NSInteger)section
{
    CGSize size = CGSizeMake(SCREEN_WIDTH * WIDTHFIT, 341 * HEIGHTFIT);
    return size;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ContextModel * model = _dataArray[indexPath.item];
    DetailsPageViewController * vc = [[DetailsPageViewController alloc] init];
    vc.version = model.version;
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)createTabBarView
{
    self.tabView = [[TabBarView alloc] initWithTabBarViewFrame:CGRectMake(0, SCREEN_HEIGHT - 64 - 49, SCREEN_WIDTH * WIDTHFIT, 49 * HEIGHTFIT)];
    self.tabView.userInteractionEnabled = YES;
    self.tabView.delegate = self;
    [self.view addSubview:_tabView];
}
- (void)didRecyclingButton
{
    RecyclingViewController * recVC = [[RecyclingViewController alloc] init];
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:recVC animated:YES];
    
}
- (void)didSharedButton
{
    SharedViewController * sharVC = [[SharedViewController alloc] init];
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:sharVC animated:YES];
}
- (void)didMaintainButton
{
    MaintainViewController * mainVC = [[MaintainViewController alloc] init];
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:mainVC animated:YES];
}
- (void)didLeftImage
{
    TidalCurrentViewController * vc = [[TidalCurrentViewController alloc] init];
    vc.series = (long)1;
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didCenterImage
{
    TidalCurrentViewController * vc = [[TidalCurrentViewController alloc] init];
    vc.series = (long)2;
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didRightImage
{
    TidalCurrentViewController * vc = [[TidalCurrentViewController alloc] init];
    vc.series = (long)3;
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didLeftBarButton:(UIBarButtonItem *)sender
{
    [self.view endEditing:YES];
    [self.frostedViewController.view endEditing:YES];
    [self.frostedViewController presentMenuViewController];

}
#pragma mark -- 点击轮播图进行跳转nss
- (void)didImageIndex:(NSInteger)version
{
    DetailsPageViewController * vc = [[DetailsPageViewController alloc] init];
    vc.version = _dataSource[version].version;
    [self.tabView setHidden:YES];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void)didRightBarButton:(UIBarButtonItem *)sender
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    if (phone && [phone length] != 0 && token && [token length] != 0) {
        RightMessageViewController * rightVC = [[RightMessageViewController alloc] init];
        [self.tabView setHidden:YES];
        [self.navigationController pushViewController:rightVC animated:YES];
    }else{
        
        MainLoginViewController * loginVC = [[MainLoginViewController alloc] init];
        [self.tabView setHidden:YES];
        [self.navigationController pushViewController:loginVC animated:NO];
    }
}
- (void)slideshowPhoto
{
    [NetTools POSTNetWithUrl:PHOTOIMAGE body:nil bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                IDPersonallModel * model = [[IDPersonallModel alloc] initWithDic:dic];
                NSString * string = [URL stringByAppendingString:model.carousel];
                [self.array addObject: string];
                [self.dataSource addObject:model];
            }
            [self.collectionView reloadData];
        }else{
            return ;
        }
        
    } failure:^(NSError *error) {
        
    }];
}
- (void)getaDataSpot
{
    [NetTools POSTNetWithUrl:SPOT body:nil bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                ContextModel * model = [[ContextModel alloc] initWithDic:dic];
                [self.dataArray addObject:model];
            }
            [self.collectionView reloadData];
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
