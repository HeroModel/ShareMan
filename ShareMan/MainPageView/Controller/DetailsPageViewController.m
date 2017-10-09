//
//  DetailsPageViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DetailsPageViewController.h"
#import "ProductNameTableViewCell.h"
#import "MoldTableViewCell.h"
#import "ServeTableViewCell.h"
#import "ParameterTableViewCell.h"
#import "ViewController.h"
#import "ShareWeChatView.h"
#import "ShareParticularsViewController.h"
#import "InstructionsView.h"
#import "QuestionView.h"
#import "LoginShareViewController.h"//登录页
#import "ShareIdentityViewController.h"//身份信息
#import "ShareIndentViewController.h"//共享订单
#import "IDPersonallModel.h"
#import "ShareModel.h"

@interface DetailsPageViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
SDCycleScrollViewDelegate,
ParameterTableViewCellDelegate,
SelectTypeViewDelegate,
ShareWeChatViewDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UITableView * tableView;
/** 轮播图数组 */
@property(nonatomic, strong) NSMutableArray *imagesURLStrings;
/** <#注释#> */
@property(nonatomic, strong) UIButton * salesButton;
/** <#注释#> */
@property(nonatomic, strong) UIButton * shareButton;
/** 按钮下的线 */
@property(nonatomic, strong) UIView * line;
/** <#注释#> */
@property(nonatomic, strong) UIButton * selTitleButton;
/** <#注释#> */
@property(nonatomic, assign) NSInteger index;
/** <#注释#> */
@property(nonatomic, strong) UIView * bigView;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, strong) UIButton * back;
/** 图文详情数组 */
@property(nonatomic, strong) NSMutableArray * dataSource;
/** 选择商品名称 */
@property(nonatomic, copy) NSString * colorName;
/** 选择商品折旧费 */
@property(nonatomic, assign) double depreciation;
/** 选择商品原价 */
@property(nonatomic, copy) NSString * original;
/** 选择商品共享价 */
@property(nonatomic, copy) NSString * real;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * dataArray;
/** <#注释#> */
@property(nonatomic, strong) IDPersonallModel * idModel;
/** <#注释#> */
@property(nonatomic, strong) SDCycleScrollView * cycleScrollView2;
@end
static NSString * const ProductCell = @"ProductNameTableViewCell";
static NSString * const MoldCell    = @"MoldTableViewCell";
static NSString * const ServeCell   = @"ServeTableViewCell";
static NSString * const ParameterCell   = @"ParameterTableViewCell";
@implementation DetailsPageViewController
{
    BOOL isOpen;
    NSMutableDictionary *selectedIndexs;
    SelectTypeView *selView;
    ShareWeChatView * shareWeChat;
    InstructionsView * instruc;
    QuestionView * question;
    CGPoint center;
    float beginContentY;
    float endContentY;
    float sectionHeaderHeight;
}
- (NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}
- (NSMutableArray *)imagesURLStrings
{
    if (_imagesURLStrings == nil) {
        _imagesURLStrings = [NSMutableArray array];
    }
    return _imagesURLStrings;
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
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];//解决SDWebImage加载图片 内存暴涨的问题 要定期调用
    selectedIndexs = [[NSMutableDictionary alloc] init];
    [self createTableView];
    [self createButton];
    [self upDataWithVersion:_version];
}
- (void)viewDidUnload
{
    selectedIndexs = nil;
    [super viewDidUnload];
}
- (void)createTableView
{
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    self.tableView.bounces = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
#ifdef __IPHONE_11_0
    if ([_tableView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
#endif
    [self.view addSubview:_tableView];
    [self.tableView registerClass:[ProductNameTableViewCell class] forCellReuseIdentifier:ProductCell];
    [self.tableView registerClass:[MoldTableViewCell class] forCellReuseIdentifier:MoldCell];
    [self.tableView registerClass:[ServeTableViewCell class] forCellReuseIdentifier:ServeCell];
    [self.tableView registerClass:[ParameterTableViewCell class] forCellReuseIdentifier:ParameterCell];
    
    [self createHeaderView];
    
    selView = [[SelectTypeView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
    selView.delegate = self;
    
    shareWeChat = [[ShareWeChatView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    shareWeChat.delegate = self;
    
    instruc = [[InstructionsView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
    
    question = [[QuestionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 1;
            break;
        case 2:
            return 1;
            break;
        case 3:
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
            ProductNameTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ProductCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.productLabel.text = _version;
            if (self.colorName == nil) {
                cell.priceLabel.text = [NSString stringWithFormat:@"[价值%ld元]", _idModel.original_price];
                cell.oldLabel.text = [NSString stringWithFormat:@"折旧费%.2f元/天", _idModel.depreciation_count];
                cell.label.text = [NSString stringWithFormat:@"¥ %ld", _idModel.real_price];
            }else{
                cell.priceLabel.text = [NSString stringWithFormat:@"[价值%@元]", self.original];
                cell.oldLabel.text = [NSString stringWithFormat:@"折旧费%.2f元/天", self.depreciation];
                cell.label.text = [NSString stringWithFormat:@"¥ %@", self.real];
            }
            return cell;
        }
            break;
        case 1:
        {
            
            MoldTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:MoldCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
            break;
        case 2:
        {
            
            ServeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ServeCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
//            cell.backgroundColor = [UIColor redColor];
            return cell;
        }
            break;
        case 3:
        {
            
            ParameterTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ParameterCell];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            cell.array = self.dataSource;
//            cell.index = _index;
            cell.delegate = self;
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
    switch (indexPath.section) {
        case 0:
            return 130 * HEIGHTFIT;
            break;
        case 1:
            return 71 * HEIGHTFIT;
            break;
        case 2:
            if ([self cellIsSelected:indexPath]) {
                return 560 * HEIGHTFIT;
            }else{
                
                return 80 * HEIGHTFIT;
            }
            break;
        case 3:
            return 1165 * HEIGHTFIT;
            break;
        default:
            break;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1) {
        
        [self.view addSubview:selView];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [UIView animateWithDuration:0.35 animations:^{
            self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);;
            self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y-50);
            selView.center = self.view.center;
            selView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];
       
        
//        [selView show];
    }
    if (indexPath.section == 2) {
//        [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
        
        ServeTableViewCell * cell = (ServeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        
        // Toggle 'selected' state
        cell.isOpen = !cell.isOpen;
        
        // Store cell 'selected' state keyed on indexPath
        NSNumber *selectedIndex = [NSNumber numberWithBool:cell.isOpen];
        [selectedIndexs setObject:selectedIndex forKey:indexPath];
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
    }else{
        return;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 3) {

        self.bigView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH * WIDTHFIT, 45 * HEIGHTFIT)];
        _bigView.userInteractionEnabled = YES;
        _bigView.backgroundColor = [UIColor whiteColor];
        
        UIImageView * back = [[UIImageView alloc] initWithFrame:CGRectMake(13 * WIDTHFIT, 25 * HEIGHTFIT, 350 * WIDTHFIT, 45 * HEIGHTFIT)];
        back.image = [UIImage imageNamed:@"line-1"];
        back.userInteractionEnabled = YES;
        [_bigView addSubview:back];
        
        NSArray * array = @[@"图文详情", @"商品参数"];
        for (int i = 0; i < array.count; i++) {
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake((75 + 60 * i + 100 * i) * WIDTHFIT, 5.5 * HEIGHTFIT, 60 * WIDTHFIT, 24 * HEIGHTFIT);
            button.backgroundColor = [UIColor whiteColor];
            [button setTitle:array[i] forState:UIControlStateNormal];
            [button setTitleColor:UIColorFromRGB(GLOBAL_SIGN_COLOR) forState:UIControlStateNormal];
            button.titleLabel.font = NAME_TIT_FONT;
            [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            button.tag = 1000 + i;
            [back addSubview:button];
            if (i == 0) {
                [self buttonAction:button];
            }
            
        }
        
        self.line = [[UIView alloc] initWithFrame:CGRectMake(90 * WIDTHFIT, 31.5 * HEIGHTFIT, 30 * WIDTHFIT, 1 * HEIGHTFIT)];
        self.line.backgroundColor = UIColorFromRGB(TITLE_COLOR);
        [back addSubview:_line];
        
        return _bigView;
    }
    else{
        return nil;
    }
    
}
- (void)buttonAction:(UIButton *)button
{
    [self selTitleBtn:button];
    NSInteger index = button.tag - 1000;
    [UIView animateWithDuration:0.5 animations:^{
        self.line.frame = CGRectMake(90 * WIDTHFIT + index * (159 * WIDTHFIT), 31.5 * HEIGHTFIT, 30 * WIDTHFIT, 1 * HEIGHTFIT);
    }];

    ParameterTableViewCell * cell = (ParameterTableViewCell *)[self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:3]];
    [cell.collectionView setContentOffset:CGPointMake((cell.bigImage.frame.size.width - 15) * index, 0)];
}
- (void)selTitleBtn:(UIButton *)btn
{
    [self.selTitleButton setTitleColor:UIColorFromRGB(GLOBAL_SIGN_COLOR) forState:UIControlStateNormal]; // 变回原来字体颜色
    self.selTitleButton.transform = CGAffineTransformIdentity; //变回原来样式
    [btn setTitleColor:UIColorFromRGB(RED_COLOR) forState:UIControlStateNormal];
    self.selTitleButton = btn;
}
- (void)offset:(NSInteger)index
{
    UIButton *but = [_bigView viewWithTag:index + 1000];
    [self selTitleBtn:but];
    [UIView animateWithDuration:0.5 animations:^{
        self.line.frame = CGRectMake(90 * WIDTHFIT + index * (159 * WIDTHFIT), 31.5 * HEIGHTFIT, 30 * WIDTHFIT, 1 * HEIGHTFIT);
        
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 3) {
        return 70 * HEIGHTFIT;
    }else{
        
        return 0;
    }
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //scrollView已经有拖拽手势，直接拿到scrollView的拖拽手势
//    UIPanGestureRecognizer *pan = scrollView.panGestureRecognizer;
//    //获取到拖拽的速度 >0 向下拖动 <0 向上拖动
//    CGFloat velocity = [pan velocityInView:scrollView].y;
//
//    if (velocity <- 5 * HEIGHTFIT) {
//        //向上拖动，显示导航栏
//        [self.navigationController setNavigationBarHidden:NO animated:YES];
//        self.navigationController.navigationBar.translucent = NO;
//        self.navigationItem.title = _version;
//        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack)];
//        self.navigationItem.leftBarButtonItem = leftButton;
//        [self.back setHidden:YES];
//        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 98);
//
//
//    }else if (velocity > 5 * HEIGHTFIT) {
//        //向下拖动，隐藏导航栏
//        [self.navigationController setNavigationBarHidden:YES animated:YES];
//        [self.back setHidden:NO];
//        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//
//    }else if(velocity == 0){
//        //停止拖拽
//    }
//}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //获取开始位置
    beginContentY = scrollView.contentOffset.y;
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    //获取结束位置
    endContentY = scrollView.contentOffset.y;
    if(endContentY-beginContentY > 5)
    {
//        [UIView animateWithDuration:1 animations:^{
//            
//        }];
        
        //向上拖动，显示导航栏
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationItem.title = _version;
        UIBarButtonItem * leftButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack)];
        self.navigationItem.leftBarButtonItem = leftButton;
        [self.back setHidden:YES];
        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 98);
        
    } else if(endContentY-beginContentY < -5)  {
//        [UIView animateWithDuration:1 animations:^{
//
//        }];
        //向下拖动，隐藏导航栏
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [self.back setHidden:NO];
        self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
}
- (void)createHeaderView
{
    self.cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 281 * HEIGHTFIT) delegate:self placeholderImage:PLACEHOLDER];
    _cycleScrollView2.backgroundColor = [UIColor whiteColor];
    _cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    _cycleScrollView2.currentPageDotColor = [UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) colorWithAlphaComponent:0.9];
    _cycleScrollView2.pageDotColor = [UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) colorWithAlphaComponent:0.4];
    _cycleScrollView2.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    _cycleScrollView2.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    _cycleScrollView2.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;//pageController样式
    _cycleScrollView2.scrollDirection = UICollectionViewScrollDirectionHorizontal;//滚动方式
    self.back = [UIButton buttonWithType:UIButtonTypeCustom];
    _back.frame = CGRectMake(15 * WIDTHFIT, 30 * HEIGHTFIT, 35 * WIDTHFIT, 35 * HEIGHTFIT);
    [_back setImage:[[UIImage imageNamed:@"nav-icon-Return2"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_back setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [_back setAdjustsImageWhenDisabled:NO];
    [_back addTarget:self action:@selector(didBackImage:) forControlEvents:UIControlEventTouchUpInside];
    [_cycleScrollView2 addSubview:_back];

    self.shareButton = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"icon-share" target:self action:@selector(didShareButton:)];
    [_cycleScrollView2 addSubview:_shareButton];
    
    self.salesButton = [UIButton ImageButtonWithType:UIButtonTypeCustom WithString:@"icon-shouquan" target:self action:@selector(didSalesButton:)];
    [_cycleScrollView2 addSubview:_salesButton];
    
    [_shareButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cycleScrollView2.bottom).offset(-35 * HEIGHTFIT);
        make.right.equalTo(-12 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(57 * WIDTHFIT, 57 * HEIGHTFIT));
    }];
    
    [_salesButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_cycleScrollView2.bottom).offset(-35 * HEIGHTFIT);
        make.right.equalTo(_shareButton.left).offset(-18 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(57 * WIDTHFIT, 57 * HEIGHTFIT));
    }];

    self.tableView.tableHeaderView = _cycleScrollView2;
}
- (void)createButton
{
    UIImageView * imageBuy = [[UIImageView alloc] init];
    imageBuy.image = [UIImage imageNamed:@"btn-bottom"];
    imageBuy.contentMode = UIViewContentModeScaleAspectFill;
    imageBuy.userInteractionEnabled = YES;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didButtonBuy:)];
    [imageBuy addGestureRecognizer:tap];
    [self.view addSubview:imageBuy];

    [imageBuy makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(0);
        make.bottom.equalTo(0);
        make.height.equalTo(60 * HEIGHTFIT);
    }];
    
}
- (void)didSalesButton:(UIButton *)sender
{
    [instruc show];
}
- (void)didShareButton:(UIButton *)sender
{
    [shareWeChat show];
}
#pragma mark --- 问号按钮
- (void)didQuestionButton
{
    [question showView];
}
- (void)dismissView
{
    [self didButtonView];
}
- (void)weChatButton
{
     [self didButtonView];
    [self shareFriend];
}
- (void)weChatFriendButton
{
     [self didButtonView];
    [self shareFriendCircle];

}
#pragma mark -- 视图消失
- (void)didButtonView
{
    [shareWeChat dismiss];
}
- (void)buttonDismiss
{
    [UIView animateWithDuration: 0.35 animations: ^{
        instruc.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    } completion: nil];
}

#pragma mark --- tableView还原视图消失
- (void)didCloseButton
{
    center.y = center.y+self.view.frame.size.height;
    [UIView animateWithDuration: 0.35 animations: ^{
        selView.frame =CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y);
    } completion: nil];
    self.colorName = nil;
    [self.tableView reloadData];
}
#pragma marl --- 点击选择商品确定按钮
- (void)didOrderButton:(NSString *)title
        WithReal_price:(NSString *)real_price
      WithDepreciation:(double)depreciation
          WithOriginal:(NSString *)original
{
    if (title == nil) {
        [MBProgressShow ShowMBProgress:@"请选择商品" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        return;
    }else{
        self.colorName = title;
        self.real = real_price;
        self.depreciation = depreciation;
        self.original = original;
        [self.tableView reloadData];
        [self selectColorDownView];
        
    }
}
#pragma mark --- 点击确定关闭视图(里边有数值)
- (void)selectColorDownView
{
    center.y = center.y+self.view.frame.size.height;
    [UIView animateWithDuration: 0.35 animations: ^{
        selView.frame =CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.0,1.0);
        self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y);
    } completion: nil];
}
#pragma mark --- 选择商品页点击关闭按钮视图消失
- (void)tapDismissView
{
    [self didCloseButton];
    self.colorName = nil;
    [self.tableView reloadData];
}
- (void)didBackImage:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didBack
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (BOOL)cellIsSelected:(NSIndexPath *)indexPath
{
    // Return whether the cell at the specified index path is selected or not
    NSNumber *selectedIndex = [selectedIndexs objectForKey:indexPath];
    return selectedIndex == nil ? FALSE : [selectedIndex boolValue];
}
//好友列表
- (void)shareFriend
{
    WXMediaMessage * message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"share_P_W"]];
    //缩略图
    WXImageObject * imageObject = [WXImageObject object];
    UIImage * image = [UIImage imageNamed:@"share_TT"];
    NSData * imagedata = [self imageWithImage:image scaledToSize:CGSizeMake(750 * WIDTHFIT, 1334 * HEIGHTFIT)];
    imageObject.imageData = imagedata;
    message.mediaObject = imageObject;
    
    SendMessageToWXReq * req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneSession;
    [WXApi sendReq:req];
}
//朋友圈
- (void)shareFriendCircle
{
    
    WXMediaMessage * message = [WXMediaMessage message];
    [message setThumbImage:[UIImage imageNamed:@"share_P_W"]];
    //缩略图
    WXImageObject * imageObject = [WXImageObject object];
    UIImage * image = [UIImage imageNamed:@"share_TT"];
    NSData * imagedata = [self imageWithImage:image scaledToSize:CGSizeMake(750 * WIDTHFIT, 1334 * HEIGHTFIT)];
    imageObject.imageData = imagedata;
    message.mediaObject = imageObject;
    
    SendMessageToWXReq * req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = WXSceneTimeline;
    [WXApi sendReq:req];
    
}
- (NSData *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
{
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return UIImageJPEGRepresentation(newImage, 1.0);
}

- (void)upDataWithVersion:(NSString *)version
{
    self.dataArray = [NSMutableArray new];
    NSString * string = [NSString stringWithFormat:@"version=%@", version];
    [NetTools POSTNetWithUrl:XINGHAO body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            self.idModel = [[IDPersonallModel alloc] initWithDic:result[@"data"]];
            for (NSString * string in self.idModel.productImages) {
                NSString * str = [URL stringByAppendingString:string];
                [self.dataArray addObject:str];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    _cycleScrollView2.imageURLStringsGroup = self.dataArray;
                });
            }
                selView.sizearr = self.idModel.tagBean_list;
            [self.dataSource addObject:_idModel.graphics];
            [self.dataSource addObject:_idModel.params];
            [self.tableView reloadData];
        }
        
    } failure:^(NSError *error) {
      [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
}
#pragma mark --- 开始预约
- (void)didButtonBuy:(UITapGestureRecognizer *)sender
{
//    NSLog(@"预约");
    if (self.colorName == nil) {
        [self.view addSubview:selView];
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        [UIView animateWithDuration:0.35 animations:^{
            self.tableView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);;
            self.tableView.center = CGPointMake(self.view.center.x, self.view.center.y-50);
            selView.center = self.view.center;
            selView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        }];

    }else{
        [self accessToCredit:_colorName];
        [MBProgressShow ShowMBProgressTimer:1 WithView:self.view];
        
       
    }
}
- (void)accessToCredit:(NSString *)title
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&introduceTitle=%@&version=%@", phone, token, title, _version];
    [NetTools POSTNetWithUrl:ORDER body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"下单流程===%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            NSString *stringData = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", phone, token];
            [NetTools POSTNetWithUrl:CREDIT body:stringData bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//                NSLog(@"芝麻信用===%@", result);
                NSString * code = result[@"code"];
                if ([code isEqualToString:@"0"]) {
                    ShareModel * model = [[ShareModel alloc] initWithDic:result[@"data"]];
//            NSString * zmxy = model.zmxy_score;
                    NSString * hygz = model.hygz_level;
                    if ( [hygz isEqualToString:@"0"] || [hygz isEqualToString:@"1"]) {
                        [hud hideAnimated:YES afterDelay:0];
                        hud.removeFromSuperViewOnHide = YES;
                        ShareIndentViewController * VCS = [[ShareIndentViewController alloc] init];
                        [self.navigationController pushViewController:VCS animated:YES];
                    }
                    else {
                        [hud hideAnimated:YES afterDelay:0];
                        hud.removeFromSuperViewOnHide = YES;
                        [MBProgressShow ShowMBProgress:@"您未通过审核,还不能下单" WithTimer:1.5 WithView:[[UIApplication sharedApplication] keyWindow]];
                    }
                }
//        else if ([code isEqualToString:@"1010"]) {
//            [hud hideAnimated:YES afterDelay:0];
//            hud.removeFromSuperViewOnHide = YES;
//            [MBProgressShow ShowMBProgress:@"您的信用分还不够" WithTimer:1.5 WithView:[[UIApplication sharedApplication] keyWindow]];
//        }
//        else //if ([code isEqualToString:@"1011"])
//        {
//            [hud hideAnimated:YES afterDelay:0];
//            hud.removeFromSuperViewOnHide = YES;
//            LoginShareViewController * shareVC = [[LoginShareViewController alloc] init];
//            [self.navigationController pushViewController:shareVC animated:NO];
//        }
            } failure:^(NSError *error) {
//                NSLog(@"芝麻NO===%@", error);
                [hud hideAnimated:YES afterDelay:0];
                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"网络加载失败" WithTimer:1.5 WithView:[[UIApplication sharedApplication] keyWindow]];
            }];
        }
        else if ([result[@"code"] isEqualToString:@"1001"])
        {
            [hud hideAnimated:YES afterDelay:0];
            hud.removeFromSuperViewOnHide = YES;
            LoginShareViewController * shareVC = [[LoginShareViewController alloc] init];
            [self.navigationController pushViewController:shareVC animated:NO];
        }
        else if ([result[@"code"] isEqualToString:@"1002"])
        {
            [hud hideAnimated:YES afterDelay:0];
            hud.removeFromSuperViewOnHide = YES;
            ShareIdentityViewController * shareIdVC = [[ShareIdentityViewController alloc] init];
            [self.navigationController pushViewController:shareIdVC animated:YES];
        }
        else{
            [hud hideAnimated:YES afterDelay:0];
            hud.removeFromSuperViewOnHide = YES;
            [MBProgressShow ShowMBProgress:@"只能生成两个订单哦" WithTimer:1 WithView:[[UIApplication sharedApplication] keyWindow]];
        }
    } failure:^(NSError *error) {
        [hud hideAnimated:YES afterDelay:0];
        hud.removeFromSuperViewOnHide = YES;
        [MBProgressShow ShowMBProgress:@"网络加载失败" WithTimer:1.5 WithView:[[UIApplication sharedApplication] keyWindow]];
//        NSLog(@"下单失败====%@", error);
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
