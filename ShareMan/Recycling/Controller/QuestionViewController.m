//
//  QuestionViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/4.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "QuestionViewController.h"
#import "ValuationRecyclingViewController.h"
#import "ManySelectTableViewCell.h"

@interface QuestionViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * selecCells;
@end
static NSString * const ManySelectCell = @"ManySelectTableViewCell";
@implementation QuestionViewController
{
    NSInteger index;
}
- (NSMutableArray *)selecCells
{
    if (_selecCells == nil) {
        _selecCells = [NSMutableArray array];
    }
    return _selecCells;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"其他问题(多选)";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackVC:)];
    self.navigationItem.leftBarButtonItem = left;
    self.array = WENTI;
    [self createTable];
    [self createButton];
}
- (void)createTable
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 45) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.rowHeight = 64;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[ManySelectTableViewCell class] forCellReuseIdentifier:ManySelectCell];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ManySelectTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ManySelectCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = [UIColor clearColor];
    cell.strLabel.text = _array[indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    index = indexPath.row;
    ManySelectTableViewCell * cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0]];
    cell.isSelect = !cell.isSelect;
    if (cell.isSelect == YES) {
        [self selectTotalCell];
        [self.selecCells addObject:[NSString stringWithFormat:@"%ld", index]];
    }else{
        [self unSelectTolCell];
        [self.selecCells removeObject:[NSString stringWithFormat:@"%ld", index]];
    }
}
- (void)createButton
{
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"立即估价" WithBackgroundColor:UIColorFromRGB(GR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_FONT target:self action:@selector(didButtonPushVC:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tableView.bottom);
        make.left.equalTo(-5 * WIDTHFIT);
        make.right.equalTo(5 * WIDTHFIT);
        make.bottom.equalTo(0);
    }];
}

//选中的cell
- (void)selectTotalCell
{
    NSIndexPath * indexPa = [NSIndexPath indexPathForRow:index inSection:0];
    ManySelectTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPa];
    cell.isSelect = YES;
}
//取消选中cell
- (void)unSelectTolCell
{
    NSIndexPath * indexPa = [NSIndexPath indexPathForRow:index inSection:0];
    ManySelectTableViewCell * cell = [self.tableView cellForRowAtIndexPath:indexPa];
    cell.isSelect = NO;
}
- (void)didButtonPushVC:(UIButton *)sender
{
    ValuationRecyclingViewController * valuaVC = [[ValuationRecyclingViewController alloc] init];
    [self.navigationController pushViewController:valuaVC animated:YES];
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
