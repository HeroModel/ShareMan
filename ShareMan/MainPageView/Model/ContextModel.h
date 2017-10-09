//
//  ContextModel.h
//  ShareMan
//
//  Created by apple on 2017/9/23.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface ContextModel : BaseModel
/** 产品预览图 */
@property(nonatomic, copy) NSString * cover_fir;
/** 产品折旧费 */
@property(nonatomic, assign) double depreciation_count;
/** 意外保障金 */
@property(nonatomic, assign) NSInteger insurance;
/** 商品title */
@property(nonatomic, copy) NSString * introduce_title;
/** 产品原价 */
@property(nonatomic, assign) NSInteger original_price;
/** 产品共享价 */
@property(nonatomic, assign) NSInteger real_price;
/** 消息 */
@property(nonatomic, copy) NSString * message;
/** 图片 */
@property(nonatomic, copy) NSString * category_url;
/** 品牌 */
@property(nonatomic, copy) NSString * version;
/** 价钱 */
@property(nonatomic, assign) NSInteger amount;
/** 开始时间 */
@property(nonatomic, copy) NSString * startDate;
/** 结束时间 */
@property(nonatomic, copy) NSString * endDate;
/** 代金券ID */
@property(nonatomic, copy) NSString *voucherId;
@end
