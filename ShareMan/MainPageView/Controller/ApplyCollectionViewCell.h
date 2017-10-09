//
//  ApplyCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"

@protocol ApplyCollectionViewCellDelegate <NSObject>

- (void)didBUttonPushPlayVC:(NSString *)order_id;
- (void)didBUttonPushDismissVC:(NSString *)order_id;
@end
@interface ApplyCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) id<ApplyCollectionViewCellDelegate> delegate;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end
