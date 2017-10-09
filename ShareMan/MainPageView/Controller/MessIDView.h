//
//  MessIDView.h
//  ShareMan
//
//  Created by apple on 2017/8/30.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@protocol MessIDViewDelegate <NSObject>

- (void)name:(NSString *)name;
- (void)IdCardNo:(NSString *)IdCardNo;
- (void)company:(NSString *)company;
- (void)address:(NSString *)address;
- (void)password:(NSString *)pass;
@end
@interface MessIDView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<MessIDViewDelegate> delegate;
/** <#注释#> */
@property (nonatomic, strong) UITextField *nameText;
/** <#注释#> */
@property (nonatomic, strong) UITextField *numText;
/** <#注释#> */
@property(nonatomic, strong) UITextField * passWord;
/** <#注释#> */
@property (nonatomic, strong) UITextView *strText;
/** <#注释#> */
@property (nonatomic, strong) UITextView *addressText;
/** <#注释#> */
@property (nonatomic, strong) UILabel *strLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *addLabel;
/** <#注释#> */
@property(nonatomic, assign) BOOL  isHiddle;
@end
