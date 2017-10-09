//
//  YWAmendPhont.h
//  ShareMan
//
//  Created by apple on 2017/8/12.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YWAmendPhontDelegate <NSObject>
- (void)didCodeButton;
- (void)didNextButtonController;
- (void)phone:(NSString *)phone;
- (void)code:(NSString *)code;
@end
@interface YWAmendPhont : UIView
/** <#注释#> */
@property(nonatomic, assign) id<YWAmendPhontDelegate>delegaet;
/** <#注释#> */
@property(nonatomic, strong) NSString * strPhone;
- (instancetype)initWithFrame:(CGRect)frame WithString:(NSString *)string;
@end
