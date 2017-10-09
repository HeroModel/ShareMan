//
//  Finshed_YouHu_CollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"
#import "OrderModel.h"
@protocol Finshed_YouHu_CollectionViewCellDelegate <NSObject>

- (void)deleteOrder:(NSString *)order_id;

@end
@interface Finshed_YouHu_CollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) OrderModel * model;
/** <#注释#> */
@property(nonatomic, assign) id<Finshed_YouHu_CollectionViewCellDelegate> delegate;
@end
