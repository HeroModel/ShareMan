//
//  RecyclingOrderViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/26.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RecyclingOrderViewController.h"
#import "CancelCollectionViewCell.h"
#import "ContextCollectionViewCell.h"
#import "ContextCompleCollectionViewCell.h"
#import "ContextCanaelCollectionViewCell.h"

#import "OrderAlertView.h"

@interface RecyclingOrderViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
ContextCollectionViewCellDelegate,
OrderAlertViewDelegate
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
@end
static NSString * const ContextCell = @"ContextCollectionViewCell";
static NSString * const ContextCompleCell = @"ContextCompleCollectionViewCell";
static NSString * const ContextCanaelCell = @"ContextCanaelCollectionViewCell";
@implementation RecyclingOrderViewController
{
    OrderAlertView * order;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"回收订单";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"return_p"] highImage:[UIImage imageNamed:@"return_p"] target:(GlobalNavigationController *)self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
//    [self createCollectionView];
//    [self createView];
    
    UIImageView * image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"bg-kaitong"];
    [self.view addSubview:image];
    [image makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(0);
        make.height.equalTo(280 * HEIGHTFIT);
    }];
    
    
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
    [self.collectionView registerClass:[ContextCollectionViewCell class] forCellWithReuseIdentifier:ContextCell];
    [self.collectionView registerClass:[ContextCompleCollectionViewCell class] forCellWithReuseIdentifier:ContextCompleCell];
    [self.collectionView registerClass:[ContextCanaelCollectionViewCell class] forCellWithReuseIdentifier:ContextCanaelCell];
    
    order = [[OrderAlertView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 0)];
    order.delegate = self;
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
            ContextCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ContextCell forIndexPath:indexPath];
            cell.delegate = self;
            return cell;
            
        }
            break;
        case 1:
        {
            ContextCompleCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ContextCompleCell forIndexPath:indexPath];
            return cell;
        }
            break;
        case 2:
        {
            ContextCanaelCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:ContextCanaelCell forIndexPath:indexPath];
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
    
    UIImage * image = [[UIImage imageNamed:@"icon-huishou-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image1 = [[UIImage imageNamed:@"icon-finish-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image2 = [[UIImage imageNamed:@"icon-quxiao-nor"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    self.array = @[image, image1, image2];
    
    UIImage * image3 = [[UIImage imageNamed:@"icon-huishou-sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage * image4 = [[UIImage imageNamed:@"icon-finish-sel"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
            [self didButtonSelede:button];
        }
    }
    
}
- (void)didButtonSelede:(UIButton *)but
{
    [self setImageButton:but];
    NSInteger index = but.tag - 1000;
    [self.collectionView setContentOffset:CGPointMake(SCREEN_WIDTH * index, 0) animated:NO];
    

}
- (void)setImageButton:(UIButton *)button
{
    NSInteger index = button.tag - 1000;
    
    [self.tempButton setImage:_array[index] forState:UIControlStateNormal];

    [button setImage:_array1[index] forState:UIControlStateNormal];

    self.tempButton = button;
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger index = scrollView.contentOffset.x / SCREEN_WIDTH_FRAME;
    UIButton *bt = [_backImage viewWithTag:index + 1000];
    [self setImageButton:bt];
}
- (void)didButtonAlertView
{
    [[[[UIApplication sharedApplication] delegate] window] addSubview:order];
    [UIView animateWithDuration:0.35 animations:^{
        order.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }];
}
- (void)didDismissView
{
    [self didButtonView];
}
- (void)didConfirmButton
{
    [self didButtonView];
}
#pragma mark -- 视图消失
- (void)didButtonView
{
    [UIView animateWithDuration: 0.35 animations: ^{
        order.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    } completion: nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
