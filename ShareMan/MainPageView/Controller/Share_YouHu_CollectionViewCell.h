//
//  Share_YouHu_CollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"
#import "OrderModel.h"

@protocol Share_YouHu_CollectionViewCellDelegate <NSObject>

- (void)order_id:(NSString *)order_id;

@end
@interface Share_YouHu_CollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) OrderModel * model;
/** <#注释#> */
@property(nonatomic, assign) id<Share_YouHu_CollectionViewCellDelegate> delegate;
@end
