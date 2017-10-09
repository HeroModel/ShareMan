//
//  ParameterTableViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/21.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTableViewCell.h"
@protocol ParameterTableViewCellDelegate <NSObject>

- (void)offset:(NSInteger)index;

@end
@interface ParameterTableViewCell : BaseTableViewCell
/** <#注释#> */
@property(nonatomic, strong) UICollectionView * collectionView;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * bigImage;
/** <#注释#> */
@property(nonatomic, assign) id<ParameterTableViewCellDelegate> delegate;
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * array;
@end
