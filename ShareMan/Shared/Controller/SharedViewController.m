//
//  SharedViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SharedViewController.h"
#import "ShareTableViewCell.h"
#import "ProductListViewController.h"

@interface SharedViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end
static NSString * const ShareCell = @"ShareTableViewCell";
@implementation SharedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    self.navigationItem.title = @"共享分类";
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    
    UIImage * image = [UIImage imageNamed:@"class-iphone"];
    UIImage * image2 = [UIImage imageNamed:@"class-oppo"];
    UIImage * image3 = [UIImage imageNamed:@"class-huawei"];
    UIImage * image1 = [UIImage imageNamed:@"class-vivo"];
    self.array = [NSMutableArray arrayWithObjects:image, image2, image1, image3, nil];
    
    [self createtable];
}
- (void)createtable
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = 190 * HEIGHTFIT;
    tableView.delegate = self;
    tableView.dataSource = self;
    if ([tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    [self.view addSubview:tableView];
    [tableView registerClass:[ShareTableViewCell class] forCellReuseIdentifier:ShareCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShareTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ShareCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    cell.imageShare.image = _array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ProductListViewController * proVC = [[ProductListViewController alloc] init];
    switch (indexPath.row) {
        case 0:
            proVC.series = (int)indexPath.row + 1;
            break;
        case 1:
            proVC.series = (int)indexPath.row + 1;
            break;
        case 2:
            proVC.series = (int)indexPath.row + 1;
            break;
        case 3:
            proVC.series = (int)indexPath.row + 1;
            break;
        default:
            break;
    }
    [self.navigationController pushViewController:proVC animated:YES];
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
