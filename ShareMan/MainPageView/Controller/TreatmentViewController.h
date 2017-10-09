//
//  TreatmentViewController.h
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@protocol TreatmentViewControllerDelegate <NSObject>

- (void)passAmount:(NSString *)amount
        totalPrice:(NSString *)totalPrice;
- (void)orderID:(NSString *)orderID;
@end
@interface TreatmentViewController : BaseViewController
/** <#注释#> */
@property(nonatomic, copy) NSString * orderId;
/** <#注释#> */
@property(nonatomic, assign) id<TreatmentViewControllerDelegate> delegate;
@end
