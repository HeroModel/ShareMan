//
//  AccountModel.h
//  ShareMan
//
//  Created by apple on 2017/9/14.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface AccountModel : BaseModel

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

+ (instancetype)sharedAccountModel;

+(void)attemptDealloc;
@end
