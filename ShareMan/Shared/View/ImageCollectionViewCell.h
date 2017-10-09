//
//  ImageCollectionViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaceCollectionViewCell.h"
#import "ShareModel.h"
@interface ImageCollectionViewCell : BaceCollectionViewCell
/** <#注释#> */
@property(nonatomic, strong) UIImageView * phoneImage;
/** <#注释#> */
@property(nonatomic, strong) UIImageView * phones;
/** <#注释#> */
@property(nonatomic, assign) ShareModel * model;
@end
