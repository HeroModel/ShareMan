//
//  LeftMessViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/9.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "LeftMessViewController.h"
#import "OrderTableViewCell.h"
#import "ViewController.h"
#import "DataViewController.h"
#import "GlobalNavigationController.h"
#import "REFrostedViewController.h"
#import "IdentityViewController.h"
#import "FeedbackViewController.h"
#import "VouchersViewController.h"
#import "ShareParticularsViewController.h"
#import "LeftLoginViewController.h"//登录页
#import "RecyclingOrderViewController.h"
#import "IDPersonallModel.h"

@interface LeftMessViewController ()<UITableViewDelegate, UITableViewDataSource, DataViewControllerDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * imageArray;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * stringArray;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * header;
@end

static NSString * const OrderCell = @"OrderTableViewCell";
@implementation LeftMessViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    if (phone && [phone length] != 0 && token && [token length] != 0) {
        [self checkInfo];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIImage * image1 = [UIImage imageNamed:@"icon-1"];
//    UIImage * image2 = [UIImage imageNamed:@"icon-2"];
//    UIImage * image3 = [UIImage imageNamed:@"icon-3"];
    UIImage * image7 = [UIImage imageNamed:@"icon-information"];
    UIImage * image4 = [UIImage imageNamed:@"icon-4"];
    UIImage * image5 = [UIImage imageNamed:@"icon-5"];
    UIImage * image6 = [UIImage imageNamed:@"icon-6"];
    
//     @"回收订单", @"维修订单",
    
    
    self.imageArray = [NSMutableArray arrayWithObjects:image1, image7, image4, image5, image6, nil];
    self.stringArray = [NSMutableArray arrayWithObjects:@"共享订单", @"身份信息", @"联系客服", @"小报告", @"代金券", nil];
    [self createView];
    [self createTableHeader];
    
}
- (void)createView
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 250 * WIDTHFIT, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = NO;
#ifdef __IPHONE_11_0
    if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.view addSubview:_tableView];
    [self.tableView registerNib:[UINib nibWithNibName:@"OrderTableViewCell" bundle:nil] forCellReuseIdentifier:OrderCell];
    
    
//    [_tableView makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(0);
//        make.left.equalTo(0);
//        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, SCREEN_HEIGHT * HEIGHTFIT));
//    }];
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(self.tableView.frame.size.width, 0, SCREEN_WIDTH - self.tableView.frame.size.width, SCREEN_HEIGHT)];
//    view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.5f];
//    view.userInteractionEnabled = YES;
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didViewDismiss)];
//    [view addGestureRecognizer:tap];
//    [self.view addSubview:view];
    
     //wyw
//    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH -  SCREEN_WIDTH / 3, 297, 14, 51)];
//    image.image = [UIImage imageNamed:@"sidebar-right"];
//    [self.view addSubview:image];

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.stringArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OrderTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:OrderCell];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.ima.image = self.imageArray[indexPath.row];
    cell.label.text = self.stringArray[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55 * HEIGHTFIT;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * token = TOKEN_TESTING;
    NSString * string = PHONE_TESTING;
    switch (indexPath.row) {
        case 0:
        {
            if (string && [string length] != 0 && token && [token length] != 0) {
                
                ShareParticularsViewController * shaVC = [[ShareParticularsViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
            else{
                LeftLoginViewController * shaVC = [[LeftLoginViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
        }
            break;
        case 1:
        {
            
            if (string && [string length] != 0 && token && [token length] != 0) {
                
                IdentityViewController * idVC = [[IdentityViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:idVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
            else{
                LeftLoginViewController * shaVC = [[LeftLoginViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
            
        }
            break;
        case 2:
        {
            NSString * string = @"0571-87359253";
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
            [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
            UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"客服电话" style:UIAlertActionStyleDefault handler:nil];
            alertAct.enabled = NO;
            UIAlertAction *womanAlert = [UIAlertAction actionWithTitle:@"0571-87359253" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSMutableString * strPhone =[[NSMutableString alloc] initWithFormat:@"telprompt://%@",string];
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:strPhone] options:@{} completionHandler:nil];
                
            }];
            [womanAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
            [alert addAction:alertAct];
            [alert addAction:womanAlert];
            [alert addAction:alertAction];
            
            UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
            UIFont *font = NAV_TITLE_FONT_S;
            [appearanceLabel setAppearanceFont:font];
            [self presentViewController:alert animated:YES completion:nil];
        
        }
            break;
        case 3:
        {
            if (string && [string length] != 0 && token && [token length] != 0) {
                
                FeedbackViewController * feeVC = [[FeedbackViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:feeVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }else{
                LeftLoginViewController * shaVC = [[LeftLoginViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
        }
            break;
        case 4:
        {
            if (string && [string length] != 0 && token && [token length] != 0) {
                
                VouchersViewController * vouVC = [[VouchersViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:vouVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
            else{
                LeftLoginViewController * shaVC = [[LeftLoginViewController alloc] init];
                GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
                self.frostedViewController.contentViewController = navigationController;
                [self.frostedViewController hideMenuViewController];
            }
        }
            break;
//        case 5:
//        {
//
//        }
//            break;
//        case 6:
//        {
//
//        }
            break;
        default:
            break;
    }
}

- (void)createTableHeader
{
    UIImageView * backImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 250 * WIDTHFIT, 186 * HEIGHTFIT)];
    backImage.image = [UIImage imageNamed:@"top-bg"];
    backImage.userInteractionEnabled = YES;
    backImage.contentMode = UIViewContentModeScaleAspectFill;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didbackImage:)];
    [backImage addGestureRecognizer:tap];
    
    NSString * string = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
   
    self.header = [[UIImageView alloc] init];
    if (string == nil && [string length] == 0 && token == nil && [token length] == 0) {
       _header.image = [UIImage imageNamed:@"sb-gray"];
    }
    _header.contentMode = UIViewContentModeScaleAspectFit;
    _header.layer.masksToBounds = YES;
    _header.layer.cornerRadius = 27;
    [backImage addSubview:_header];
    [_header makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(60.5 * HEIGHTFIT);
        make.centerX.equalTo(backImage);
        make.size.equalTo(CGSizeMake(70 * WIDTHFIT, 70 * HEIGHTFIT));
    }];
    
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 143.5 * HEIGHTFIT, 250 * WIDTHFIT, 20)];
    _label.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = NAM_TITLE;
    [backImage addSubview:_label];
    
    self.tableView.tableHeaderView = backImage;
}
- (void)checkInfo
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", phone, token];
    [NetTools POSTNetWithUrl:CHECKMATERIAL body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            IDPersonallModel * model = [[IDPersonallModel alloc] initWithDic:result[@"data"]];
            if (model.portrait == nil) {
               _header.image = [UIImage imageNamed:@"sb-yellow-big"];
            }else{
                [self.header sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:model.portrait]] placeholderImage:HEADER_PLACEHOLDER];
            }
            if (model.nickname == nil) {
                _label.text = phone;
            }else{
                 self.label.text = model.nickname;
            }
        }else{
            return ;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)didbackImage:(UITapGestureRecognizer *)tap
{
    NSString * string = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    if (string && [string length] != 0 && token && [token length] != 0) {
        
        DataViewController * headerVC = [[DataViewController alloc] init];
//        LoginPageViewController * loginVC = [[LoginPageViewController alloc] init];
        GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:headerVC];
        headerVC.delegate = self;
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    }else{
        
        LeftLoginViewController * shaVC = [[LeftLoginViewController alloc] init];
        GlobalNavigationController *navigationController = [[GlobalNavigationController alloc] initWithRootViewController:shaVC];
        self.frostedViewController.contentViewController = navigationController;
        [self.frostedViewController hideMenuViewController];
    }
    
    
}
- (void)upNicknameText:(NSString *)text
{
    if ([text length] == 0) {
       _label.text = @"微微一笑";
    }else{
        _label.text = text;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
