//
//  ShareModel.h
//  ShareMan
//
//  Created by apple on 2017/9/15.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "BaseModel.h"

@interface ShareModel : BaseModel
/** 上边图片 */
@property(nonatomic, copy) NSString * top_show;
/** 下边图片 */
@property(nonatomic, copy) NSString * bot_show;
/** 品牌 */
@property(nonatomic, copy) NSString * version;
/** 芝麻信用 */
@property(nonatomic, copy) NSString * zmxy_score;
/** 逾期记录 */
@property(nonatomic, copy) NSString * hygz_level;
@end
