//
//  PayTableViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/25.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface PayTableViewCell : BaseTableViewCell
/** <#注释#> */
@property(nonatomic, strong) UIImageView * payImage;
/** <#注释#> */
@property(nonatomic, strong) UILabel * label;
/** <#注释#> */
@property(nonatomic, strong) UIButton * butt;
/** <#注释#> */
@property(nonatomic, assign) BOOL isSelected;

@end
