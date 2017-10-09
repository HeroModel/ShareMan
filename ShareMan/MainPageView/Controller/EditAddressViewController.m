//
//  EditAddressViewController.m
//  ShareMan
//
//  Created by apple on 2017/9/8.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "EditAddressViewController.h"
#import "AddressPickerView.h"
@interface EditAddressViewController ()<UITextFieldDelegate, AddressPickerViewDelegate>
/** <#注释#> */
@property(nonatomic, strong) UITextField * nameTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * phoneTextField;
/** <#注释#> */
@property(nonatomic, strong) UILabel * cityTextField;
/** <#注释#> */
@property(nonatomic, strong) UITextField * addressTextField;
/** <#注释#> */
@property(nonatomic, strong) UIView * bigView;
@end

@implementation EditAddressViewController
{
    AddressPickerView * addPickerView;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.nameTextField becomeFirstResponder];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"编辑地址";
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"nav-icon-Return"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(didBack:)];
    self.navigationItem.leftBarButtonItem = left;
    
    UILabel *rightlabel = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH - 45, 10, 35, 20)];
    rightlabel.userInteractionEnabled = YES;
    rightlabel.text = @"保存";
    rightlabel.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    rightlabel.font = NAM_TITLE_FONT;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didActionEditor:)];
    [rightlabel addGestureRecognizer:tap];
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc] initWithCustomView:rightlabel];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    self.view.backgroundColor = UIColorFromRGB(GLOBAL_NUMBER_COLOR);
    
    [self createContextView];
}
- (void)createContextView
{
    self.bigView = [[UIView alloc] init];
    _bigView.backgroundColor = UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR);
    _bigView.layer.masksToBounds = YES;
    _bigView.layer.cornerRadius = 10;
    [self.view addSubview:_bigView];
    
    [_bigView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(18 * HEIGHTFIT);
        make.left.equalTo(18 * WIDTHFIT);
        make.right.equalTo(-18 * WIDTHFIT);
        make.height.equalTo(444 * HEIGHTFIT);
    }];
    
    UILabel * label = [[UILabel alloc] init];
    label.text = @"收货人";
    label.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    label.font = NAME_TIT_FONT;
    [_bigView addSubview:label];
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(25 * HEIGHTFIT);
        make.left.equalTo(25 * WIDTHFIT);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    self.nameTextField = [[UITextField alloc] init];
    self.nameTextField.text = _name;
    self.nameTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.nameTextField.font = NAM_TITLE_B;
    self.nameTextField.delegate = self;
    self.nameTextField.keyboardType = UIKeyboardTypeDefault;
    [_bigView addSubview:_nameTextField];
    
    [_nameTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line1 = [[UIView alloc] init];
    line1.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [_bigView addSubview:line1];
    
    [line1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameTextField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UILabel * phone = [[UILabel alloc] init];
    phone.text = @"联系电话";
    phone.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    phone.font = NAME_TIT_FONT;
    [_bigView addSubview:phone];
    
    [phone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    self.phoneTextField = [[UITextField alloc] init];
    self.phoneTextField.text = _phone;
    self.phoneTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.phoneTextField.font = NAM_TITLE_B;
    self.phoneTextField.keyboardType = UIKeyboardTypePhonePad;
    self.phoneTextField.delegate = self;
    [_bigView addSubview:_phoneTextField];
    
    [_phoneTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(phone.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line2 = [[UIView alloc] init];
    line2.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [_bigView addSubview:line2];
    
    [line2 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneTextField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    UILabel * city = [[UILabel alloc] init];
    city.text = @"选择地址";
    city.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    city.font = NAME_TIT_FONT;
    [_bigView addSubview:city];
    
    [city makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line2.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    self.cityTextField = [[UILabel alloc] init];
    self.cityTextField.text = _addCity;
    self.cityTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.cityTextField.userInteractionEnabled = YES;
    self.cityTextField.font = NAM_TITLE_B;
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didCityLabel:)];
    [self.cityTextField addGestureRecognizer:tap];
    [_bigView addSubview:_cityTextField];
    
    [_cityTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(city.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(281 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[[UIImage imageNamed:@"main-image-jiantou"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [button setTintColor:UIColorFromRGB(GLOBAL_BACKGROUNDCOLOR_COLOR)];
    button.userInteractionEnabled = NO;
    [_bigView addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(city.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(_cityTextField.right);
        make.size.equalTo(CGSizeMake(6 * WIDTHFIT, 12 * HEIGHTFIT));
    }];
    
    UIView * line3 = [[UIView alloc] init];
    line3.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [_bigView addSubview:line3];
    
    [line3 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityTextField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    
    UILabel * address = [[UILabel alloc] init];
    address.text = @"详细地址";
    address.textColor = UIColorFromRGB(GLOBAL_SIGN_COLOR);
    address.font = NAME_TIT_FONT;
    [_bigView addSubview:address];
    
    [address makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line3.bottom).offset(30 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(60 * WIDTHFIT, 15 * HEIGHTFIT));
    }];
    
    self.addressTextField = [[UITextField alloc] init];
    self.addressTextField.text = _address;
    self.addressTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.addressTextField.keyboardType = UIKeyboardTypeDefault;
    self.addressTextField.font = NAM_TITLE_B;
    self.addressTextField.delegate = self;
    [_bigView addSubview:_addressTextField];
    
    [_addressTextField makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(address.bottom).offset(25 * HEIGHTFIT);
        make.left.equalTo(label.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 16 * HEIGHTFIT));
    }];
    
    UIView * line4 = [[UIView alloc] init];
    line4.backgroundColor = UIColorFromRGB(GLOBAL_COLOR);
    [_bigView addSubview:line4];
    
    [line4 makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressTextField.bottom).offset(10 * HEIGHTFIT);
        make.left.equalTo(self.nameTextField.left);
        make.size.equalTo(CGSizeMake(287 * WIDTHFIT, 0.5 * HEIGHTFIT));
    }];
    
    addPickerView = [[AddressPickerView alloc] initWithFrame:CGRectMake(0, 0 , SCREEN_WIDTH, SCREEN_HEIGHT)];
    addPickerView.delegate = self;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (self.addressTextField == textField) {
        [self keyBoardShow];
    }
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.nameTextField == textField) {
        self.nameTextField.text = textField.text;
    }if (self.phoneTextField == textField) {
        self.phoneTextField.text = textField.text;
    }if (self.addressTextField == textField) {
        self.addressTextField.text = textField.text;
    }
}
- (void)didCityLabel:(UITapGestureRecognizer *)tap
{
   [addPickerView show];
}
- (void)cancelBtnClick{
    [addPickerView hide];
}
- (void)sureBtnClickReturnProvince:(NSString *)province City:(NSString *)city Area:(NSString *)area{
    self.cityTextField.textColor = UIColorFromRGB(GLOBAL_CONTEXT_COLOR);
    self.cityTextField.text = [NSString stringWithFormat:@"%@%@%@", province,city,area];
    [addPickerView hide];
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
    [self keyBoardHide];
}
- (void)didActionEditor:(UITapGestureRecognizer *)tap
{
    [self keyBoardHide];
    [self address:_nameTextField.text WithconsigneeTel:_phoneTextField.text WIthconsigneeAddress:_cityTextField.text WIthdetailAddress:_addressTextField.text WithpostDetailId:[NSString stringWithFormat:@"%ld", _countID]];
   
}
- (void)address:(NSString *)consigneeName
WithconsigneeTel:(NSString *)consigneeTel
WIthconsigneeAddress:(NSString *)consigneeAddress
WIthdetailAddress:(NSString *)detailAddress
WithpostDetailId:(NSString *)postDetailId
{
    NSString * phone = PHONE_TESTING;
    NSString * token = TOKEN_TESTING;
    NSString * string = [NSString stringWithFormat:@"phoneNumber=%@&token=%@&consigneeName=%@&consigneeTel=%@&consigneeAddress=%@&detailAddress=%@&postDetailId=%@", phone, token, consigneeName, consigneeTel, consigneeAddress, detailAddress, postDetailId];
    [NetTools POSTNetWithUrl:ADDRESS body:string bodyStyle:NetBodySTRING resopnese:NetJSON hearder:nil success:^(id result) {
        if ([result[@"code"] isEqualToString:@"0"]) {
            [MBProgressShow ShowMBProgress:@"修改成功" WithTimer:1 WithView:self.view];
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(popVCC) userInfo:nil repeats:NO];

        }
        else{
            return ;
        }
    } failure:^(NSError *error) {
        [MBProgressShow ShowMBProgress:@"网络请求失败" WithTimer:1 WithView:self.view];
;
    }];
}
- (void)didBack:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)keyBoardShow
{
    int offset = self.view.frame.origin.y - 216.0;//iPhone键盘高
    [UIView animateWithDuration:0.5 animations:^{
        self.bigView.transform = CGAffineTransformMakeTranslation(0, offset);
    }];
}
- (void)keyBoardHide
{
    [UIView animateWithDuration:0.5 animations:^{
        self.bigView.transform = CGAffineTransformIdentity;
    }];
}
- (void)popVCC
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
