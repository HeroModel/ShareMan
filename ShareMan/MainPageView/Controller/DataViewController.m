//
//  DataViewController.m
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "DataViewController.h"
#import "GFHomeNavViewController.h"
#import "UIView+Extend.h"
#import "AddAddressViewController.h"
#import "AmendViewController.h"
#import "LoginPageViewController.h"
#import "MainViewController.h"
#import "LeftMessViewController.h"
#import "REFrostedViewController.h"
#import "GFHomeNavViewController.h"
#import "IDPersonallModel.h"

@interface DataViewController ()
<
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
YWAlertViewDelegate
>
/** <#注释#> */
@property(nonatomic, strong) UIImageView * imageHeader;
/** <#注释#> */
@property(nonatomic, strong) UILabel * nameLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * sexLabel;
/** <#注释#> */
@property(nonatomic, strong) UILabel * phoneLabel;
/** <#注释#> */
@property(nonatomic, copy) NSString * phone;
/** <#注释#> */
@property(nonatomic, copy) NSString * token;
/** <#注释#> */
@property(nonatomic, strong) IDPersonallModel * model;
@end

@implementation DataViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self checkInfo];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"个人资料";
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    self.phone = PHONE_TESTING;
    self.token = TOKEN_TESTING;
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"return_p"] highImage:[UIImage imageNamed:@"return_p"] target:(GlobalNavigationController *)self.navigationController action:@selector(showMenu) forControlEvents:UIControlEventTouchDown];
    [self createTwoView];
    
}
- (void)createTwoView
{
#pragma mark --- 第一块视图
    UIView * view1 = [[UIView alloc] init];
    view1.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = 10;
    [self.view addSubview:view1];
    [view1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(20 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(335 * WIDTHFIT, 205 * HEIGHTFIT));
    }];
    
    UILabel * headerLabel = [[UILabel alloc] init];
    headerLabel.text = @"头像";
    headerLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    headerLabel.font = NAM_TITLE_B;
    [view1 addSubview:headerLabel];
    [headerLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(35 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    self.imageHeader = [[UIImageView alloc] init];
    self.imageHeader.contentMode = UIViewContentModeScaleToFill;
    self.imageHeader.layer.masksToBounds = YES;
    self.imageHeader.layer.cornerRadius = 15 * WIDTHFIT;
    self.imageHeader.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapHeader = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didHeader)];
    [self.imageHeader addGestureRecognizer:tapHeader];
    [view1 addSubview:_imageHeader];
    [_imageHeader makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(15 * HEIGHTFIT);
        make.right.equalTo(-32 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(45 * WIDTHFIT, 45 * HEIGHTFIT));
    }];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [view1 addSubview:line1];
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageHeader.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(headerLabel.left);
        make.size.equalTo(CGSizeMake(300 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UILabel * nickLabel = [[UILabel alloc] init];
    nickLabel.text = @"昵称";
    nickLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    nickLabel.font = NAM_TITLE_B;
    [view1 addSubview:nickLabel];
    [nickLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.text = @"里约杰克";
    self.nameLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.nameLabel.font = NAM_TITLE_B;
    self.nameLabel.textAlignment = NSTextAlignmentRight;
    self.nameLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapNick = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didNick)];
    [self.nameLabel addGestureRecognizer:tapNick];
    [view1 addSubview:_nameLabel];
    [_nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(19.5 * HEIGHTFIT);
        make.right.equalTo(-33 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(150 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[[UIImage imageNamed:@"main-image-jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.userInteractionEnabled = NO;
    [view1 addSubview:button];
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(21.5 * HEIGHTFIT);
        make.left.equalTo(self.nameLabel.right).offset(7 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(6 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UIView * line2 = [[UIView alloc] init];
    line2.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [view1 addSubview:line2];
    [line2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nickLabel.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(headerLabel.left);
        make.size.equalTo(CGSizeMake(300 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UILabel * sex = [[UILabel alloc] init];
    sex.text = @"性别";
    sex.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    sex.font = NAM_TITLE_B;
    [view1 addSubview:sex];
    [sex makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    self.sexLabel = [[UILabel alloc] init];
    self.sexLabel.text = @"男";
    self.sexLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.sexLabel.font = NAM_TITLE_B;
    self.sexLabel.textAlignment = NSTextAlignmentRight;
    self.sexLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapSex = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didSex)];
    [self.sexLabel addGestureRecognizer:tapSex];
    [view1 addSubview:_sexLabel];
    [_sexLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(19.5 * HEIGHTFIT);
        make.right.equalTo(-33 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setImage:[[UIImage imageNamed:@"main-image-jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [button1 setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button1.userInteractionEnabled = NO;
    [view1 addSubview:button1];
    [button1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(21.5 * HEIGHTFIT);
        make.left.equalTo(self.sexLabel.right).offset(7 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(6 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    
    UIView * line3 = [[UIView alloc] init];
    line3.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [view1 addSubview:line3];
    [line3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sex.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(headerLabel.left);
        make.size.equalTo(CGSizeMake(300 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
#pragma mark --- 第二块视图
    
    UIView * view2 = [[UIView alloc] init];
    view2.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    view2.layer.masksToBounds = YES;
    view2.layer.cornerRadius = 10;
    [self.view addSubview:view2];
    [view2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view1.bottom).offset(15 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(335 * WIDTHFIT, 255 * HEIGHTFIT));
    }];
    
    UILabel * phone = [[UILabel alloc] init];
    phone.text = @"手机号码";
    phone.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    phone.font = NAM_TITLE_B;
    [view2 addSubview:phone];
    [phone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(35 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(85 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    self.phoneLabel = [[UILabel alloc] init];
    self.phoneLabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.phoneLabel.font = NAM_TITLE_B;
    self.phoneLabel.textAlignment = NSTextAlignmentRight;
    self.phoneLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapPhone = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didPhone)];
    [self.phoneLabel addGestureRecognizer:tapPhone];
    [view2 addSubview:_phoneLabel];
    [_phoneLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(35 * HEIGHTFIT);
        make.right.equalTo(-33 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(160 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIButton * button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setImage:[[UIImage imageNamed:@"main-image-jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [button2 setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button2.userInteractionEnabled = NO;
    [view2 addSubview:button2];
    [button2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(37 * HEIGHTFIT);
        make.left.equalTo(self.phoneLabel.right).offset(7 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(6 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UIView * line4 = [[UIView alloc] init];
    line4.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [view2 addSubview:line4];
    [line4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phone.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(headerLabel.left);
        make.size.equalTo(CGSizeMake(300 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UILabel * address = [[UILabel alloc] init];
    address.text = @"地址管理";
    address.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    address.font = NAM_TITLE_B;
    [view2 addSubview:address];
    [address makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(20 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(80 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UILabel * edit = [[UILabel alloc] init];
    edit.text = @"管理";
    edit.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    edit.font = NAM_TITLE_B;
    edit.textAlignment = NSTextAlignmentRight;
    edit.userInteractionEnabled = YES;
    UITapGestureRecognizer * tapAddress = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didAddress)];
    [edit addGestureRecognizer:tapAddress];
    [view2 addSubview:edit];
    [edit makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4.bottom).offset(19.5 * HEIGHTFIT);
        make.right.equalTo(-33 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(160 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIButton * button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button3 setImage:[[UIImage imageNamed:@"main-image-jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]forState:UIControlStateNormal];
    [button3 setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [button3 addTarget:self action:@selector(didAddress) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:button3];
    [button3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line4.bottom).offset(21.5 * HEIGHTFIT);
        make.left.equalTo(edit.right).offset(7 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(6 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UIView * line5 = [[UIView alloc] init];
    line5.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [view2 addSubview:line5];
    [line5 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(address.bottom).offset(19.5 * HEIGHTFIT);
        make.left.equalTo(headerLabel.left);
        make.size.equalTo(CGSizeMake(300 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UIButton * button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor = UIColorFromRGB(GR_COLOR);
    [button4 setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    [button4 setTitle:@"切换账号" forState:UIControlStateNormal];
    [button4 setTitleColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR) forState:UIControlStateNormal];
    button4.titleLabel.font = NAM_TITLE_FONT;
    button4.layer.masksToBounds = YES;
    button4.layer.cornerRadius = 5;
    button4.adjustsImageWhenDisabled = NO;
    [button4 addTarget:self action:@selector(didButton:) forControlEvents:UIControlEventTouchUpInside];
    [view2 addSubview:button4];
    
    [button4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line5.bottom).offset(55 * HEIGHTFIT);
        make.centerX.equalTo(view2);
        make.size.equalTo(CGSizeMake(250 * WIDTHFIT, 44 * HEIGHTFIT));
    }];
}
- (void)didHeader
{
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.allowsEditing = NO;
//    imagePickerController.showsCameraControls = NO;
//    imagePickerController.videoQuality = UIImagePickerControllerQualityTypeHigh;
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
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
    [alertAct setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *womanAlert = [UIAlertAction actionWithTitle:@"相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
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
    [womanAlert setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    [alert addAction:alertAct];
    [alert addAction:womanAlert];
    [alert addAction:alertAction];
    
    UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
    UIFont *font = NAV_TITLE_FONT_S;
    [appearanceLabel setAppearanceFont:font];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        // NSLog(@"照相完成");
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        
        self.imageHeader.image = image;
        [self editHeader:image];
    } else {
        //  NSLog(@"图片库");
        UIImage *image = [info valueForKey:UIImagePickerControllerEditedImage];
        
        self.imageHeader.image = image;
        [self editHeader:image];
    }
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 取消图片挑选
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    //  NSLog(@"取消挑选");
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)didNick
{
    YWAlertView * alert = [[YWAlertView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    alert.delegate = self;
    [alert show];
    
}
- (void)didSex
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"男生" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.sexLabel.text = @"男";
        [self editGender:@"1"];
    }];
    [alertAct setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *womanAlert = [UIAlertAction actionWithTitle:@"女生" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.sexLabel.text = @"女";
        [self editGender:@"2"];
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
- (void)didPhone
{
    AmendViewController * amendVC = [[AmendViewController alloc] init];
    [self.navigationController pushViewController:amendVC animated:YES];
}
- (void)didAddress
{
    AddAddressViewController * addVC = [[AddAddressViewController alloc] init];
    [self.navigationController pushViewController:addVC animated:YES];
}
- (void)didButton:(UIButton *)sender
{
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alertAction setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *alertAct = [UIAlertAction actionWithTitle:@"切换账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [UserDefaults removeObjectForKey:@"token"];
        [UserDefaults removeObjectForKey:@"phoneNumber"];
        [UserDefaults synchronize];
        [AccountModel attemptDealloc];
        LoginPageViewController * logVC = [[LoginPageViewController alloc] init];
        [self.navigationController pushViewController:logVC animated:NO];
        
    }];
    [alertAct setValue:UIColorFromRGB(GLOBAL_CONTEXT_COLOR) forKey:@"titleTextColor"];
    UIAlertAction *womanAlert = [UIAlertAction actionWithTitle:@"退出账号" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString * phone = [UserDefaults objectForKey:@"phoneNumber"];
        NSString * token = [UserDefaults objectForKey:@"token"];
        
        if (isValidString(phone)) {
            [UserDefaults removeObjectForKey:@"phoneNumber"];
        }
        
        if (isValidString(token)) {
            [UserDefaults removeObjectForKey:@"token"];
        }
        
        [AccountModel attemptDealloc];
        [self againLogin];
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
- (void)upDateNickName:(NSString *)string
{
    if ([string length] == 0 || string == nil) {
        self.nameLabel.text = _model.nickname;
    }else{
        self.nameLabel.text = string;
        [self editNickName:string];
    }
    
}
- (void)againLogin
{
    MainViewController * mainVC = [[MainViewController alloc] init];
    
    LeftMessViewController * leftVC = [[LeftMessViewController alloc] init];
    
    GFHomeNavViewController *globalNav = [[GFHomeNavViewController alloc]initWithRootViewController:mainVC];
    
    REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:globalNav menuViewController:leftVC];
    
    frostedViewController.direction = REFrostedViewControllerDirectionLeft;
    
    frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleDark;
    
    frostedViewController.liveBlur = YES;
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = frostedViewController;
    
    
//    frostedViewController.delegate = self;
}
- (void)checkInfo
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@", _phone, _token];
    [NetTools POSTNetWithUrl:CHECKMATERIAL body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            self.model = [[IDPersonallModel alloc] initWithDic:result[@"data"]];
            if (_model.portrait == nil) {
                self.imageHeader.image = [UIImage imageNamed:@"sb-yellow-small"];
            }else{
                [self.imageHeader sd_setImageWithURL:[NSURL URLWithString:[URL stringByAppendingString:_model.portrait]] placeholderImage:HEADER_PLACEHOLDER];
            }
            if (_model.nickname == nil) {
                self.nameLabel.text = PHONE_TESTING;
            }else{
                self.nameLabel.text = _model.nickname;
            }
            if (_model.gender == 0) {
               self.sexLabel.text = @"男";
            }else{
                NSInteger six = _model.gender;
                if (six == 1) {
                    self.sexLabel.text = @"男";
                }else{
                    self.sexLabel.text = @"女";
                }
            }
            self.phoneLabel.text = _model.phone_number;
        }else{
            return ;
        }
    } failure:^(NSError *error) {
        
    }];
}
- (void)editNickName:(NSString *)nickname
{
    
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&nickname=%@", _phone, _token, nickname];
    [NetTools POSTNetWithUrl:NIKENAME body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"改昵称==%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            
        }else{
            return ;
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求超时" WithTimer:1 WithView:self.view];
    }];
}
- (void)editGender:(NSString *)genger
{
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&gender=%@", _phone, _token, genger];
    [NetTools POSTNetWithUrl:GENDER body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
//        NSLog(@"改性别==%@", result);
        if ([result[@"code"] isEqualToString:@"0"]) {
            
        }else{
            return ;
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求超时" WithTimer:1 WithView:self.view];
    }];

}
- (void)editHeader:(UIImage *)image
{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    
    NSDictionary * dic = @{@"phoneNumber":[NSString stringWithFormat:@"%@", _phone],
                           @"token":[NSString stringWithFormat:@"%@", _token],
                           @"image":[NSString stringWithFormat:@"%@", image]};
    
    NSData * imageData = nil;
    if ([imageData length] > 1024) {
        imageData = UIImageJPEGRepresentation(image, 0.0f);
    }else
    {
        imageData = UIImagePNGRepresentation(image);
    }
    
    [NetTools sendPOSTWithUrl:HEADER WithImageData:imageData WithName:@"image" parameters:dic success:^(id result) {
//        NSLog(@"改头像OK===%@", result);
        [hud hideAnimated:YES afterDelay:0];
        hud.removeFromSuperViewOnHide = YES;
        [MBProgressShow ShowMBProgress:@"头像上传成功" WithTimer:1 WithView:self.view];
    } fail:^(NSError *error) {
//        NSLog(@"改头像NO===%@", error);
        [hud hideAnimated:YES afterDelay:0];
        hud.removeFromSuperViewOnHide = YES;
        [MBProgressShow ShowMBProgress:@"头像上传失败" WithTimer:1 WithView:self.view];
    } progress:^(NSProgress *uploadProgress) {
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
