//
//  ShareIdentityViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "ShareIdentityViewController.h"
#import "IdPhotoCollectionViewCell.h"
#import "IdPhoto1CollectionViewCell.h"
#import "IdPhoto2CollectionViewCell.h"
#import "IdPhoto3CollectionViewCell.h"
#import "MessIDView.h"
#import "AccountModel.h"

@interface ShareIdentityViewController ()
<
UICollectionViewDelegate,
UICollectionViewDataSource,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
MessIDViewDelegate
>
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * token;
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array;
/** <#注释#> */
@property(nonatomic, strong) NSArray * array1;
/** <#注释#> */
@property(nonatomic, strong) UIImage * strImage;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageA;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageB;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageC;
/** <#注释#> */
@property(nonatomic, strong) UIImage * imageD;
/** <#注释#> */
@property(nonatomic, copy) NSString * name;
/** <#注释#> */
@property(nonatomic, copy) NSString * number;
/** <#注释#> */
@property(nonatomic, copy) NSString * comp;
/** <#注释#> */
@property(nonatomic, copy) NSString * address;
/** <#注释#> */
@property(nonatomic, copy) NSString * pass;
@end
static NSString * const IdPhotoCell = @"IdPhotoCollectionViewCell";
static NSString * const IdPhoto1Cell = @"IdPhoto1CollectionViewCell";
static NSString * const IdPhoto2Cell = @"IdPhoto2CollectionViewCell";
static NSString * const IdPhoto3Cell = @"IdPhoto3CollectionViewCell";
//850
@implementation ShareIdentityViewController
{
    NSInteger  itemCount;
    MessIDView * small;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"身份信息";
    //    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    self.phone = PHONE_TESTING;
    self.token = TOKEN_TESTING;
    
    [self createContextView];
    [self upDateWithPhone:PHONE_TESTING WithToken:TOKEN_TESTING];
}

- (void)createContextView
{
    
    UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64)];
    scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, 850 * HEIGHTFIT);
    scrollView.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    if ([scrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
        if (@available(iOS 11.0, *)) {
            scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
    }
    [self.view addSubview:scrollView];
    
    CALayer * layer = [CALayer layer];
    layer.frame = CGRectMake(30 * WIDTHFIT, 20 * HEIGHTFIT, 315 * WIDTHFIT, 315 * HEIGHTFIT);
    layer.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer.shadowOffset = CGSizeMake(0, 0);
    layer.shadowOpacity = 0.5;
    layer.cornerRadius = 10.0f;
    [scrollView.layer addSublayer:layer];
    
    
    small = [[MessIDView alloc] init];
    small.delegate = self;
    small.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    small.layer.masksToBounds = YES;
    small.layer.cornerRadius = 10 * WIDTHFIT;
    [scrollView addSubview:small];
    [small makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(315 * WIDTHFIT, 315 * HEIGHTFIT));
    }];
    
    CALayer * layer1 = [CALayer layer];
    layer1.frame = CGRectMake(30 * WIDTHFIT, 350 * HEIGHTFIT, 315 * WIDTHFIT, 490 * HEIGHTFIT);
    layer1.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR).CGColor;
    layer1.shadowOffset = CGSizeMake(0, 0);
    layer1.shadowOpacity = 0.5;
    layer1.cornerRadius = 10.0f;
    [scrollView.layer addSublayer:layer1];
    
    UIView * bigView = [[UIView alloc] init];
    bigView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    [self.view addSubview:bigView];
    bigView.layer.masksToBounds = YES;
    bigView.layer.cornerRadius = 10 * WIDTHFIT;
    [scrollView addSubview:bigView];
    [bigView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(small.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(30 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(315 * WIDTHFIT, 490 * HEIGHTFIT));
    }];
    
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.itemSize = CGSizeMake(315 / 2 * WIDTHFIT, 315 / 2 * WIDTHFIT);
    flowLayout.minimumLineSpacing = 0;
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 10 * HEIGHTFIT, 315 * WIDTHFIT , 329 * HEIGHTFIT) collectionViewLayout:flowLayout];
    self.collectionView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    self.collectionView.bouncesZoom = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.bounces = NO;
    [bigView addSubview:_collectionView];
    [self.collectionView registerClass:[IdPhotoCollectionViewCell class] forCellWithReuseIdentifier:IdPhotoCell];
    [self.collectionView registerClass:[IdPhoto1CollectionViewCell class] forCellWithReuseIdentifier:IdPhoto1Cell];
    [self.collectionView registerClass:[IdPhoto2CollectionViewCell class] forCellWithReuseIdentifier:IdPhoto2Cell];
    [self.collectionView registerClass:[IdPhoto3CollectionViewCell class] forCellWithReuseIdentifier:IdPhoto3Cell];
    
    
    UILabel * string = [[UILabel alloc] init];
    string.text = @"温馨提示，身份证照请保持清晰可辨，信息真实！您的身份信息将用于芝麻信用授权和共享协议签在提交订单后汇享侠将审核身份的真实性。";
    string.textAlignment = NSTextAlignmentCenter;
    string.numberOfLines = 0;
    string.textColor = UIColorFromRGB(GLOBAL_PAGE_COLOR);
    string.font = NAM_TITLE;
    [bigView addSubview:string];
    [string makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_collectionView.bottom).offset(-12 * HEIGHTFIT);
        make.left.equalTo(10 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(295 * WIDTHFIT, 70 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton itemButtonWithType:UIButtonTypeCustom WithString:@"提交" target:self action:@selector(didButton:)];
    [bigView addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(string.bottom).offset(25 * HEIGHTFIT);
        make.centerX.equalTo(bigView);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.array = @[@"身份证A面", @"身份证B面", @"持证半身照", @"学生证照"];
    self.array1 = @[@"(必填)", @"(必填)", @"(必填)", @"(学生必填)"];
    switch (indexPath.item) {
        case 0:
        {
            IdPhotoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdPhotoCell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
            cell.label.text = @"身份证A面";
            cell.label1.text = @"(必填)";
            if (self.imageA != NULL) {
                cell.IdImage.image = _imageA;
                cell.isHiddes = YES;
            }else{
                if ([AccountModel sharedAccountModel].id_card_a) {
                    cell.IdImage.image = nil;
                    [cell.IdImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:[AccountModel sharedAccountModel].id_card_a]] placeholderImage:PLACEHOLDER];
                    cell.isHiddes = YES;
                }else{
                    cell.isHiddes = NO;
                }
                
            }
            
            return cell;
        }
            break;
        case 1:
        {
            IdPhoto1CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdPhoto1Cell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
            cell.label.text = @"身份证B面";
            cell.label1.text = @"(必填)";
            if (self.imageB) {
                cell.IdImage.image = _imageB;
                cell.isHiddes = YES;
            }else{
                if ([AccountModel sharedAccountModel].id_card_b) {
                    cell.IdImage.image = nil;
                    [cell.IdImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:[AccountModel sharedAccountModel].id_card_b]] placeholderImage:PLACEHOLDER];
                    cell.isHiddes = YES;
                }else{
                    cell.isHiddes = NO;
                }
                
            }
            
            return cell;
        }
            break;
        case 2:
        {
            IdPhoto2CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdPhoto2Cell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
            cell.label.text = @"持证半身照";
            cell.label1.text = @"(必填)";
            if (self.imageC) {
                cell.IdImage.image = _imageC;
                cell.isHiddes = YES;
            }else{
                if ([AccountModel sharedAccountModel].id_card_on_hand) {
                    cell.IdImage.image = nil;
                    [cell.IdImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:[AccountModel sharedAccountModel].id_card_on_hand]] placeholderImage:PLACEHOLDER];
                    cell.isHiddes = YES;
                }else{
                    cell.isHiddes = NO;
                }
                
            }
            
            return cell;
        }
            break;
        case 3:
        {
            IdPhoto3CollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:IdPhoto3Cell forIndexPath:indexPath];
            cell.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
            cell.label.text = @"学生证照";
            cell.label1.text = @"(学生必填)" ;
            if (self.imageD) {
                cell.IdImage.image = _imageD;
                cell.isHiddes = YES;
            }else{
                if ([AccountModel sharedAccountModel].student_id_card) {
                    cell.IdImage.image = nil;
                    [cell.IdImage sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:[AccountModel sharedAccountModel].student_id_card]] placeholderImage:PLACEHOLDER];
                    cell.isHiddes = YES;
                }else{
                    cell.isHiddes = NO;
                }
            }
            
            return cell;
        }
            break;
        default:
            break;
    }
    return nil;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    itemCount = indexPath.item;
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction * picturesAlert = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];//读取设备授权状态
        if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
            
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"相机权限未开启，请进入系统【设置】>【隐私】>【相机】中开启相机功能" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:dismiss];
            //            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
            
        }else{
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;//调用相机
                imagePickerController.delegate = self;//设置代理
                imagePickerController.allowsEditing = YES;//挑选图片是否可以编辑
                imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;//模态出图片库
                [self.navigationController presentViewController:imagePickerController animated:YES completion:^{
                }];
                
            }
            else
            {
                [MBProgressShow ShowMBProgress:@"该设备没有拍照功能" WithTimer:2 WithView:self.view];
            }
            
        }
        
    }];
    [picturesAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *albumAlert = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
        if (status == PHAuthorizationStatusRestricted || status == PHAuthorizationStatusDenied)
        {
            UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"相机权限未开启，请进入系统【设置】>【隐私】>【相册】中开启相册功能" message:nil preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction * dismiss = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            [alert addAction:dismiss];
            //            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        }else{
            
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
                imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;//调用相册
                imagePickerController.delegate = self;//设置代理
                imagePickerController.allowsEditing = YES;//挑选图片是否可以编辑
                imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;//模态出图片库
                [self.navigationController presentViewController:imagePickerController animated:YES completion:^{
                    
                }];
            }
        }
    }];
    [albumAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    [alert addAction:picturesAlert];
    [alert addAction:albumAlert];
    [alert addAction:alertAction];
    
    UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    UIFont *font = NAV_TITLE_FONT_S;
    [appearanceLabel setAppearanceFont:font];
    [self presentViewController:alert animated:YES completion:nil];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        switch (itemCount) {
            case 0:
                self.imageA = image;
                [self upDataImageA:_imageA];
                break;
            case 1:
                self.imageB = image;
                [self upDataImageB:_imageB];
                break;
            case 2:
                self.imageC = image;
                [self upDataImageC:_imageC];
                break;
            case 3:
                self.imageD = image;
                [self upDataImageD:_imageD];
                break;
            default:
                break;
        }
        
    } else {
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        
        switch (itemCount) {
            case 0:
                self.imageA = image;
                [self upDataImageA:_imageA];
                break;
            case 1:
                self.imageB = image;
                [self upDataImageB:_imageB];
                break;
            case 2:
                self.imageC = image;
                [self upDataImageC:_imageC];
                break;
            case 3:
                self.imageD = image;
                [self upDataImageD:_imageD];
                break;
            default:
                break;
        }
        
    }
    [self.collectionView reloadData];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 取消图片挑选
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //  NSLog(@"取消挑选");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)name:(NSString *)name
{
    if (name == nil) {
        self.name = [AccountModel sharedAccountModel].name;
    }else{
        self.name = name;
    }
}
- (void)IdCardNo:(NSString *)IdCardNo
{
    if (IdCardNo == nil) {
        self.number = [AccountModel sharedAccountModel].id_card_no;
    }else{
        self.number = IdCardNo;
    }
}
- (void)company:(NSString *)company
{
    if (company == nil) {
        self.comp = [AccountModel sharedAccountModel].company;
    }else{
        self.comp = company;
    }
}
- (void)address:(NSString *)address
{
    if (address == nil) {
        self.address = [AccountModel sharedAccountModel].address;
    }else{
        self.address = address;
    }
}
- (void)password:(NSString *)pass
{
    if (pass == nil) {
        self.pass = [AccountModel sharedAccountModel].service_password;
    }else{
        self.pass = pass;
    }
}
- (void)didButton:(UIButton *)sender
{
    //    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    //    hud.mode = MBProgressHUDModeIndeterminate;
    //    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(globalQueue, ^{
        if ([AccountModel sharedAccountModel].name == nil && [AccountModel sharedAccountModel].id_card_no == nil && [AccountModel sharedAccountModel].service_password == nil && [AccountModel sharedAccountModel].company == nil && [AccountModel sharedAccountModel].address == nil) {
            
            if (_name == nil && [_name length] == 0) {
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"填写姓名" WithTimer:1 WithView:self.view];
            }
            if (_number == nil && [_number length] == 0) {
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"填写身份证号" WithTimer:1 WithView:self.view];
            }
            if (_pass == nil && [_pass length] == 0)
            {
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"填写服务密码" WithTimer:1 WithView:self.view];
            }
            if (_comp == nil && [_comp length] == 0)
            {
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"填写单位名称" WithTimer:1 WithView:self.view];
            }
            if (_address == nil && [_address length] == 0)
            {
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
                [MBProgressShow ShowMBProgress:@"填写现住址" WithTimer:1 WithView:self.view];
            }
            if (_name != nil && [_name length] != 0 && _number != nil && [_number length] != 0 && _pass != nil && [_pass length] != 0 && _comp != nil && [_comp length] != 0 && _address != nil && [_address length] != 0) {
                [self upDataInfoWith:_name WithNumber:_number WithPass:_pass WithComp:_comp WithAddress:_address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
        }
        else if ((_name != nil && [AccountModel sharedAccountModel].name != nil) || (_number != nil && [AccountModel sharedAccountModel].id_card_no != nil) || (_pass != nil && [AccountModel sharedAccountModel].service_password != nil) || (_comp != nil && [AccountModel sharedAccountModel].company != nil) || (_address != nil && [AccountModel sharedAccountModel].address != nil)){
            if (self.name && _number == nil && _pass == nil && _comp == nil && _address == nil){
                [self upDataInfoWith:_name WithNumber:[AccountModel sharedAccountModel].id_card_no WithPass:[AccountModel sharedAccountModel].service_password WithComp:[AccountModel sharedAccountModel].company WithAddress:[AccountModel sharedAccountModel].address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
            if (self.number && _name == nil && _pass == nil && _comp == nil && _address == nil)
            {
                [self upDataInfoWith:[AccountModel sharedAccountModel].name WithNumber:_number WithPass:[AccountModel sharedAccountModel].service_password WithComp:[AccountModel sharedAccountModel].company WithAddress:[AccountModel sharedAccountModel].address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
            if (self.pass && _name == nil && _number == nil && _comp == nil && _address == nil)
            {
                [self upDataInfoWith:[AccountModel sharedAccountModel].name WithNumber:[AccountModel sharedAccountModel].id_card_no WithPass:_pass WithComp:[AccountModel sharedAccountModel].company WithAddress:[AccountModel sharedAccountModel].address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
            if (self.comp && _name == nil && _number == nil && _pass == nil && _address == nil)
            {
                [self upDataInfoWith:[AccountModel sharedAccountModel].name WithNumber:[AccountModel sharedAccountModel].id_card_no WithPass:[AccountModel sharedAccountModel].service_password WithComp:_comp WithAddress:[AccountModel sharedAccountModel].address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
            if (self.address && _name == nil && _number == nil && _pass == nil && _comp == nil) {
                [self upDataInfoWith:[AccountModel sharedAccountModel].name WithNumber:[AccountModel sharedAccountModel].id_card_no WithPass:[AccountModel sharedAccountModel].service_password WithComp:[AccountModel sharedAccountModel].company WithAddress:_address];
                //                [hud hideAnimated:YES afterDelay:0];
                //                hud.removeFromSuperViewOnHide = YES;
            }
            
            if (_imageA == nil || [AccountModel sharedAccountModel].id_card_a == nil) {
                if (_imageB == nil || [AccountModel sharedAccountModel].id_card_b == nil) {
                    if (_imageC == nil || [AccountModel sharedAccountModel].id_card_on_hand == nil) {
                         [MBProgressShow ShowMBProgress:@"持证半身照添加照片" WithTimer:1 WithView:self.view];
                    }
                    [MBProgressShow ShowMBProgress:@"身份证B面添加照片" WithTimer:1 WithView:self.view];
                }
               
                [MBProgressShow ShowMBProgress:@"身份证A面添加照片" WithTimer:1 WithView:self.view];

            }
            
        }
        if ((_imageA != nil || [AccountModel sharedAccountModel].id_card_a != nil) && (_imageB != nil || [AccountModel sharedAccountModel].id_card_b != nil) && (_imageC != nil || [AccountModel sharedAccountModel].id_card_on_hand != nil)) {
            
            [MBProgressShow ShowMBProgressTimer:2 WithView:[[UIApplication sharedApplication] keyWindow]];
            
            [NSTimer scheduledTimerWithTimeInterval:2.5 target:self selector:@selector(showAlert) userInfo:nil repeats:NO];
        }
    });
    
}
- (void)showAlert
{
    [MBProgressShow ShowMBProgress:@"上传成功" WithTimer:1 WithView:self.view];
    [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(popShowVC) userInfo:nil repeats:NO];
}
- (void)popShowVC
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)upDataInfoWith:(NSString *)name
            WithNumber:(NSString *)number
              WithPass:(NSString *)pass
              WithComp:(NSString *)comp
           WithAddress:(NSString *)address
{
    
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&name=%@&idCardNo=%@&servicePassword=%@&company=%@&address=%@", _phone, _token, name, number, pass, comp, address];
    
    [NetTools POSTNetWithUrl:SHENFEN body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//      [MBProgressShow ShowMBProgress:@"上传信息成功" WithTimer:1 WithView:self.view];
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"上传信息失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)upDataImageA:(UIImage *)image
{
    
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", _phone],
                           @"token":[NSString stringWithFormat:@"%@", _token],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.8f);
    }else
    {
        
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:SHENFEN_A WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
        //        NSLog(@"图片上传OK---A===%@", result);
    } fail:^(NSError *error) {
        //        NSLog(@"图片上传NO===%@", error);
    } progress:^(NSProgress *uploadProgress) {
    }];
}
- (void)upDataImageB:(UIImage *)image
{
    
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", _phone],
                           @"token":[NSString stringWithFormat:@"%@", _token],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.8f);
    }else
    {
        
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:SHENFEN_B WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
        //        NSLog(@"图片上传OK---B===%@", result);
    } fail:^(NSError *error) {
        //        NSLog(@"图片上传NO===%@", error);
    } progress:^(NSProgress *uploadProgress) {
    }];
}
- (void)upDataImageC:(UIImage *)image
{
    
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", _phone],
                           @"token":[NSString stringWithFormat:@"%@", _token],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.8f);
    }else
    {
        
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:SHENFEN_C WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
        //        NSLog(@"图片上传OK---C===%@", result);
    } fail:^(NSError *error) {
        //        NSLog(@"图片上传NO===%@", error);
    } progress:^(NSProgress *uploadProgress) {
        
    }];
}
- (void)upDataImageD:(UIImage *)image
{
    
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", _phone],
                           @"token":[NSString stringWithFormat:@"%@", _token],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.8f);
    }else
    {
        
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:SHENFEN_D WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
        //        NSLog(@"图片上传OK---D===%@", result);
    } fail:^(NSError *error) {
        //        NSLog(@"图片上传NO===%@", error);
    } progress:^(NSProgress *uploadProgress) {
    }];
}
- (void)upDateWithPhone:(NSString *)phone WithToken:(NSString *)token
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", phone, token];
    [NetTools POSTNetWithUrl:CHAKAN body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [[AccountModel sharedAccountModel] setValuesForKeysWithDictionary:result[@"data"]];
            small.nameText.text = [AccountModel sharedAccountModel].name;
            small.numText.text = [AccountModel sharedAccountModel].id_card_no;
            small.passWord.text = [AccountModel sharedAccountModel].service_password;
            if ([AccountModel sharedAccountModel].company) {
                small.strText.text = [AccountModel sharedAccountModel].company;
                small.isHiddle = YES;
            }else{
                small.isHiddle = NO;
                small.strText.text = nil;
            }
            if ([AccountModel sharedAccountModel].address) {
                small.addressText.text = [AccountModel sharedAccountModel].address;
                small.isHiddle = YES;
            }else{
                small.isHiddle = NO;
                small.addressText.text = nil;
            }
            
            [self.collectionView reloadData];
        }
        //        NSLog(@"%@", NSHomeDirectory());
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
    }];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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
