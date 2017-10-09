//
//  FinshedCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"

@protocol FinshedCollectionViewCellDelegate <NSObject>

- (void)delegeDismissOrder:(NSString *)order_id;

@end
@interface FinshedCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
/** <#注释#> */
@property(nonatomic, assign) id<FinshedCollectionViewCellDelegate> delegate;
@end
