//
//  YWAlertView.h
//  ShareMan
//
//  Created by apple on 2017/8/10.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YWAlertViewDelegate <NSObject>

- (void)upDateNickName:(NSString *)string;

@end
@interface YWAlertView : UIView
/** <#注释#> */
@property(nonatomic, strong) UITextField * textField;
/** <#注释#> */
@property(nonatomic, assign) id<YWAlertViewDelegate> delegate;
- (void)show;
@end
