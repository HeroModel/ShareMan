//
//  OrderAlertView.h
//  ShareMan
//
//  Created by apple on 2017/8/29.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseView.h"

@protocol OrderAlertViewDelegate <NSObject>

- (void)didDismissView;
- (void)didConfirmButton;

@end
@interface OrderAlertView : BaseView
/** <#注释#> */
@property(nonatomic, assign) id<OrderAlertViewDelegate> delegate;
@end
