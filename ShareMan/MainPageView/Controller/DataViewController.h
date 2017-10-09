//
//  DataViewController.h
//  ShareMan
//
//  Created by apple on 2017/8/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseViewController.h"

@protocol DataViewControllerDelegate <NSObject>

- (void)upNicknameText:(NSString *)text;

@end
@interface DataViewController : BaseViewController
/** <#注释#> */
@property(nonatomic, assign) id<DataViewControllerDelegate> delegate;
@end
