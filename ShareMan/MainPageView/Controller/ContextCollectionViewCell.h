//
//  ContextCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/9/1.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"

@protocol ContextCollectionViewCellDelegate <NSObject>
- (void)didButtonAlertView;

@end
@interface ContextCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, assign) id<ContextCollectionViewCellDelegate> delegate;
@end
