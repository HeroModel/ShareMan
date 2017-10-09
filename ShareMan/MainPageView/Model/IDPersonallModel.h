//
//  IDPersonallModel.h
//  ShareMan
//
//  Created by apple on 2017/9/16.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface IDPersonallModel : BaseModel
/** 手机号 */
@property(nonatomic, copy) NSString * phone_number;
/** 标识符 */
@property(nonatomic, copy) NSString * token;
/** 地址 */
@property(nonatomic, copy) NSString * address;
/** 单位 */
@property(nonatomic, copy) NSString * company;
/** ID */
@property(nonatomic, copy) NSString * strID;
/** 图片A */
@property(nonatomic, copy) NSString * id_card_a;
/** 图片B */
@property(nonatomic, copy) NSString * id_card_b;
/** 图片C */
@property(nonatomic, copy) NSString * id_card_on_hand;
/** 图片D */
@property(nonatomic, copy) NSString * student_id_card;
/** 名字 */
@property(nonatomic, copy) NSString * name;
/** 服务密码 */
@property(nonatomic, copy) NSString * service_password;
/** 身份证 */
@property(nonatomic, copy) NSString * id_card_no;
/** 轮播图 */
@property(nonatomic, copy) NSString * preview;
/** 商品颜色 */
@property(nonatomic, copy) NSString * color;
/** 省市区 */
@property(nonatomic, copy) NSString * consignee_address;
/** 姓名 */
@property(nonatomic, copy) NSString * consignee_name;
/** 电话号 */
@property(nonatomic, copy) NSString * consignee_tel;
/** 详细地址 */
@property(nonatomic, copy) NSString * detail_address;
/** 当前型号的最低折旧费 */
@property(nonatomic, assign) double depreciation_count;//
/** 图文详情 */
@property(nonatomic, copy) NSString * graphics;//
/** 当前型号商品最高原价 */
@property(nonatomic, assign) NSInteger original_price;//
/** 产品参数 */
@property(nonatomic, copy) NSString * params;//
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * productImages;
/** 产品最低共享价 */
@property(nonatomic, assign) NSInteger  real_price;//
/** <#注释#> */
@property(nonatomic, strong) NSMutableArray * tagBean_list;
/** 性别 */
@property(nonatomic, assign) NSInteger gender;
/** 昵称 */
@property(nonatomic, copy) NSString * nickname;
/** 头像 */
@property(nonatomic, copy) NSString * portrait;
/** 轮播图 */
@property(nonatomic, copy) NSString * carousel;
/** 商品 */
@property(nonatomic, copy) NSString * version;
@end
