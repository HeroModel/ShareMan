//
//  SubmitSuccessfulViewController.m
//  ShareMan
//
//  Created by mac on 2017/9/3.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "SubmitSuccessfulViewController.h"
#import "CompleteTableViewCell.h"
#import "RecipientTableViewCell.h"
#import "MainViewController.h"

@interface SubmitSuccessfulViewController ()<UITableViewDelegate, UITableViewDataSource>
/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;
/** <#注释#> */
@property (nonatomic, strong) NSArray *array;
/** <#注释#> */
@property (nonatomic, strong) NSArray *array1;
@end
static NSString * const CompleteCell = @"CompleteTableViewCell";
static NSString * const RecipientCell = @"RecipientTableViewCell";
@implementation SubmitSuccessfulViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"下单完成";
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBackPushVC:)];
    self.navigationItem.leftBarButtonItem = left;
    
    self.array = @[@"收件人", @"联系电话"];
    self.array1 = @[@"张显泽", @"0755-82552759"];
    
    [self createTabel];
    [self createHeader];
    [self createFooter];
}
- (void)createTabel
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 160) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[CompleteTableViewCell class] forCellReuseIdentifier:CompleteCell];
    [self.tableView registerClass:[RecipientTableViewCell class] forCellReuseIdentifier:RecipientCell];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return self.array.count;
            break;
        case 1:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            CompleteTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CompleteCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.left.text = _array[indexPath.row];
            cell.right.text = _array1[indexPath.row];
            return cell;
        }
            break;
        case 1:
        {
            RecipientTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:RecipientCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.left.text = @"收货地址";
            cell.right.text = @"深圳市福田区华强北街道华发北路桑达雅苑21F";
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        return 70;
    }else{
        
        return 50;
    }
}
- (void)createHeader
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 198 * HEIGHTFIT)];
    view.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    
    UIImageView * images = [[UIImageView alloc] init];
    images.image = [UIImage imageNamed:@"top-icon"];
    images.contentMode = UIViewContentModeScaleToFill;
    [view addSubview:images];
    [images makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(25 * HEIGHTFIT);
        make.centerX.equalTo(view);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 80 * HEIGHTFIT));
    }];
    
    UILabel * label = [UILabel StringWithFont:NAM_TITLE_FONT_M WithTextColor:UIColorFromRGB(GLOBAL_CONTEXT_COLOR)];
    label.text = @"提交成功";
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(images.bottom).offset(24 * HEIGHTFIT);
        make.left.equalTo(80 * WIDTHFIT);
        make.right.equalTo(-80 * WIDTHFIT);
        make.height.equalTo(20 * HEIGHTFIT);
    }];
    
    UILabel * label1 = [UILabel StringWithFont:NAM_TITLE WithTextColor:UIColorFromRGB(GLOBAL_SIGN_COLOR)];
    label1.text = @"请将手机寄送到指定收货地址";
    label1.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label1];
    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(12 * HEIGHTFIT);
        make.left.equalTo(80 * WIDTHFIT);
        make.right.equalTo(-80 * WIDTHFIT);
        make.height.equalTo(14 * HEIGHTFIT);
    }];
    
    UIView * line = [UIView lineWithView];
    [view addSubview:line];
    [line makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.bottom.and.right.equalTo(0);
        make.height.equalTo(0.5 * HEIGHTFIT);
    }];
    self.tableView.tableHeaderView = view;
    
}
- (void)createFooter
{
    
    UIButton * button = [UIButton ButtonWithType:UIButtonTypeCustom WithString:@"完成" WithBackgroundColor:UIColorFromRGB(GR_COLOR) WithTextColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) WithFont:NAM_TITLE_B target:self action:@selector(didCompleteButton:)];
    [self.view addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.bottom).offset(60 * HEIGHTFIT);
        make.left.equalTo(62.5 * WIDTHFIT);
        make.right.equalTo(-62.5 * WIDTHFIT);
        make.height.equalTo(45 * HEIGHTFIT);
    }];
    
}
- (void)didCompleteButton:(UIButton *)sender
{
    for (UIViewController * controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[MainViewController class]]) {
            [self.navigationController popToViewController:controller animated:YES];
        }
    }
}
- (void)didBackPushVC:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
