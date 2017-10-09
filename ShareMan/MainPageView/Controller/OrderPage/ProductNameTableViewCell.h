//
//  ProductNameTableViewCell.h
//  ShareMan
//
//  Created by apple on 2017/8/19.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface ProductNameTableViewCell : BaseTableViewCell
/** 产品名字 */
@property(nonatomic, strong) UILabel * productLabel;
/** 价格 */
@property(nonatomic, strong) UILabel * priceLabel;
/** 折旧费 */
@property(nonatomic, strong) UILabel * oldLabel;
/** 钱 */
@property(nonatomic, strong) UILabel * label;
@end
