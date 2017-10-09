//
//  ScreenViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ScreenViewController.h"
#import "Select_YouHu_TableViewCell.h"
#import "RepairViewController.h"

@interface ScreenViewController ()<UITableViewDataSource, UITableViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
@end
static NSString * const Select_YouHuCell = @"Select_YouHu_TableViewCell";
@implementation ScreenViewController
{
    NSInteger index;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"屏幕外观";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackVC:)];
    self.navigationItem.leftBarButtonItem = left;
    self.array = PINGMU;
    [self createTable];
}
- (void)createTable
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.rowHeight = 64;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[Select_YouHu_TableViewCell class] forCellReuseIdentifier:Select_YouHuCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Select_YouHu_TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Select_YouHuCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.strLabel.text = _array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    Select_YouHu_TableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    cell.isSelect = YES;
    RepairViewController * sehVC = [[RepairViewController alloc] init];
    [self.navigationController pushViewController:sehVC animated:YES];
//    [NSTimer scheduledTimerWithTimeInterval:0.75 target:self selector:@selector(pushRepairVC) userInfo:nil repeats:NO];
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Select_YouHu_TableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0]];
    cell.isSelect = NO;
}
- (void)pushRepairVC
{
    RepairViewController * sehVC = [[RepairViewController alloc] init];
    [self.navigationController pushViewController:sehVC animated:YES];
}
- (void)didBackVC:(UIBarButtonItem *)sender
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
