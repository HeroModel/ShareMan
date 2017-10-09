//
//  RecyclingCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"

@protocol RecyclingCollectionViewCellDelegate <NSObject>

- (void)didButtonAlertView;

@end
@interface RecyclingCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) id<RecyclingCollectionViewCellDelegate> delegate;
@end
