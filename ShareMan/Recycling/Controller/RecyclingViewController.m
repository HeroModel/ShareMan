//
//  RecyclingViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "RecyclingViewController.h"
#import "StorageViewController.h"
#import "ProductsTableViewCell.h"
#import "PhoneNameTableViewCell.h"

@interface RecyclingViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
/** <#注释#> */
@property(nonatomic, strong) UITableView * leftTableView;
/** <#注释#> */
@property(nonatomic, strong) UITableView * rightTableView;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
@end
static NSString * const ProductsCell = @"ProductsTableViewCell";
static NSString * const PhoneNameCell = @"PhoneNameTableViewCell";
@implementation RecyclingViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"选择机型";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackVC:)];
    self.navigationItem.leftBarButtonItem = left;
    
    self.array = @[@"iPhone", @"oppo", @"vivo", @"华为"];
    self.array1 = @[@"iPhone 7 Plus", @"iPhone 7", @"iPhone 6 Plus", @"iPhone 6s", @"iPhone 6"];
    
    
    UIImageView * image = [[UIImageView alloc] init];
    image.image = [UIImage imageNamed:@"bg-kaitong"];
    [self.view addSubview:image];
    [image makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(0);
        make.height.equalTo(280 * HEIGHTFIT);
    }];
    
    
    
//    [self createView];
//    NSIndexPath *indexpa = [NSIndexPath indexPathForItem:0 inSection:0];
//    [self.leftTableView selectRowAtIndexPath:indexpa animated:YES scrollPosition:UITableViewScrollPositionNone];
//    [self tableView:self.leftTableView didSelectRowAtIndexPath:indexpa];
    
}
- (void)createView
{
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(15 * WIDTHFIT, 20 * HEIGHTFIT, 345 * WIDTHFIT, 563 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [self.view.layer addSublayer:layer];
    
    
    self.rightTableView = [[UITableView alloc] init];//WithFrame:CGRectMake((15 + self.leftTableView.frame.size.width) * WIDTHFIT, 20 * HEIGHTFIT, 243 * WIDTHFIT, 563 * HEIGHTFIT)];
    self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.rightTableView.showsVerticalScrollIndicator = NO;
    self.rightTableView.showsHorizontalScrollIndicator = NO;
    self.rightTableView.bounces = NO;
    self.rightTableView.layer.masksToBounds = YES;
    self.rightTableView.layer.cornerRadius = 10;
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    [self.view addSubview:_rightTableView];
    //    UIBezierPath * maskPath1 = [UIBezierPath bezierPathWithRoundedRect:self.rightTableView.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    //    CAShapeLayer *maskLayer1 = [[CAShapeLayer alloc] init];
    //    maskLayer1.frame = self.rightTableView.bounds;
    //    maskLayer1.path = maskPath1.CGPath;
    //    self.rightTableView.layer.mask = maskLayer1;
    [_rightTableView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(self.view).offset(110 * WIDTHFIT);
        make.right.equalTo(-15 * WIDTHFIT);
        make.height.equalTo(563 * HEIGHTFIT);
    }];
    
    
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(15 * WIDTHFIT, 20 * HEIGHTFIT, 102 * WIDTHFIT, 563 * HEIGHTFIT)];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.leftTableView.showsVerticalScrollIndicator = NO;
    self.leftTableView.showsHorizontalScrollIndicator = NO;
    self.leftTableView.backgroundColor = UIColorFromRGB(GLOBAL_NAME_COLOR);
    self.leftTableView.bounces = NO;
//    self.leftTableView.layer.masksToBounds = YES;
//    self.leftTableView.layer.cornerRadius = 10;
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    [self.view addSubview:_leftTableView];
    UIBezierPath * maskPath = [UIBezierPath bezierPathWithRoundedRect:self.leftTableView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomLeft cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.leftTableView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.leftTableView.layer.mask = maskLayer;
//    [_leftTableView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(20 * HEIGHTFIT);
//        make.left.equalTo(15 * WIDTHFIT);
//        make.size.equalTo(CGSizeMake(102 * WIDTHFIT, 563 * HEIGHTFIT));
//    }];
    
   
    
    [self.leftTableView registerClass:[ProductsTableViewCell class] forCellReuseIdentifier:ProductsCell];
    [self.rightTableView registerClass:[PhoneNameTableViewCell class] forCellReuseIdentifier:PhoneNameCell];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.leftTableView == tableView) {
        return self.array.count;
    }else{
        return self.array1.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.leftTableView == tableView) {
        ProductsTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ProductsCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = UIColorFromRGB(GLOBAL_NAME_COLOR);
        cell.leftLabel.text = _array[indexPath.row];
        return cell;
    }
    else{
        PhoneNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:PhoneNameCell];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.namePhone.text = _array1[indexPath.row];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.leftTableView == tableView) {
        ProductsTableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
//        UIImageView * images = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 102, 75)];
//        images.image = [UIImage imageNamed:@"bg-black-radius"];
//        images.contentMode = UIViewContentModeScaleAspectFill;
//        cell.backgroundView = images;
        cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
        cell.isSeleted = YES;

    }else{
        
        StorageViewController * valuaVC = [[StorageViewController alloc] init];
        [self.navigationController pushViewController:valuaVC animated:YES];
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.leftTableView == tableView) {
        
        ProductsTableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
        cell.backgroundColor = UIColorFromRGB(GLOBAL_NAME_COLOR);
//        cell.backgroundView = nil;
        cell.isSeleted = NO;
    }
    
}
- (void)didBackVC:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
