//
//  OrderModel.h
//  ShareMan
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface OrderModel : BaseModel
/** 地址 */
@property(nonatomic, copy) NSString * address;//
/** 申请日期 */
@property(nonatomic, copy) NSString * create_time;//
/** 身份证 */
@property(nonatomic, copy) NSString * id_card_no;//
/** 姓名 */
@property(nonatomic, copy) NSString * name;//
/** 订单ID */
@property(nonatomic, copy) NSString * order_id;//
/** 价格 */
@property(nonatomic, assign) NSInteger real_price;//
///** 产品ID */
//@property(nonatomic, copy) NSString * product_id;
/** 产品型号 */
@property(nonatomic, copy) NSString * version;//
/** 串号 */
@property(nonatomic, copy) NSString * imei;//
/** 内存 */
@property(nonatomic, copy) NSString * memory;//
/** 共享日期 */
@property(nonatomic, copy) NSString * sign_date_a;//
/** 产品颜色 */
@property(nonatomic, copy) NSString * color_name;//
/** <#注释#> */
@property(nonatomic, assign) NSInteger status;
@end
