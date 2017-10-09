//
//  YWStringAlertView.h
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@interface YWStringAlertView : BaseView
- (instancetype)initWithFrame:(CGRect)frame WtihString:(NSString *)string;
- (void)show;
@end
