//
//  AddresstableViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "IDPersonallModel.h"

@protocol AddresstableViewCellDelegate <NSObject>

- (void)didDeleteButton:(NSInteger)count;
- (void)didEditButton:(NSInteger)count
        consigneeName:(NSString *)consigneeName
         consigneeTel:(NSString *)consigneeTel
     consigneeAddress:(NSString *)consigneeAddress
        detailAddress:(NSString *)detailAddress;

@end
@interface AddresstableViewCell : BaseTableViewCell
/** <#注释#> */
@property(nonatomic, assign) id<AddresstableViewCellDelegate>delegate;
/** <#注释#> */
@property(nonatomic, assign) IDPersonallModel * model;
@end
