//
//  ShareingCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"

@protocol ShareingCollectionViewCellDelegate <NSObject>

- (void)orderid:(NSString *)order_id;

@end
@interface ShareingCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, assign) id<ShareingCollectionViewCellDelegate> delegate;
@end
