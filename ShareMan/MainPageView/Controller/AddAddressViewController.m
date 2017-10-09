//
//  AddAddressViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "AddAddressViewController.h"
#import "AddarssViewController.h"
#import "AddresstableViewCell.h"
#import "EditAddressViewController.h"
#import "IDPersonallModel.h"

static NSString * const AddressCell = @"AddresstableViewCell";
@interface AddAddressViewController ()<UITableViewDelegate, UITableViewDataSource, AddresstableViewCellDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSIndexPath * index;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end

@implementation AddAddressViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self getAddress:PHONE_TESTING WithToken:TOKEN_TESTING];
}
- (NSMutableArray *)array
{
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"管理收货地址";
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    [self createTableView];
    [self createTableViewHeader];
    [self createButton];
    
//    [self getAddress:@"15701236749" WithToken:@"fcfcf1962e40afc99ea1e84a01e6c001"];
}
- (void)createTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 - 44 * HEIGHTFIT) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    [self.tableView registerClass:[AddresstableViewCell class] forCellReuseIdentifier:AddressCell];
    [self.view addSubview:_tableView];
}
- (void)createTableViewHeader
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 12.5 * HEIGHTFIT)];
    view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.tableView.tableHeaderView = view;
}
- (void)createButton
{
    UIButton * buttun = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttun setTitle:@"新增地址" forState:UIControlStateNormal];
    [buttun setTitleColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) forState:UIControlStateNormal];
    buttun.titleLabel.font = NAM_TITLE_FONT;
    buttun.backgroundColor = UIColorFromRGB(GR_COLOR);
    [buttun setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [buttun addTarget:self action:@selector(didAddressButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttun];
    
    [buttun makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(0);
        make.right.equalTo(0);
        make.bottom.equalTo(0);
        make.height.equalTo(44 * HEIGHTFIT);
    }];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    IDPersonallModel * model = _array[indexPath.row];
    AddresstableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:AddressCell];
    cell.model = model;
    cell.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate = self;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 155 * HEIGHTFIT;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
//设置进入编辑状态时，Cell不会缩进
- (BOOL)tableView: (UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleDelete;
}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//         self.index = indexPath;
//        CheckFanModel * mdoel = _array[indexPath.row];
//        [self.array removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        [self userId:[AccountModel sharedAccountModel].user_id Withforid:mdoel.user_id];
//        [self.tableView reloadData];
//        [MBProgressShow ShowMBProgress:@"移出黑名单成功" WithTimer:2 WithView:self.view];
//    }
//
//}
- (void)didAddressButton:(UIButton *)sender
{
    AddarssViewController * addVC = [[AddarssViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)getAddress:(NSString *)phoneNumber WithToken:(NSString *)token
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", phoneNumber, token];
    [NetTools POSTNetWithUrl:GETADDRESS body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        [self.array removeAllObjects];
        if ([result[@"code"] isEqualToString:@"0"]) {
            for (NSDictionary * dic in result[@"data"]) {
                IDPersonallModel * model = [[IDPersonallModel alloc] initWithDic:dic];
                [self.array addObject:model];
            }
            [self.tableView reloadData];
        }
        
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];

    }];
}
- (void)didDeleteButton:(NSInteger)count
{
//    [self.tableView deleteRowsAtIndexPaths:[NSMutableArray arrayWithObject:_index] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self deleteAddressWithphoneNumber:PHONE_TESTING WithToken:TOKEN_TESTING WithpostDetailId:[NSString stringWithFormat:@"%ld", (long)count]];
//    [self.tableView reloadData];
    

}
- (void)didEditButton:(NSInteger)count
        consigneeName:(NSString *)consigneeName
         consigneeTel:(NSString *)consigneeTel
     consigneeAddress:(NSString *)consigneeAddress
        detailAddress:(NSString *)detailAddress
{
    EditAddressViewController * addVC = [[EditAddressViewController alloc] init];
    addVC.countID = count;
    addVC.name = consigneeName;
    addVC.phone = consigneeTel;
    addVC.addCity = consigneeAddress;
    addVC.address = detailAddress;
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)deleteAddressWithphoneNumber:(NSString *)phoneNumber
                           WithToken:(NSString *)token
                    WithpostDetailId:(NSString *)postDetailId
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&postDetailId=%@", phoneNumber, token,postDetailId];
    [NetTools POSTNetWithUrl:DELETEADD body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"删除成功" WithTimer:1 WithView:self.view];
            [self getAddress:PHONE_TESTING WithToken:TOKEN_TESTING];
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求超时" WithTimer:1 WithView:self.view];
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
