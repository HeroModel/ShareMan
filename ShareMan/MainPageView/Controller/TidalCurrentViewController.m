//
//  TidalCurrentViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "TidalCurrentViewController.h"
#import "PlutoCyclicCardLayout.h"
#import "ImageCollectionViewCell.h"
#import "DownCollectionViewCell.h"
#import "DetailsPageViewController.h"//商品详情页
#import "ShareModel.h"
@interface TidalCurrentViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout
>

/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * bigCollectionView;
/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *dataArray;
/** <#注释#> */
@property(nonatomic, strong) NSArray * dataSource;
/** <#注释#> */
@property(nonatomic, assign) NSInteger currentIndex;
/** <#注释#> */
@property(nonatomic, assign) NSInteger downCurrentIndex;

@end
static NSString * const ImageCell = @"ImageCollectionViewCell";
static NSString * const DownCell = @"DownCollectionViewCell";
@implementation TidalCurrentViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    switch (_series) {
        case 1:
            self.navigationItem.title = @"经济实惠";
            break;
        case 2:
            self.navigationItem.title = @"个性潮流";
            break;
        case 3:
            self.navigationItem.title = @"特惠活动";
            break;
        default:
            break;
    }
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    
    [self upDataseriesWith:_series];
    [self createCollectionView];
}
- (void)createCollectionView
{
    PlutoCyclicCardLayout *layout = [[PlutoCyclicCardLayout alloc] init];
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 60 * HEIGHTFIT, SCREEN_WIDTH, 247 * HEIGHTFIT) collectionViewLayout:layout];
    self.collectionView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[ImageCollectionViewCell class] forCellWithReuseIdentifier:ImageCell];
    [self.view addSubview:self.collectionView];
    
    
    
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    
    self.bigCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
    self.bigCollectionView.backgroundColor = [UIColor clearColor];
    self.bigCollectionView.showsHorizontalScrollIndicator = NO;
    self.bigCollectionView.bounces = NO;
    self.bigCollectionView.pagingEnabled = YES;
    self.bigCollectionView.delegate = self;
    self.bigCollectionView.dataSource = self;
    [self.view addSubview:_bigCollectionView];
    [self.bigCollectionView registerClass:[DownCollectionViewCell class] forCellWithReuseIdentifier:DownCell];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
//    if (collectionView == self.collectionView) {
//
//        return self.dataArray.count;
//    }
//    else
//    {
        return self.dataArray.count;
//    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShareModel * model = _dataArray[indexPath.item];
    if (collectionView == self.collectionView) {
        
        ImageCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCell forIndexPath:indexPath];
//        cell.model = model;
        [cell.phoneImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.top_show]] placeholderImage:PLACEHOLDER];
        return cell;
    }
    
    DownCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:DownCell forIndexPath:indexPath];
//    cell.model = model;
    [cell.phoneImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.bot_show]] placeholderImage:PLACEHOLDER];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShareModel * model = _dataArray[indexPath.item];
    if (collectionView == self.bigCollectionView) {
        DetailsPageViewController * detaVC = [[DetailsPageViewController alloc] init];
        detaVC.version = model.version;
        [self.navigationController pushViewController:detaVC animated:YES];
    }else{
        return;
    }
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger page = self.bigCollectionView.contentOffset.x / SCREEN_WIDTH;
    
    [self.collectionView setContentOffset:CGPointMake(207 * WIDTHFIT * page, 0) animated:NO];
    
}
//- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    //因为offset不是对象不能用点访问
//    CGFloat contentX = targetContentOffset->x;
//
//    /*round：如果参数是小数，则求本身的四舍五入。
//     ceil：如果参数是小数，则求最小的整数但不小于本身.
//     floor：如果参数是小数，则求最大的整数但不大于本身.
//
//     Example:如何值是3.4的话，则
//     3.4 -- round 3.000000
//     -- ceil 4.000000
//     -- floor 3.00000
//     **/
//
//    //用四色五入 计算第几页
//    float pageFloat = contentX/SCREEN_WIDTH;
//
//    NSInteger page = (int)round(pageFloat);
//
//    targetContentOffset->x = page * 210 * WIDTHFIT;
//
//    //记录当前页面 此处要提醒一句  这个值必须要用系统生成的setter语句来赋值才能kvo监听 _currentIndex = page是不能够监听到的
//    self.currentIndex = page;
//    [self.collectionView setContentOffset:CGPointMake(210 * WIDTHFIT * _currentIndex, 0) animated:NO];
//}
- (void)upDataseriesWith:(int)series
{
    self.dataArray = [NSMutableArray new];
    NSString * string = [NSString stringWithFormat:@"type=%d", series];
    [NetTools POSTNetWithUrl:PROMOTION body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                ShareModel * model = [[ShareModel alloc] initWithDic:dic];
                [self.dataArray addObject:model];
            }
            [self.collectionView reloadData];
            [self.bigCollectionView reloadData];
        }
        else{
            return ;
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
    
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
