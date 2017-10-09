//
//  ApplyContextCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"
#import "OrderModel.h"

@protocol ApplyContextCollectionViewCellDelegate <NSObject>

- (void)didButtonAlert:(NSString *)order_id;
- (void)didButtonDismissAlert:(NSString *)order_id;
@end
@interface ApplyContextCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) id<ApplyContextCollectionViewCellDelegate>delegate ;
/** <#注释#> */
@property(nonatomic, assign) OrderModel * model;

@end
